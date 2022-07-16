const darkMode = {
  /**评论组件的黑暗模式处理
   * 目前官方评论组件比较玄学，configs配置不生效、fly组件min.js大小有1mb多、黑夜模式似乎还在开发中...
   * 下面的这两个函数commentInit(),commentDark()是为fly评论组件注入黑暗模式css样式和切换的，但现在换成了
   * normal组件，这个组件的开发版本已经支持黑暗模式了，所以，下面的css注入暂且注释掉，但以后还会用到，因为它可以实现评论样式的自定义
   *
   */
  commentInit: function () {
    //初始化评论组件黑暗模式css
    let offCssDark = true;
    if ($("halo-comment").length > 0 && offCssDark) {
      // var comments = $("halo-comment");
      // comments.each(function(){
      //     // console.log($(this));
      //     var commentStyle = $("#comment-style").clone();
      //     commentStyle.attr("media", "all");
      //     for (var i = 0; i < $(this).length; i++) {
      //         let sf = $($(this)[i].shadowRoot).has('#comment-style').length;
      //         if(sf != 1){ //避免重复注入css
      //             $(this)[i].shadowRoot.appendChild(commentStyle[0]); //注入css
      //         }
      //     }
      // })

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
        $(shadowDom).addClass("dark");
      }
    } else {
      var comments = $("halo-comment");
      for (var i = 0; i < comments.length; i++) {
        var shadowDom = comments[i].shadowRoot.getElementById("halo-comment");
        $(shadowDom).removeClass("dark");
      }
    }
  },
  setFlag: function () {
    localStorage.setItem("night", "true");
  },
  removeFlag: function () {
    localStorage.setItem("night", "false");
  },
  getFlag: function (key) {
    return localStorage.getItem(key);
  },

  setDark: function () {
    $("body").addClass("mdui-theme-layout-dark");
  },
  removeDark: function () {
    $("body").removeClass("mdui-theme-layout-dark");
  },

  firstDark: function () {
    if (this.getFlag("night") == "true") {
      this.setDark();
      let commentyes = this.commentInit();
      if (commentyes) {
        this.commentDark("true");
      }
    } else {
      this.removeFlag();
      this.removeDark();
      let commentyes = this.commentInit();
      if (commentyes) {
        this.commentDark("false");
      }
    }
  },
  clickDark: function () {
    $(".darkButton").on("click", () => {
      if (this.getFlag("night") != "true") {
        this.setFlag();
        this.setDark();
        dnxrzl.getcolor();
        let commentyes = this.commentInit();
        if (commentyes) {
          this.commentDark("true");
        }
      } else {
        this.removeFlag();
        this.removeDark();
        dnxrzl.getcolor();
        let commentyes = this.commentInit();
        if (commentyes) {
          this.commentDark("false");
        }
      }
    });
  },
  autoDark: function () {
    if (autoDarkOpt) {
      let hour = new Date().getHours();
      if (hour >= 18 || hour < 6) {
        this.setFlag();
        localStorage.setItem("autoDark", "true");
      } else {
        if (localStorage.getItem("autoDark") != "false") {
          localStorage.setItem("autoDark", "false");
          this.removeFlag();
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
