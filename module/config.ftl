<#macro config>
<#--  Js的一些配置  -->
<script>
    <#--  let my_music = '${settings.music!}';  -->
    new WOW().init();

    let postyes = '${is_post?? ? string('true','false')}';
    let comment_darkClass = '${settings.comment_darkClass!'dark'}';

    //一言相关
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

    //自动黑暗模式
    let autoDarkOpt = ${settings.autoDarkOpt ? string('true','false')};
</script>


<#--  评论组件自定义css  -->
<style id="comment-style" type="text/css" media="noexist">
    ${settings.custom_commentcss!}
</style>
</#macro>