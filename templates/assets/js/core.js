console.log('%c DNXRZL %c MaterialYour ','color:#fff;background:#6cf;padding:5px 0;border: 1px solid #6cf;','color:#6cf;background:none;padding:5px 0;border: 1px solid #6cf;')

const dnxrzl = {
  //顶部应用栏向下滚动加阴影
  addShadow() {
    let head = $("#selfAppbar");
    $(document).scroll(function() {
      if ($(document).scrollTop() > 1) {
        head.removeClass("mdui-shadow-0");
      } else {
        head.addClass("mdui-shadow-0");
      }
    });
  },
  //文章页内封面图片大小随窗口宽度变化而变化
  autoImg() {
    var i = 1;
    $(window).resize(function () {
      if (i == 1) {
        i++;
        dnxrzl.autoImg();
      }
    });
    if (window.innerWidth >= 700 && window.innerWidth < 900) {
      $(".postBackground").css("height", "270px");
    } else if (window.innerWidth >= 900) {
      $(".postBackground").css("height", "290px");
    } else {
      $(".postBackground").css("height", "220px");
    }
  },
  //文章页内分享链接复制
  copyLink() {
    let postclipboard = new ClipboardJS(".postCopyLink");
    postclipboard.on("success", function (e) {
      mdui.snackbar({
        //调用mdui前端框架里的snackbar()方法显示提示信息
        message: "已复制",
        position: "left-bottom",
      });
    });
  },
  //页脚时间：年 的显示
  gettime () {
    var date = new Date();
    $("#timeyear").text(date.getFullYear());
  },
  //获取主题色
  getcolor () {
    let body = $("body");
    let bc = $(".mdui-toolbar").css("background-color");
    let bct = $(".mdui-toolbar").css("color");
    body.css({ "--themeColor": bc, "--fontColor": bct });
  },
  //每日时间问候
  welcome () {
    var welcome = $(".welcome_hello");
    var hour = new Date().getHours();
    if (hour >= 6 && hour < 12) {
      welcome.text("早上好！");
    } else if (hour >= 12 && hour < 14) {
      welcome.text("中午好！");
    } else if (hour >= 14 && hour < 19) {
      welcome.text("下午好！");
    } else if (hour >= 19 && hour < 22) {
      welcome.text("晚上好！");
    } else {
      welcome.text("晚安！");
    }
  },
  //回到顶部
  totop () {
    $(".totop").click(function () {
      $("html,body").animate({ scrollTop: 0 }, 300);
    });

    $(window).scroll(function () {
      if ($(window).scrollTop() > 800) {
        $(".totop").fadeIn(300);
      } else {
        $(".totop").fadeOut(300);
      }
    });
  },
  //说说点赞
  journlike () {
    $(document).on("click", ".likeb", function () {
      var likeNum = $(this).attr("id");
      let lid = $(this);
      if (lid.attr("clickNum") == "true") {
        lid.attr("clickNum", "false");
        $.ajax({
          url: "/api/content/journals/" + likeNum + "/likes",
          type: "POST",
          async: true,
          crossDomain: true,
          headers: {},
          success: function (data) {
            lid.children("i").addClass("journliked");
            lid.children("span").addClass("journliked");
            lid.children("span").text(parseInt(lid.children("span").text()) + 1);
          },
          timeout: 3000,
          error: function () {
            mdui.snackbar({
              message: "网络请求失败，请稍后再试",
              position: "left-bottom",
            });
          },
        });
      } else {
        mdui.snackbar({
          message: "已经赞过啦~",
          position: "left-bottom",
        });
      }
    });
  },
  //说说评论
  journComment () {
    $(document).on("click", ".chatb", function () {
      $(this).parents(".journBottom").next().toggle();
    });
  },
  //图片预览初始化
  picInit () {
    if (window.location.pathname.search("/photos") != -1) {
      var psrc = $(".grid img");
    } else {
      var psrc = $(".mdui-typo img");
    }
    psrc.each(function () {
      $(this)
        .parent()
        .attr({
          "data-fancybox": "gallery",
          "data-src": $(this).attr("src"),
        });
    });
  },
  //文章目录随窗口变化而变化（移动端样式和PC端样式的切换）
  switchIndex () {
    tocbot.init({
      tocSelector: ".toc-content",
      contentSelector: ".js-toc-content",
      headingSelector: "h1, h2, h3, h4, h5, h6",
      headingsOffset: 80,
      scrollSmoothOffset: -80,
    });
    if (postyes == "post" && $(".toc-content").children().length != 0) {
      $(".toc_drawer,.toc_button").css("display", "block");
      $("body").addClass("mdui-drawer-body-right");
      $('.nodesk').css('display','none');
    }

    var md = mdui.$;
    md(".mdui-appbar").on("pin.mdui.headroom", function () {
      $(".toc_drawer").animate({ top: "64px" }, 300);
      $(".toc-content").css("height", "calc(100vh - 125px)");
    });
    md(".mdui-appbar").on("unpin.mdui.headroom", function () {
      $(".toc_drawer").animate({ top: "0px" }, 300);
      $(".toc-content").css("height", "calc(100vh - 65px)");
    });
    let i = 1;
    $(window).resize(function () {
      if (window.innerWidth < 1024 && i == 1) {
        $(".toc_drawer").removeClass("mdui-drawer-open");
        i = 2;
      } else if (window.innerWidth > 1024) {
        i = 1;
      }
    });
  },
  //faccybox的实例（负责图片预览）
  mfancybox () {
    Fancybox.bind("[data-fancybox]", {
      Thumbs: false,
      Image: {
        zoom: true,
      },
      Toolbar: {
        display: ["zoom", "download", "close"], //灯箱顶部小工具
      },
    });
  },
  //相册图片的瀑布流显示和分类显示
  mistope () {
    //图片瀑布流
    var $grid = $(".grid").isotope({
      itemSelector: ".grid-item",
      percentPosition: true,
      layoutMode: "masonry",
      masonry: {
        columnWidth: ".grid-item",
      },
    });
    $grid.imagesLoaded().progress(function () {
      $grid.isotope();
    });

    //图片分类
    var md = mdui.$;
    var inst = new mdui.Tab("#tab");
    md("#tab").on("change.mdui.tab", function (event) {
      let mfilter = "." + event._detail.id;
      if (mfilter == ".all") {
        $grid.isotope({ filter: "" });
      } else {
        $grid.isotope({ filter: mfilter });
      }
    });
  },
  //一键加载内容列表
  ajaxPostLists () {
    $("#loadData").on("click", function () {
      $("#loadData").text('加载中...')
      $.ajax({
        url: $(this).attr("data-href"),
        type: "GET",
        success: (data)=> {
          let nextPageUrl = $(data).find("#loadData").attr("data-href");

          if ($(this).attr("data-href").search("journals") != -1) {
            //日志页
            $(".journalList .journItem:last-child").after($(data).find(".journalList .journItem"));
            dnxrzl.picInit(); //初始化图箱
            darkMode.firstDark(); //评论黑暗模式重载
            dnxrzl.dealCodeHighlight(); //代码高亮重载
            dnxrzl.table(); //表格重载
            } else if ($(this).attr("data-href").search("archives") != -1) {
            // 归档页
            let aperList = [];
            $('.archives .archMain .archCell .archiveyear').each(function(){//通过对归档年份遍历获取每页最后一年
              aperList.push(parseInt($(this).text()))
            })
            let aper = aperList[aperList.length-1]; //前时间
            let aafter = parseInt($(data).find(".archMain .archCell:first-child .archiveyear").text()); //后时间
            let archCont = $(data).find(".archMain");
            if (aper == aafter) {
              archCont.find(".archCell:first-child .archiveyear")[0].remove();
              $(".archMain:last-child").after(archCont);
            } else {
              $(".archMain:last-child").after(archCont);
            }
          } else {
            $("#pload article:last-child").after($(data).find("#pload > article")); //其他页面（首页、分类、标签、搜索）
            dnxrzl.mylazyload();
          }

          $("#loadData").text('加载更多');
          if (nextPageUrl != undefined) {
            $("#loadData").attr("data-href", nextPageUrl);
          } else {
            $(".nextPage").html(`<button class="mdui-ripple">没有了</button>`);
          }
        },
        timeout: 3000,
        error: ()=> {
          mdui.snackbar({
            message: "未响应！",
            position: "left-bottom",
          });
        },
      });
    });
  },
  //搜索按钮逻辑实现
  searchNew () {
    let dform = $(".searchInput");
    let dfinput = $(".searchInput input");
    let searchMask = $(".searchMask");
    let body = $("body");
    let appbar = $("header .mdui-appbar");
    $(document).on("click", ".searchNew,.searchInput .back", function () {
      if (dform.css("display") == "none") {
        dform.css("display", "flex");
        dfinput.focus();
        searchMask.css("display", "block").animate({ opacity: 0.5 }, 300, function () {
          body.css("overflow", "hidden");
          appbar.removeClass("mdui-headroom");
        });
      } else {
        dform.css("display", "none");
      }
    });

    dfinput.blur(function () {
      dform.css("display", "none");
      searchMask.animate({ opacity: 0 }, 300, function () {
        searchMask.css("display", "none");
        body.css("overflow", "initial");
        appbar.addClass("mdui-headroom");
      });
    });

    $(document).on("mousedown", ".backClose", function () {
      event.preventDefault();
      dfinput.val("");
      dform.removeClass("notEmoty");
    });
    $(".searchInput input").bind("input propertychange", function (event) {
      if (dfinput.val().length != 0) {
        dform.addClass("notEmoty");
      } else {
        dform.removeClass("notEmoty");
      }
    });
  },
  //一言
  oneWord () {
    if (oneWord != "false") {
      $.ajax({
        url: "https://v1.hitokoto.cn/" + mconfig,
        type: "GET",
        dataType: "json",
        data: aWordConfig,
        async: true,
        crossDomain: true,
        success: function (data) {
          $(".welcome_descr").text(data.hitokoto + "——" + (data.from_who != null ? data.from_who : "") + "「" + (data.from != null ? data.from : "") + "」");
        },
      });
    }
  },
  //图片懒加载
  mylazyload () {
    let img = $(".lazyloadImg");
    img.lazyload();
  },
  //代码复制
  codeCopy () {
    let clipboard = new ClipboardJS(".mybtn");
    clipboard.on("success", function (e) {
      // console.log('jjj');
      e.clearSelection(); //清除选中样式（蓝色）
      mdui.snackbar({
        //调用mdui前端框架里的snackbar()方法显示提示信息
        message: "已复制",
        position: "left-bottom",
      });
    });
  },
  //代码高亮部分处理，引用https://github.com/LIlGG/halo-theme-sakura/blob/2ea256e0bf8b55bc62c7cf942675facfb4d9c04b/script/app.js#L387
  dealCodeHighlight () {
    var hljsNum = 1;
    $(".mdui-typo pre").each(function () {
      $(this)
        .children("code")
        .attr("id", "hljs" + hljsNum);
      var copyButton = '<button class="mybtn" data-clipboard-target="' + "#hljs" + hljsNum + '" mdui-tooltip="{content: \'复制\'}"><i class="mdui-icon material-icons">content_copy</i></button>';
      hljsNum++;
      $(this).append(copyButton);
      var $code = $(this).children("code");
      var classNameStr = $code[0].className;
      var classNameArr = classNameStr.split(" ");

      var lang = "";
      classNameArr.some(function (className) {
        if (className.indexOf("language-") > -1) {
          lang = className.substring(className.indexOf("-") + 1, className.length);
          return true;
        }
      });

      //检测语言是否存在，不存在则自动检测
      var language = hljs.getLanguage(lang.toLowerCase());
      if (language == undefined) {
        // 启用自动检测
        var autolanguage = hljs.highlightAuto($code.text());
        $code.removeClass("language-" + lang);
        lang = autolanguage.language;

        if (lang == undefined) {
          lang = "text";
        }
        $code.addClass("language-" + lang);
      }
    });

    //行号
    $(".mdui-typo pre code").each(function (i, block) {
      hljs.lineNumbersBlock(block);
    });
    //高亮初始化
    $(".mdui-typo pre code").each(function () {
      if (!$(this).hasClass("inited")) {
        hljs.highlightElement(this);
        $(this).addClass("inited");
      }
    });
  },
  //自动黑暗模式开启一次性提示
  autoDarkTips () {
    if (localStorage.getItem("autoDark") == "true" && localStorage.getItem("darkTipsOk") == null) {
      localStorage.setItem("darkTipsOk", 0);
      mdui.snackbar({
        //调用mdui前端框架里的snackbar()方法显示提示信息
        message: "已自动切换黑暗模式🌙",
        position: "right-top",
      });
    }
  },
  //文章表格支持
  table () {
    $(".mdui-typo>table").addClass("mdui-table mdui-table-hoverable").wrap('<div class="mdui-table-fluid">');
  },
  like_post() {
    $(document).on("click", ".like_button", function () {
      var likeNum = $(this).attr("id");
      let lid = $(this);
      if (lid.attr("clickNum") == "true") {
        lid.attr("clickNum", "false");
        $.ajax({
          url: "/api/content/posts/" + likeNum + "/likes",
          type: "POST",
          async: true,
          crossDomain: true,
          headers: {},
          success: function (data) {
            lid.addClass("activeLike");
            lid.children("span").text(parseInt(lid.children("span").text()) + 1 + ' 赞');
          },
          timeout: 3000,
          error: function () {
            mdui.snackbar({
              message: "网络请求失败，请稍后再试",
              position: "left-bottom",
            });
          },
        });
      } else {
        mdui.snackbar({
          message: "已经赞过啦~",
          position: "left-bottom",
        });
      }
    });
  }
};

!(function () {
  document.addEventListener("DOMContentLoaded", function () {
    // Object.values(dnxrzl).forEach((f) => f());
    // dnxrzl.searchNew();
    dnxrzl.welcome();
    dnxrzl.mylazyload();
    dnxrzl.getcolor();
    dnxrzl.addShadow();
    dnxrzl.copyLink();
    dnxrzl.switchIndex();
    dnxrzl.ajaxPostLists();
    dnxrzl.autoImg();
    dnxrzl.gettime();
    dnxrzl.oneWord();
    dnxrzl.picInit();
    dnxrzl.mfancybox();
  });
})();