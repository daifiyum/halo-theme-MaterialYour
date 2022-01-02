console.log(
    "\n %c Dnxrzl " + " %c Yimolan %c \n",
    "color:#fff;background:#6cf;padding:5px 0;border: 1px solid #6cf;",
    "color:#6cf;background:none;padding:5px 0;border: 1px solid #6cf;",
    "");

function dnScroll() {
    let head = $('#selfAppbar');
    if($(document).scrollTop() > 1){
        head.removeClass('mdui-shadow-0');
    }else{
        head.addClass('mdui-shadow-0');
    }
}

function search() {
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
    
}

function autoImg(){
    if(window.innerWidth >= 700 && window.innerWidth < 900){
        $('.postBackground').css('height','270px');
    }else if(window.innerWidth >= 900){
        $('.postBackground').css('height','290px');
    }else{
        $('.postBackground').css('height','220px');
    }
    
}

function copyLink() {
    var input = $("<input id=\"copy\" value = " + window.location.href + ">");
    $("body").prepend(input);
    $("body").find("input").eq(0).select();

    try {
        var successful = document.execCommand('copy');
        var msg = successful ? '链接已复制' : 'unsuccessful';
        alert(msg);
    } catch (err) {
        alert('Oops, unable to copy');
    }
    $('#copy').remove();
}
function gettime(){
    var date = new Date();
    $('#timeyear').text(date.getFullYear());
}
function ajaxtest(){
    // $.ajax({
    //     url: `/api/content/posts`,
    //     type: method.toUpperCase(),
        // headers: {
        //     "API-Authorization": "123456",
        // },
    //     dataType: "json",
    //     timeout: 10000,
    //     data,
    //     success(res) {
    //         console.log('successful');
    //     },
    //     error(err) {
    //         console.log('error');
    //     },
    // });
    
    // $.ajax({ 
    //     url: "http://127.0.0.1:8090/api/content/posts", 
    //     type: "get",
    //     headers: {
    //     "API-Authorization": "123456",
    //     },
    //     dataType: "json",
    //     success: function(data){
    //     console.log(data);
    //     console.log(data.data.content[0]['title']);
    //     $('#add').append(data.data.content[0]);
    //     }
    // });
    // var htmlText = '';
    // $.ajax({ 
    //     url: "http://127.0.0.1:8090/", 
    //     type: "get",
    //     dataType: "html",
    //     success: function(data){
    //     // console.log(typeof data);
    //     var reg = /<body[^>]*>([\s\S]*)<\/body>/g;
    //     var html = reg.exec(data)[0];
    //     var aa = $(html).filter('.self-container')[0];
    //     console.log(aa);
        
    //     }
    // });
    
  
    
}
function autocolor(){
    var bc = $('.mdui-appbar').css('background-color');
    var bct = $('.mdui-appbar').css('color');
    $('body').css('--background-color-button',bc);
    $('body').css('--bttextcolor',bct);
}
$(".mdui-toolbar form input").focus(function(){
    $(".mdui-toolbar form").addClass('mdui-shadow-1');
    });

$(".mdui-toolbar form input").blur(function(){
    $(".mdui-toolbar form").removeClass('mdui-shadow-1');
});

$(document).scroll(function(){dnScroll();});

$('.btSearch').click(function(){
    search();
});

$(window).resize(function(){
    autoImg();
})

$('.copylink').click(function(){
    copyLink();
});
$(document).ready(function () {
    dnScroll();
    focus();
    autoImg();
    autocolor();
    gettime();
});    