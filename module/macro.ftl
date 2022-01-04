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
    <#--
        公共 head 代码，详情请参考：https://docs.halo.run/zh/developer-guide/theme/public-template-tag
        包含：Favicon，自定义 head 等
    -->
    <@global.head />
    <title>${title}</title>
    <link rel="shortcut icon" href="./favicon.ico" type="image/vnd.microsoft.icon"/>
    <link rel="stylesheet" href="${theme_base!}/source/css/mdui.min.css"/>
    <link rel="stylesheet" href="${theme_base!}/source/css/style.css">
    <link rel="stylesheet" href="${theme_base!}/source/css/tocbot.css">
    <!-- <link rel="stylesheet" href="./node_modules/animate.css/animate.min.css"> -->
    <script src="${theme_base!}/source/js/jquery.min.js"></script>
    <script src="${theme_base!}/source/js/tocbot.min.js"></script>
</head>
<body class="mdui-drawer-body-left ${settings.mdui_theme!'mdui-theme-primary-blue'}">
    
    <#include "menu.ftl">

    <#nested >

    <#--
        公共底部代码，详情请参考：https://docs.halo.run/zh/developer-guide/theme/public-template-tag
        包含：统计代码，底部信息
    --> 
    <@global.footer />
    <#include "footer.ftl">
    <@footer/>
   
<script src="${theme_base!}/source/js/mdui.min.js"></script>
<script src="${theme_base!}/source/js/script.js"></script>
</body>
</html>
</#macro>

