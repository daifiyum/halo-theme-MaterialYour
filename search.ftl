<#include "module/macro.ftl">
<@layout title="搜索 - ${blog_title!}">
<main class="self-container mdui-container">
    <div class="containerLeft">
        <div class="partTitle">
            <div class="ITitle">
                搜索：${keyword!}
            </div>
        </div>
 
        <#include "module/postList.ftl">
        <@postList/>
        <#if posts.totalPages gt 1>
            <@paginationTag method="search" page="${posts.number}" total="${posts.totalPages}" display="3" keyword="${keyword!}">
                <#include "module/turnPages.ftl">
                <@turnPages/>
            </@paginationTag>
        </#if>
    </div>

    
</main>
</@layout>