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
    <link rel="stylesheet" href="${theme_base!}/source/libs/fancybox/fancybox.css">
    <#--  <link rel="stylesheet" href="${theme_base!}/source/libs/mp/mp.css">  -->
    <link rel="stylesheet" href="${theme_base!}/source/libs/highlight/styles/${settings.code_css!}.min.css">
    <link rel="stylesheet" href="${theme_base!}/source/libs/animate.min.css">
    <link rel="stylesheet" href="${theme_base!}/source/css/darkMode.css">    
    <script src="${theme_base!}/source/libs/jquery.min.js"></script>
    <script src="${theme_base!}/source/libs/wow.min.js"></script>    
    <script src="${theme_base!}/source/libs/tocbot/tocbot.min.js"></script>
    <script src="${theme_base!}/source/libs/fancybox/fancybox.umd.js"></script>    
    <script src="${theme_base!}/source/libs/highlight/highlight.min.js"></script>
    <script src="${theme_base!}/source/libs/highlight/hightlight_linenumber.js"></script>
    <script src="${theme_base!}/source/libs/highlight/highlightjs_copy_button.min.js"></script>
    <script src="${theme_base!}/source/libs/isotope.pkgd.min.js"></script>
    <script src="${theme_base!}/source/libs/imagesloaded.pkgd.min.js"></script>
    <script src="${theme_base!}/source/libs/vue.min.js"></script>
    <script src="${settings.comment_js!'${theme_base!}/source/libs/halo-comment.min.js'}"></script>
    <#include "config.ftl">
    <@config/>
    <script src="${theme_base!}/source/js/darkMode.js"></script>
</head>
<body class="${settings.mdui_theme!default} ${(settings.drawer_enabled!default) ? string('mdui-drawer-body-left','')}">
    <script>
        if(darkMode.getFlag('night') != null){
            darkMode.firstDark();
        }
    </script>

    <#include "menu.ftl">

    <#nested >

    <@global.footer />
    <#include "footer.ftl">
    <@footer/>

<script src="${theme_base!}/source/libs/mdui/mdui.min.js"></script>
<script src="${theme_base!}/source/js/core.js"></script>
<#--  <script src="${theme_base!}/source/libs/mp/mp.js"></script>  -->
</body>
</html>
</#macro>

