const darkMode = {
  /**评论组件的黑暗模式处理
   * 目前官方评论组件比较玄学，configs配置不生效、fly组件min.js大小有1mb多、黑夜模式似乎还在开发中...
   * 下面的这两个函数commentInit(),commentDark()是为fly评论组件注入黑暗模式css样式和切换的，但现在换成了
   * normal组件，这个组件的开发版本已经支持黑暗模式了，所以，下面的css注入暂且注释掉，但以后还会用到，因为它可以实现评论样式的自定义
   *
   */
  commentInit: function () {
    //初始化评论组件黑暗模式css
    if ($("halo-comment").length > 0) {
      var comments = $("halo-comment");
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
  commentDark: function (isDark) {
    //切换评论组件黑暗模式
    if (isDark == "true") {
      var comments = $("halo-comment");
      for (var i = 0; i < comments.length; i++) {
        var shadowDom = comments[i].shadowRoot.getElementById("halo-comment");
        $(shadowDom).removeClass("light"); //halo-comment-normal去掉默认light
        $(shadowDom).addClass(comment_darkClass);
      }
    } else {
      var comments = $("halo-comment");
      for (var i = 0; i < comments.length; i++) {
        var shadowDom = comments[i].shadowRoot.getElementById("halo-comment");
        $(shadowDom).removeClass(comment_darkClass);
      }
    }
  },

  //黑夜模式状态标志量
  flagCore: function (is) {
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
  setCore: function (is) {
    switch(is){
			case 1://开启黑夜模式
				$("body").addClass("mdui-theme-layout-dark");
				break
			default://关闭黑夜模式
				$("body").removeClass("mdui-theme-layout-dark");
		}
  },
  //页面打开对黑暗模式的判断和设置
  firstDark: function () {
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
  clickDark: function () {
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
  autoDark: function () {
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
    darkMode.autoDark();
    darkMode.firstDark();
  });
})();