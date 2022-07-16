<#include "module/macro.ftl">
<@layout title="搜索 - ${blog_title!}">
<main class="my-container mdui-container">
    
        <div class="partTitle">
            <div class="ITitle">
                搜索：${keyword!}
            </div>
        </div>
 
        <#include "module/post_list.ftl">
        <@post_list/>
        <#if posts.totalPages gt 1>
            <@paginationTag method="search" page="${posts.number}" total="${posts.totalPages}" display="3" keyword="${keyword!}">
                <#include "module/turn_pages.ftl">
                <@turn_pages/>
            </@paginationTag>
        </#if>
    

    
</main>
</@layout>