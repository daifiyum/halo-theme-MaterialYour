<#include "module/macro.ftl">
<@layout title="分类：${category.name} - ${blog_title!}">
<main class="my-container mdui-container">
    <div class="">
    <div class="partTitle">
            <div class="ITitle">
                分类：${category.name}
            </div>
        </div>

        <#include "module/postList.ftl">
        <@postList/>
        <#if posts.totalPages gt 1>
            <@paginationTag method="categoryPosts" page="${posts.number}" total="${posts.totalPages}" display="3" slug="${category.slug!}">
                <#include "module/turnPages.ftl">
                <@turnPages/>
            </@paginationTag>
        </#if>
    </div>

    
</main>

</@layout>
