<#include "module/macro.ftl">
<@layout title="标签：${tag.name} - ${blog_title!}">
    <main class="my-container mdui-container">
    <div class="">
        <div class="partTitle">
            <div class="ITitle">
                标签：${tag.name}
            </div>
        </div>

        <#include "module/post_list.ftl">
        <@post_list/>
        <#if posts.totalPages gt 1>
            <@paginationTag method="tagPosts" page="${posts.number}" total="${posts.totalPages}" display="3" slug="${tag.slug!}">
                <#include "module/turn_pages.ftl">
                <@turn_pages/>
            </@paginationTag>
        </#if>
    </div>
    </main>
</@layout>
