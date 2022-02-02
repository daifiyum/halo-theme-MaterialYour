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
                var a = $(data).find('button.ajaxPostLists').attr('data-href');
                setTimeout(function(){
                    if(pageUrl.search('journals') != -1 ){
                        $('.journalList li:last-child').after($(data).find('.journalList li'));//日志页
                    }else{
                        $('.ajaxPostLists').before($(data).find('.containerLeft > article')); //用啥正则表达式，啊呸
                    }
                    if(a == undefined){
                        $('.ajaxPostLists').text('没有了');
                    }else{
                        $('.ajaxPostLists').text('加载更多');
                    }
                    
                }, 400);

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
    }
    
    

}

$(document).ready(function () {
    $('button.ajaxPostLists').click(function(){
        var pageUrl = $('button.ajaxPostLists').attr('data-href');
        ajaxPostLists(pageUrl);
    });
    
})
