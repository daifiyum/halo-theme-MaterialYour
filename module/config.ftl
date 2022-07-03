<#macro config>
<#--  Js的一些配置  -->
<script>
    <#--  let my_music = '${settings.music!}';  -->
    new WOW().init();
    hljs.highlightAll();
    hljsln.initLineNumbersOnLoad();
    hljs.initCopyButtonOnLoad();
    
    let postyes = '${is_post?? ? string('true','false')}';

    let oneWord = '${(settings.aWord_enabled!default) ? string('true','false')}';
    let wordType = '${settings.aWordType!default}';
    let multipleWType = '${settings.aWordTypes!}';
    let wordNum = '${settings.aWordNum!"10"}'
    let mconfig = '';
    let aWordConfig = {};
    <#if settings.aWordTypes??>
    let mulWT = multipleWType.split(',');
    for(var i = 0;i < mulWT.length;i++){
        mulWT[i] = 'c='  + mulWT[i] + '&';
        mconfig = mconfig + mulWT[i];
    }
    mconfig = '?' + mconfig + 'min_length=' + wordNum;
    <#else>
    aWordConfig = {
      c: wordType,
      min_length: wordNum,
    };
    </#if>

</script>


<#--  halo-comment-fly评论组件黑暗模式css,目前已弃用，未来可能启用  -->
<style id="comment-style" type="text/css" media="noexist">
    .dark .comment-form {
        background-color: #616161;
    }
    .dark .comment-form input, .dark .comment-form textarea {
        background: #565656;
    }
    .dark .comment-buttons .comment-icon {
        fill: #fff;
    }
    .dark .comment-form input,
    .dark .comment-textarea textarea {
        color: #fff;
    }
    .dark .comment-buttons .button-submit {
        border: 1px solid #fff;
        color: #fff;
    }
    .dark .comment-buttons .button-submit:hover {
        color: #000000;
        border: 1px solid #fff;
        background: #fff;
    }
    .dark .markdown-body {
        color: #fff;
    }
    .dark .comment-count {
        color: #fff;
    }
    .dark .comment-content {
        color: #fff;
    }
    .dark .comment-author .author-name,
    .dark .comment-reply {
        color: #989898;
    }
    .dark .comment-nodes .index-1 {
        border-bottom: 3px solid #616161;
    }
    .dark .comment-page {
        border-top: 3px solid #616161;
    }
    .dark .comment-content.markdown-body a {
        color: #5fa1ff;
    }
    .dark .reply-editing {
        color: #6fabff!important;
    }
    .dark .comment-page .page button {
        border: 0;
        background-color: #616161;
        color: #fff;
    }
    .dark .comment-page .page .active {
        color: #6fabff;
    }
</style>
</#macro>