console.log("\n %c Dnxrzl " + " %c MaterialYour %c \n", "color:#fff;background:#6cf;padding:5px 0;border: 1px solid #6cf;", "color:#6cf;background:none;padding:5px 0;border: 1px solid #6cf;", "");
console.log("菩萨保佑，没有报错🙏🙏🙏");
const dnxrzl = {
  dnScroll: function () {
    var i = 1;
    $(document).scroll(function () {
      if (i == 1) {
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
  copyLink: function () {
    $(".copylink").click(function () {
      var input = $('<input id="copy" value = ' + window.location.href + ">");
      $("body").prepend(input);
      $("body").find("input").eq(0).select();

      try {
        var successful = document.execCommand("copy");
        var msg = successful ? "链接已复制" : "unsuccessful";
        mdui.snackbar({
          message: msg,
          position: "right-top",
        });
      } catch (err) {
        alert("Oops, unable to copy");
      }
      $("#copy").remove();
    });
  },
  gettime: function () {
    var date = new Date();
    $("#timeyear").text(date.getFullYear());
  },
  getcolor: function () {
    var bc = $(".mdui-toolbar").css("background-color");
    var bct = $(".mdui-toolbar").css("color");
    $("body").css("--themeColor", bc);
    $("body").css("--fontColor", bct);
  },
  getcolor2: function () {
    setTimeout(() => {
      var bc = $(".mdui-typo pre code").css("background-color");
      $("body").css("--codeBColor", bc);
    }, 100);
  },
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
            lid.addClass("journliked");
            lid.next().addClass("journliked");
            lid.next().text(parseInt(lid.next().text()) + 1);
          },
          timeout: 3000,
          error: function () {
            mdui.snackbar({
              message: "网络请求失败，请稍后再试",
              position: "right-top",
            });
          },
        });
      } else {
        mdui.snackbar({
          message: "已经赞过啦~",
          position: "right-top",
        });
      }
    });
  },
  journComment: function () {
    $(document).on("click", ".chatb", function () {
      $(this).parents(".journBottom").next().toggle();
    });
  },
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
  nodindex: function () {
    if (postyes != "true") {
      $(".nodindex").css("display", "none");
    } else {
      $(".nodindex").removeAttr("style");
    }
  },
  switchIndex: function () {
    var t = 0;
    var i = 0;
    function tocbotInit(optCss) {
      tocbot.init({
        tocSelector: optCss,
        contentSelector: ".js-toc-content",
        headingSelector: "h1, h2, h3, h4, h5, h6",
        hasInnerContainers: true,
        headingsOffset: 80,
        scrollSmoothOffset: -80,
        fixedSidebarOffset: 'auto',
      });
      if ($(".pindex,.mobileIndex").children().length == 0) {
        t++;
        $(".pindex,.mobileIndex").html("<p>文章无目录</p>");
      }
    }

    if (window.innerWidth > 800) {
      tocbotInit(".index");
    } else {
      tocbotInit(".indexs");
    }

    var resizeTimer = null;
    $(window).resize(function () {
      if (i == 0 && t == 0) {
        if (resizeTimer) {
          clearTimeout(resizeTimer);
        }
        resizeTimer = setTimeout(function () {
          dnxrzl.switchIndex();
          i++;
        }, 500);
      }
    });
  },
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
  mistope: function () {
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
    $("button.ajaxPostLists").click(function () {
      var pageUrl = $("button.ajaxPostLists").attr("data-href");
      if ($("button.ajaxPostLists").attr("data-href") != "null") {
        $(".ajaxPostLists").text("正在加载...");
        $.ajax({
          url: pageUrl,
          type: "GET",
          dataType: "html",
          async: false,
          crossDomain: true,
          headers: {},
          success: function (data) {
            var a = $(data).find("button.ajaxPostLists").attr("data-href");
            setTimeout(function () {
              //日志页
              if (pageUrl.search("journals") != -1) {
                $(".journalList li:last-child").after($(data).find(".journalList li"));
                dnxrzl.picInit(); //初始化图箱
                darkMode.firstDark(); //评论黑暗模式重载
              } else if (pageUrl.search("archives") != -1) {
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
                $(".postLayout article:last-child").after($(data).find(".postLayout > article")); //其他页面（首页、分类、标签、搜索）
              }
              if (a == undefined) {
                $(".ajaxPostLists").text("没有了");
              } else {
                $(".ajaxPostLists").text("加载更多");
              }
            }, 400);

            if (a == undefined) {
              $("button.ajaxPostLists").attr("data-href", "null");
            } else {
              $("button.ajaxPostLists").attr("data-href", a);
            }
          },
          timeout: 3000,
          error: function () {
            mdui.snackbar({
              message: "未响应！",
              position: "right-top",
            });
          },
        });
      }
    });
  },
  searchNew: function () {
    let dform = $('.searchInput'); 
    let dfinput = $('.searchInput input');
    $(document).on('click','.searchNew,.searchInput .back',function(){
      if(dform.css('display') == 'none'){
        dform.css('display','flex');
        dfinput.focus();
        
      }else{
        dform.css('display','none');
      }
      
    })
    
    dfinput.blur(function(){
      dform.css('display','none');
    });

    $(document).on('mousedown','.backClose',function(){
      event.preventDefault();
      dfinput.val('');
      dform.removeClass('notEmoty');
    })
    $('.searchInput input').bind("input propertychange",function(event){
      if(dfinput.val().length != 0){
        dform.addClass('notEmoty');
      }else{
        dform.removeClass('notEmoty');
      }
    });

   
  },
}

!(function () {
  document.addEventListener("DOMContentLoaded", function () {
    Object.values(dnxrzl).forEach((f) => f());
  });
})();
