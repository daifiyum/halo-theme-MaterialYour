<#macro comment post,type>
    <#if !post.disallowComment!false>

    <script>
        var configs = {
            showUserAgent: false,
        }
    </script>
    <halo-comment id="${post.id?c}" type="${type}" :configs="configs" />
    <#else>
        <p>评论已关闭</p>
    </#if>
</#macro>