<#macro layout title>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"/>
    <meta name="keywords" content="${meta_keywords!}"/>
    <meta name="description" content="${meta_description!}" />
    <meta name="renderer" content="webkit"/>
    <meta name="force-rendering" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <@global.head />
    <title>${title}</title>
    <link rel="stylesheet" href="${theme_base!}/source/libs/mdui/mdui.min.css"/>
    <link rel="stylesheet" href="${theme_base!}/source/css/selfIcons.css">
    <link rel="stylesheet" href="${theme_base!}/source/css/style.css">
    <link rel="stylesheet" href="${theme_base!}/source/libs/tocbot/tocbot.css">
    <link rel="stylesheet" href="${theme_base!}/source/libs/viewer/viewer.min.css">
    <link rel="stylesheet" href="${theme_base!}/source/libs/fjGallery/fjGallery.css">
    <link rel="stylesheet" href="${theme_base!}/source/libs/mp/mp.css">
    <link rel="stylesheet" href="${theme_base!}/source/libs/highlight/styles/${settings.code_css!}.min.css">
    <script src="${theme_base!}/source/libs/jquery.min.js"></script>
    <script src="${theme_base!}/source/libs/tocbot/tocbot.min.js"></script>
    <script src="${theme_base!}/source/libs/viewer/viewer.min.js"></script>
    <script src="${theme_base!}/source/libs/jquery-viewer.min.js"></script>
    <script src="${theme_base!}/source/libs/fjGallery/fjGallery.min.js"></script>
    <script src="${theme_base!}/source/libs/highlight/highlight.min.js"></script>
    <script src="${theme_base!}/source/libs/highlight/hightlight_linenumber.js"></script>
    <script src="${theme_base!}/source/libs/highlight/highlightjs_copy_button.min.js"></script>
    <script>
        let my_music = '${settings.music!}';
        hljs.highlightAll();
        hljsln.initLineNumbersOnLoad();
        hljs.initCopyButtonOnLoad();
    </script>
    <#if is_index?? || is_journals??>
        <script src="${theme_base!}/source/js/myajax.js"></script>
    </#if>
    <#if settings.mdui_icons == 'MIO'>
        <style>
            .material-icons {
                font-family: 'Material Icons Outlined' !important;
            }
        </style>
    </#if>
</head>
<body class="mdui-drawer-body-left ${settings.mdui_theme!default}">
    
    <#include "menu.ftl">

    <#nested >

    <@global.footer />
    <#include "footer.ftl">
    <@footer/>
<script src="${theme_base!}/source/libs/mdui/mdui.min.js"></script>
<script src="${theme_base!}/source/js/script.js"></script>
<script src="${theme_base!}/source/libs/mp/mp.js"></script>
</body>
</html>
</#macro>

