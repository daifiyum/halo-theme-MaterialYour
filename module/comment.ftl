<#macro comment post,type>
    <#if !post.disallowComment!false>
    <div class="comments mdui-card">
        <script src="${theme_base!}/source/libs/vue.min.js"></script>
        <#if settings.comment_style == "comment1">
            <script src="${theme_base!}/source/libs/halo-comment2.min.js"></script>
            <halo-comment id="${post.id?c}" type="${type}" :configs="configs"/>
            <script>
                var configs = {
                    utoLoad: false,
                    showUserAgent: true,
                    loadingStyle: "circle"
                }
            </script>
        <#else>
            <script src="${theme_base!}/source/libs/halo-comment.min.js"></script>
            <halo-comment id="${post.id?c}" type="${type}"/>
        </#if>
        
    </div>
    <#else>
    <div class="comments mdui-card">
        <p>评论已关闭</p>
    </div>
    </#if>
</#macro>