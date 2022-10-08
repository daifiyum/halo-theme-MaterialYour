<#include "module/macro.ftl">
<#include "module/home_banner.ftl">
<#include "module/post_list.ftl">
<#--  <#include "module/post_list2.ftl">  -->

<@layout title="${blog_title!}">
<main class="my-container mdui-container">
        
        <@home_banner/>

        <@post_list/>

        <#if posts.totalPages gt 1>
            <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
                <#include "module/turn_pages.ftl">
                <@turn_pages/>
            </@paginationTag>
        </#if>
   
</main>
</@layout>