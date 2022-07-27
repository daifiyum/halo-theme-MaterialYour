console.log("\n %c Dnxrzl " + " %c MaterialYour %c \n", "color:#fff;background:#6cf;padding:5px 0;border: 1px solid #6cf;", "color:#6cf;background:none;padding:5px 0;border: 1px solid #6cf;", "");
console.log("菩萨保佑，没有报错🙏🙏🙏");
const dnxrzl = {
  //顶部应用栏向下滚动加阴影
  dnScroll: function () {
    var i = 1;
    $(document).scroll(function () {
      if (i == 1) {
        //阻止递归死循环
        i++;
        dnxrzl.dnScroll();
      }
    });
    let head = $("#selfAppbar");
    if ($(document).scrollTop() > 1) {
      head.removeClass("mdui-shadow-0");
    } else {
      head.addClass("mdui-shadow-0");
    }
  },
  //文章页内封面图片大小随窗口宽度变化而变化
  autoImg: function () {
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
  copyLink: function () {
    let postclipboard = new ClipboardJS(".postCopyLink");
    postclipboard.on("success", function (e) {
      mdui.snackbar({
        //调用mdui前端框架里的snackbar()方法显示提示信息
        message: "已复制",
        position: "right-top",
      });
    });
  },
  //页脚时间：年 的显示
  gettime: function () {
    var date = new Date();
    $("#timeyear").text(date.getFullYear());
  },
  //获取主题色
  getcolor: function () {
    let body = $('body');
    let bc = $(".mdui-toolbar").css("background-color");
    let bct = $(".mdui-toolbar").css("color");
    body.css({"--themeColor": bc, "--fontColor": bct});
  },
  //每日时间问候
  welcome: function () {
    var welcome = $(".welcome_hello");
    var hour = new Date().getHours();
    if (hour >= 6 && hour < 12) {
      welcome.text("早上好!");
    } else if (hour >= 12 && hour < 14) {
      welcome.text("中午好!");
    } else if (hour >= 14 && hour < 19) {
      welcome.text("下午好!");
    } else if (hour >= 19 && hour < 22) {
      welcome.text("晚上好!");
    } else {
      welcome.text("晚安!");
    }
  },
  //回到顶部
  totop: function () {
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
  journlike: function () {
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
  journComment: function () {
    $(document).on("click", ".chatb", function () {
      $(this).parents(".journBottom").next().toggle();
    });
  },
  //图片预览初始化
  picInit: function () {
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
  switchIndex: function () {
      tocbot.init({
        tocSelector: ".toc-content",
        contentSelector: ".js-toc-content",
        headingSelector: "h1, h2, h3, h4, h5, h6",
        headingsOffset: 80,
        scrollSmoothOffset: -80,
      });
      
      if(postyes == 'true' && $('.toc-content').children().length != 0) {
        $('.swmenu').css('display','none');
        $('.toc-content').css('display','block');
      }else {
        $('.swtoc,.ptoc').css('display','none');
      }
      $(document).on('click','.swtocl',function(){
        console.log($(this).attr('data-toggle'));
        if($(this).attr('data-toggle') == 'toc'){
          $('.toc-content').fadeToggle(function(){
            $('.swmenu').fadeToggle();
          });
          
          $(this).attr('data-toggle','menu');
          $(this).text('菜单')
        }else{
          $('.swmenu').fadeToggle(function(){
            $('.toc-content').fadeToggle();
          });
          $(this).attr('data-toggle','toc');
          $(this).text('目录')
        }
        
        
      })



      
  },
  //faccybox的实例（负责图片预览）
  mfancybox: function () {
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
  mistope: function () {
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
  ajaxPostLists: function () {
    let loadingText = $(".loadingText");
    let loadingSvg = $(".loadingSvg");
    let ajaxPostLists = $("button.ajaxPostLists");
    $("button.ajaxPostLists").on("click", function () {
      //currentPageUrl获取本页面内的下一页Url
      let currentPageUrl = $("button.ajaxPostLists").attr("data-href");
      if (ajaxPostLists.attr("data-href") != "null") {
        loadingText.addClass("reloadingText");
        loadingSvg.addClass("startLoadingSvg");
        $.ajax({
          url: currentPageUrl,
          type: "GET",
          dataType: "html",
          async: false,
          crossDomain: true,
          success: function (data) {
            //netPageUrl获取本页面下一页内的下一页Url
            let nextPageUrl = $(data).find("button.ajaxPostLists").attr("data-href");
            let loadTime = setTimeout(() => {
              //加个延时好显示'正在加载...'提示
              clearTimeout(loadTime); //加载前清除上一次点击定时器，阻止猛击时定时器时间累计
              if (currentPageUrl.search("journals") != -1) {
                //日志页
                $(".journalList .journItem:last-child").after($(data).find(".journalList .journItem"));
                dnxrzl.picInit(); //初始化图箱
                darkMode.firstDark(); //评论黑暗模式重载
                dnxrzl.dealCodeHighlight(); //代码高亮重载
                dnxrzl.table();//表格重载
              } else if (currentPageUrl.search("archives") != -1) {
                // 归档页
                let aper = parseInt($(".archMain .archCell:last-child .archiveyear").text()); //前时间
                let aafter = parseInt($(data).find(".archMain .archCell:first-child .archiveyear").text()); //后时间
                let archCont = $(data).find(".archMain");
                if (aper == aafter) {
                  archCont.find(".archCell:first-child .archiveyear")[0].remove();
                  $(".archMain:last-child").after(archCont);
                } else {
                  $(".archMain:last-child").after(archCont);
                }
              } else {
                $(".post-list article:last-child").after($(data).find(".post-list > article")); //其他页面（首页、分类、标签、搜索）
                dnxrzl.mylazyload();
              }
              if (nextPageUrl == undefined) {
                loadingText.text("没有啦");
                loadingText.removeClass("reloadingText");
                loadingSvg.removeClass("startLoadingSvg");
              } else {
                loadingText.removeClass("reloadingText");
                loadingSvg.removeClass("startLoadingSvg");
              }
            }, 300);

            if (nextPageUrl == undefined) {
              //判断本页面内是否还有下一页，没有就添加标记'null',当加载时判断是否为'null',是则不加载
              ajaxPostLists.attr("data-href", "null");
            } else {
              ajaxPostLists.attr("data-href", nextPageUrl);
            }
          },
          timeout: 3000,
          error: function () {
            //加载错误时的提示信息
            mdui.snackbar({
              //调用mdui前端框架里的snackbar()方法显示提示信息
              message: "未响应！",
              position: "left-bottom",
            });
          },
        });
      }
    });
  },
  //搜索按钮逻辑实现
  searchNew: function () {
    let dform = $(".searchInput");
    let dfinput = $(".searchInput input");
    let searchMask = $(".searchMask");
    let body = $("body");
    let appbar = $('header .mdui-appbar');
    $(document).on("click", ".searchNew,.searchInput .back", function () {
      if (dform.css("display") == "none") {
        dform.css("display", "flex");
        dfinput.focus();
        searchMask.css('display','block').animate({opacity: .5},300,function(){
          body.css('overflow','hidden');
          appbar.removeClass('mdui-headroom');
        });
      } else {
        dform.css("display", "none");
      }
    });

    dfinput.blur(function () {
      dform.css("display", "none");
      searchMask.animate({opacity: 0},300,function(){
        searchMask.css('display','none');
        body.css('overflow','initial');
        appbar.addClass('mdui-headroom');
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
  oneWord: function () {
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
  mylazyload: function () {
    let img = $(".lazyloadImg");
    img.lazyload();
  },
  //代码复制
  codeCopy: function () {
    let clipboard = new ClipboardJS(".mybtn");
    clipboard.on("success", function (e) {
      // console.log('jjj');
      e.clearSelection(); //清除选中样式（蓝色）
      mdui.snackbar({
        //调用mdui前端框架里的snackbar()方法显示提示信息
        message: "已复制",
        position: "right-top",
      });
    });
  },
  //代码高亮部分处理，引用https://github.com/LIlGG/halo-theme-sakura/blob/2ea256e0bf8b55bc62c7cf942675facfb4d9c04b/script/app.js#L387
  dealCodeHighlight: function () {
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
  autoDarkTips:function () {
    if(localStorage.getItem("autoDark") == 'true' && localStorage.getItem("darkTipsOk") == null){
      localStorage.setItem('darkTipsOk',0);
      mdui.snackbar({
        //调用mdui前端框架里的snackbar()方法显示提示信息
        message: "已自动切换黑暗模式🌙",
        position: "right-top",
      });
    }
  },
  //文章表格支持
  table:function() {
    $('.mdui-typo>table').addClass('mdui-table mdui-table-hoverable').wrap('<div class="mdui-table-fluid">')
  },

};

!(function () {
  document.addEventListener("DOMContentLoaded", function () {
    Object.values(dnxrzl).forEach((f) => f());
  });
})();
