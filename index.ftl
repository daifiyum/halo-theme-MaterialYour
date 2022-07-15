<#include "module/macro.ftl">
<#include "module/homeBanner.ftl">
<#include "module/postList.ftl">

<@layout title="${blog_title!}">
<main class="my-container mdui-container">
        
        <@homeBanner/>

        <@postList/>

        <#if posts.totalPages gt 1>
            <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
                <#include "module/turnPages.ftl">
                <@turnPages/>
            </@paginationTag>
        </#if>
   
</main>
</@layout>