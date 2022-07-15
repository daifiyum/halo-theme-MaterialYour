<#include "module/macro.ftl">
<@layout title="标签：${tag.name} - ${blog_title!}">
    <main class="my-container mdui-container">
    <div class="">
        <div class="partTitle">
            <div class="ITitle">
                标签：${tag.name}
            </div>
        </div>

        <#include "module/postList.ftl">
        <@postList/>
        <#if posts.totalPages gt 1>
            <@paginationTag method="tagPosts" page="${posts.number}" total="${posts.totalPages}" display="3" slug="${tag.slug!}">
                <#include "module/turnPages.ftl">
                <@turnPages/>
            </@paginationTag>
        </#if>
    </div>
    </main>
</@layout>
