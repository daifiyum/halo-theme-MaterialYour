console.log(
    "\n %c Dnxrzl " + " %c MaterialYour %c \n",
    "color:#fff;background:#6cf;padding:5px 0;border: 1px solid #6cf;",
    "color:#6cf;background:none;padding:5px 0;border: 1px solid #6cf;",
    "");

function dnScroll() {
    var i = 1;
    $(document).scroll(function(){

        if(i == 1){
            i++;
            dnScroll();
        }
        
    });
    let head = $('#selfAppbar');
    if($(document).scrollTop() > 1){
        head.removeClass('mdui-shadow-0');
    }else{
        head.addClass('mdui-shadow-0');
    }
    
}

function search() {
    $('.btSearch').click(function(){
        if (!($('.mdui-toolbar').hasClass('mobile'))) {
            $('.mdui-toolbar').addClass('mobile'); 
            $('form').css('display','flex');
            $('.btSearch').text('close');
            $('form').animate({opacity: '1'});
        }else{
            $('.mdui-toolbar').removeClass('mobile');
            $('form').css('display','none');
            $('.btSearch').text('search');
            $('form').animate({opacity: '.1'});
        } 
    });
    
    $(".mdui-toolbar form input").focus(function(){
        $(".mdui-toolbar form").addClass('mdui-shadow-1');
        });
    
    $(".mdui-toolbar form input").blur(function(){
        $(".mdui-toolbar form").removeClass('mdui-shadow-1');
    });
}

function autoImg(){
    var i = 1;
    $(window).resize(function(){
        if(i == 1){
            i++;
            autoImg();
        }
        
    })
    if(window.innerWidth >= 700 && window.innerWidth < 900){
        $('.postBackground').css('height','270px');
    }else if(window.innerWidth >= 900){
        $('.postBackground').css('height','290px');
    }else{
        $('.postBackground').css('height','220px');
    }
    
}

function copyLink() {

    $('.copylink').click(function(){
    var input = $("<input id=\"copy\" value = " + window.location.href + ">");
    $("body").prepend(input);
    $("body").find("input").eq(0).select();

    try {
        var successful = document.execCommand('copy');
        var msg = successful ? '链接已复制' : 'unsuccessful';
        mdui.snackbar({
            message: msg,
            position: 'right-top',
          });
    } catch (err) {
        alert('Oops, unable to copy');
    }
    $('#copy').remove();    
    });
    
}
function gettime(){
    var date = new Date();
    $('#timeyear').text(date.getFullYear());
}

function getcolor(){
    var bc = $('.mdui-toolbar').css('background-color');
    var bct = $('.mdui-toolbar').css('color');
    $('body').css('--themeColor',bc);
    $('body').css('--fontColor',bct);
}

function getcolor2(){
    var bc = $('.mdui-typo pre code').css('background');
    $('body').css('--codeBColor',bc);
}

function testindex(){
    if($('.pindex,.mobileIndex').children().length == 0){
        $('.pindex,.mobileIndex').append('<p>文章无目录</p>');
    }
}

function welcome(){
   
    var welcome = $('.welcome');
    var hour = new Date().getHours();
    if (hour >= 6 && hour < 12){
        welcome.text('早上好!');
    }
    else if(hour >= 12 && hour < 14)  {
        welcome.text('中午好!');
    }
    else if(hour >= 14 && hour < 19)  {
        welcome.text('下午好!');
    }
    else if(hour >= 19 && hour < 22)  {
        welcome.text('晚上好!');
    }
    else {
        welcome.text('晚安!');
    }
    
}

function totop(){
    $('.totop').click(function() {
        $('html,body').animate({scrollTop:0}, 300);
    }); 
    
    $(window).scroll(function () {
      if ($(window).scrollTop() > 800) {
           $('.totop').fadeIn(300);
       }
       else {
         $('.totop').fadeOut(300);
       }
    });
}

function journlike(){
        $('.likeb').click(function(){
            var likeNum = $(this).attr('id');
            let lid = $(this);
            $.ajax({
                url: '/api/content/journals/'+likeNum+'/likes',
                type: 'POST',
                async: true,
                crossDomain: true,
                headers: {},
                success: function(data){
                    lid.addClass('journliked');
                    lid.prev().text((parseInt(lid.prev().text())+1));
                },
                timeout: 3000,
                error: function(){
                    mdui.snackbar({
                        message: '已点赞或错误',
                        position: 'right-top',
                    });
                }
            });
        });
}

/*others*/
function photoalt(){
    $('#images').viewer({title: [1,(image, imageData) => `${image.alt}`]});
}

$(document).ready(function () {
    getcolor();
    getcolor2();
    dnScroll();
    search();
    focus();
    autoImg();
    gettime();
    copyLink();
    testindex();
    welcome();
    totop();
    journlike();
}); 
