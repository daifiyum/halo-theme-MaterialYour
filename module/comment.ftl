<#macro comment post,type>
    <#if !post.disallowComment!false>
    <div class="comments mdui-card">
        <script src="${theme_base!}/source/js/vue.min.js"></script>
        <script src="${theme_base!}/source/js/halo-comment.min.js"></script>
        <halo-comment id="${post.id?c}" type="${type}"/>
    </div>
    <#else>
    <div class="comments mdui-card">
        <p>评论已关闭</p>
    </div>
    </#if>
</#macro>