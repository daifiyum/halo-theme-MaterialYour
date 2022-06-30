<#include "module/macro.ftl">
<@layout title="${blog_title!}">
<main class="self-container mdui-container">
    <div class="containerLeft">
        <div class="index-cover animate__animated">
            <div class="welcome_media">
                <img src="${settings.indeximg!'${theme_base!}/source/images/indexBack.jpg'}" alt="">
            </div>
            <div class="welcome">
                <div class="welcome_hello"></div>
                <div class="welcome_descr">
                    ${settings.index_notice!default}
                </div>
                <div class="welcome_contact">
                    <a href="${settings.github!}" target="_blank">
                        <i class="mdui-icon icon-github"></i>
                    </a>
                    <a href="mailto:${settings.email!}" target="_blank">
                        <i class="mdui-icon icon-mail"></i>
                    </a>

                    
                    
                </div>
            </div>
            <div class="welcome__figures">
                <div class="welcome__stat">
                    <@postTag method="count">
                        <span class="welcome__count">${count!0}</span> 
                    </@postTag>
                    <span class="welcome__count-descr">文章数</span>
                </div>
                <div class="welcome__stat">
                    <@categoryTag method="count">
                        <span class="welcome__count">${count!0}</span> 
                    </@categoryTag>
                    <span class="welcome__count-descr">分类数</span>
                </div>
                <div class="welcome__stat">
                    <@tagTag method="count">
                        <span class="welcome__count">${count!0}</span> 
                    </@tagTag>
                    <span class="welcome__count-descr">标签数</span>
                </div>
                <div class="welcome__stat">
                    <@commentTag method="count">
                        <span class="welcome__count">${count!0}</span> 
                    </@commentTag>
                    <span class="welcome__count-descr">评论数</span>
                </div>
            </div>
        </div>
        <#include "module/postList.ftl">
        <@postList/>

        <#if posts.totalPages gt 1>
            <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
                <#include "module/turnPages.ftl">
                <@turnPages/>
            </@paginationTag>
        </#if>

    </div>

    
</main>

</@layout>