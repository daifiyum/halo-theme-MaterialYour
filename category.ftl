<#include "module/macro.ftl">
<@layout title="分类：${category.name} - ${blog_title!}">
<main class="my-container mdui-container">
    <div class="">
    <div class="partTitle">
            <div class="ITitle">
                分类：${category.name}
            </div>
        </div>

        <#include "module/post_list.ftl">
        <@post_list/>
        <#if posts.totalPages gt 1>
            <@paginationTag method="categoryPosts" page="${posts.number}" total="${posts.totalPages}" display="3" slug="${category.slug!}">
                <#include "module/turn_pages.ftl">
                <@turn_pages/>
            </@paginationTag>
        </#if>
    </div>

    
</main>

</@layout>
