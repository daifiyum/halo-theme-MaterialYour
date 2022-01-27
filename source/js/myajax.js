function ajaxPostLists(pageUrl){
    if($('button.ajaxPostLists').attr('data-href') != 'null'){
        $('.ajaxPostLists').text('正在加载...');
        $.ajax({
            url: pageUrl,
            type: 'GET',
            dataType: 'html',
            async: false,
            crossDomain: true,
            headers: {},
            success: function(data){
                setTimeout(function(){
                    $('.ajaxPostLists').before($(data).find('.containerLeft > article')); /*用啥正则表达式，啊呸*/
                    $('.ajaxPostLists').text('加载更多');
                }, 400);
                var a = $(data).find('button.ajaxPostLists').attr('data-href');

                if(a == undefined){
                    $('button.ajaxPostLists').attr('data-href','null');
                }else{
                    $('button.ajaxPostLists').attr('data-href',a);
                }
               
                
            },
            timeout: 3000,
            error: function(){
                mdui.snackbar({
                    message: '未响应！',
                    position: 'right-top',
                });
            }
        });
    }else{
        $('.ajaxPostLists').text('没有啦');
    }
    
    

}

$(document).ready(function () {
    $('button.ajaxPostLists').click(function(){
        var pageUrl = $('button.ajaxPostLists').attr('data-href');
        ajaxPostLists(pageUrl);
    });
    
})
