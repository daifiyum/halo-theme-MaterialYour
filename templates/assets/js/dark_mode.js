const darkMode = {
  commentInit () {
    //初始化评论组件黑暗模式css
    if ($("#comment").length > 0) {
      var comments = $("#comment>div");
      comments.each(function(){
          // console.log($(this));
          var commentStyle = $("#comment-style").clone();
          commentStyle.attr("media", "all");
          for (var i = 0; i < $(this).length; i++) {
              let sf = $($(this)[i].shadowRoot).has('#comment-style').length;
              // console.log(sf);
              if(sf != 1){ //避免重复注入css
                  $(this)[i].shadowRoot.appendChild(commentStyle[0]); //注入css
              }
          }
      })

      return true;
    } else {
      return false;
    }
  },
  commentDark (isDark) {
    function cdc(){
      if(isDark == "true"){
        $(comment).removeClass('light');
        $(comment).addClass('dark');
      }else {
        $(comment).removeClass('dark');
      }
    }
    var comment = $("#comment>div")[0].shadowRoot.querySelector(".halo-comment-widget");
    if(comment == null){
      var scanElement = setInterval(function(){
          comment = $("#comment>div")[0].shadowRoot.querySelector(".halo-comment-widget");
          if(comment != null){
            clearInterval(scanElement);
            cdc();
          }
      },1);
    }
    cdc();
    
  },

  //黑夜模式状态标志量
  flagCore (is) {
    switch(is){
			case 1://设置为黑夜模式
				localStorage.setItem("night", "true");
				break
			case 2://关闭黑夜模式
				localStorage.setItem("night", "false");
				break
			default://得到黑夜模式状态
				return localStorage.getItem('night');
		}
  },
  //黑夜模式类选择器的控制
  setCore (is) {
    switch(is){
			case 1://开启黑夜模式
				$("body").addClass("mdui-theme-layout-dark");
				break
			default://关闭黑夜模式
				$("body").removeClass("mdui-theme-layout-dark");
		}
  },
  //页面打开对黑暗模式的判断和设置
  firstDark () {
    if (this.flagCore() == "true") {
      this.setCore(1);
      let commentyes = this.commentInit();
      if (commentyes) {
        this.commentDark("true");
      }
    } else {
      this.flagCore(2);
      this.setCore();
      let commentyes = this.commentInit();
      if (commentyes) {
        this.commentDark("false");
      }
    }
  },
  //手动点击开关黑暗模式
  clickDark () {
    $(".darkButton").on("click", () => {
      if (this.flagCore() != "true") {
        this.flagCore(1);
        this.setCore(1);
        dnxrzl.getcolor();
        let commentyes = this.commentInit();
        if (commentyes) {
          this.commentDark("true");
        }
      } else {
        this.flagCore(2);
        this.setCore();
        dnxrzl.getcolor();
        let commentyes = this.commentInit();
        if (commentyes) {
          this.commentDark("false");
        }
      }
    });
  },
  //自动开启黑暗模式
  autoDark () {
    if (autoDarkOpt) {
      let hour = new Date().getHours();
      if (hour >= 18 || hour < 6) {
        this.flagCore(1);
        localStorage.setItem("autoDark", "true");
      } else {
        if (localStorage.getItem("autoDark") != "false") {
          localStorage.setItem("autoDark", "false");
          this.flagCore(2);
          localStorage.removeItem('darkTipsOk');
        }
      }
    }
  },
};

!(function () {
  document.addEventListener("DOMContentLoaded", () => {
    darkMode.clickDark();
    // darkMode.autoDark();
    darkMode.firstDark();
  });
})();