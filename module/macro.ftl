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
    <link rel="stylesheet" href="${theme_base!}/source/css/min/style.min.css">
    <link rel="stylesheet" href="${theme_base!}/source/libs/tocbot/tocbot.css">
    <link rel="stylesheet" href="${theme_base!}/source/libs/fancybox/fancybox.css">
    <link rel="stylesheet" href="${theme_base!}/source/libs/highlight/styles/${settings.code_css!}.min.css">
    <link rel="stylesheet" href="${theme_base!}/source/libs/animate/animate.min.css">
    <link rel="stylesheet" href="${theme_base!}/source/libs/katex/katex.min.css" />
    <script src="${theme_base!}/source/libs/jquery/jquery.min.js"></script>
    <script src="${theme_base!}/source/libs/wow/wow.min.js"></script>    
    <script src="${theme_base!}/source/libs/tocbot/tocbot.min.js"></script>
    <script src="${theme_base!}/source/libs/fancybox/fancybox.umd.js"></script>    
    <script src="${theme_base!}/source/libs/highlight/highlight.min.js"></script>
    <script src="${theme_base!}/source/libs/highlight/highlightjs-line-numbers.min.js"></script>
    <script src="${theme_base!}/source/libs/clipboard/clipboard.min.js"></script>
    <script src="${theme_base!}/source/libs/isotope/isotope.pkgd.min.js"></script>
    <script src="${theme_base!}/source/libs/imagesloaded/imagesloaded.pkgd.min.js"></script>
    <script src="${theme_base!}/source/libs/vue/vue.min.js"></script>
    <script src="${settings.comment_js!'${theme_base!}/source/libs/halo_comment/halo-comment.min.js'}"></script>
    <#include "config.ftl">
    <@config/>
    <script type="text/javascript" src="${theme_base!}/source/libs/lazyload/lazyload.min.js"></script>
    <script src="${theme_base!}/source/js/min/dark_mode.min.js"></script>
</head>
<body class="${settings.mdui_theme!default}">
    <script>
        if(darkMode.getFlag('night') != null){
            darkMode.firstDark();
        }
    </script>

    <#include "menu.ftl">

    <#nested >

    <#include "footer.ftl">
    <@footer/>
    
<script src="${theme_base!}/source/libs/mdui/mdui.min.js"></script>
<script src="${theme_base!}/source/js/min/core.min.js"></script>
</body>
</html>
</#macro>

