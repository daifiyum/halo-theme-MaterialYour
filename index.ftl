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
                <#if settings.aWord_enabled != true>
                    ${settings.index_notice!default}
                </#if>
                </div>
                <#--  https://icon-sets.iconify.design/  -->
                <div class="welcome_contact">
                    <#if settings.github??>
                    <a href="${settings.github!}" target="_blank">
                        <i class="mdui-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="img" width="24" height="24" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16">
                                <path fill="none" stroke="white" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M5.75 14.25s-.5-2 .5-3c0 0-2 0-3.5-1.5s-1-4.5 0-5.5c-.5-1.5.5-2.5.5-2.5s1.5 0 2.5 1c1-.5 3.5-.5 4.5 0c1-1 2.5-1 2.5-1s1 1 .5 2.5c1 1 1.5 4 0 5.5s-3.5 1.5-3.5 1.5c1 1 .5 3 .5 3m-5-.5c-1.5.5-3-.5-3.5-1"/>
                            </svg>
                        </i>
                    </a>
                    </#if>
                    <#if settings.email??>
                    <a href="mailto:${settings.email!}" target="_blank">
                        <i class="mdui-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="img" width="24" height="24" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24">
                                <path fill="white" d="M4 10v8h16v-8l-8 3l-8-3Zm0-4v2l8 3l8-3V6H4Zm0-2h16a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2Z"/>
                            </svg>
                        </i>
                    </a>
                    </#if>
                    <#if settings.telegram??>
                    <a href="${settings.telegram!}" target="_blank">
                        <i class="mdui-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="img" width="24" height="24" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24">
                                <path fill="white" d="M22.265 2.428a2.048 2.048 0 0 0-2.078-.324L2.266 9.339a2.043 2.043 0 0 0 .104 3.818l3.625 1.261l2.02 6.682a.998.998 0 0 0 .119.252c.008.012.019.02.027.033a.988.988 0 0 0 .211.215a.972.972 0 0 0 .07.05a.986.986 0 0 0 .31.136l.013.001l.006.003a1.022 1.022 0 0 0 .203.02l.018-.003a.993.993 0 0 0 .301-.052c.023-.008.042-.02.064-.03a.993.993 0 0 0 .205-.114a250.76 250.76 0 0 1 .152-.129l2.702-2.983l4.03 3.122a2.023 2.023 0 0 0 1.241.427a2.054 2.054 0 0 0 2.008-1.633l3.263-16.017a2.03 2.03 0 0 0-.693-1.97ZM9.37 14.736a.994.994 0 0 0-.272.506l-.31 1.504l-.784-2.593l4.065-2.117Zm8.302 5.304l-4.763-3.69a1.001 1.001 0 0 0-1.353.12l-.866.955l.306-1.487l7.083-7.083a1 1 0 0 0-1.169-1.593L6.745 12.554L3.02 11.191L20.999 4Z"/>
                            </svg>
                        </i>   
                    </a>
                    </#if>     
                    <#if settings.wechat??>
                    <a data-fancybox="gallery" data-src="${settings.wechat}">
                        <i class="mdui-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="img" width="24" height="24" preserveAspectRatio="xMidYMid meet" viewBox="0 0 48 48">
                                <g fill="none"><path d="M36.997 21.711C36.843 13.008 29.74 6 21 6C12.163 6 5 13.163 5 22c0 4.17 1.595 7.968 4.209 10.815l-1.199 7.21l7.115-3.055c3.135 1.042 6.093 1.303 8.875.782" clip-rule="evenodd"/><path stroke="white" stroke-linecap="round" stroke-linejoin="round" stroke-width="4" d="M36.997 21.711C36.843 13.008 29.74 6 21 6C12.163 6 5 13.163 5 22c0 4.17 1.595 7.968 4.209 10.815l-1.199 7.21l7.115-3.055c3.135 1.042 6.093 1.303 8.875.782"/>
                                    <path fill="white" d="M15.125 20.467a2.258 2.258 0 0 0 2.25-2.267a2.258 2.258 0 0 0-2.25-2.267a2.258 2.258 0 0 0-2.25 2.267a2.258 2.258 0 0 0 2.25 2.267Zm9 0a2.258 2.258 0 0 0 2.25-2.267a2.258 2.258 0 0 0-2.25-2.267a2.258 2.258 0 0 0-2.25 2.267a2.258 2.258 0 0 0 2.25 2.267Z"/><path d="M38.762 39.93A10.453 10.453 0 0 1 32.5 42C26.701 42 22 37.299 22 31.5S26.701 21 32.5 21S43 25.701 43 31.5c0 1.6-.358 3.116-.998 4.473" clip-rule="evenodd"/><path stroke="white" stroke-linecap="round" stroke-linejoin="round" stroke-width="4" d="M38.762 39.93A10.453 10.453 0 0 1 32.5 42C26.701 42 22 37.299 22 31.5S26.701 21 32.5 21S43 25.701 43 31.5c0 1.6-.358 3.116-.998 4.473"/><path d="M42.002 35.973L43 42l-4.238-2.07" clip-rule="evenodd"/><path stroke="white" stroke-linecap="round" stroke-linejoin="round" stroke-width="4" d="M42.002 35.973L43 42l-4.238-2.07"/><path fill="white" d="M35.688 30.8A1.694 1.694 0 0 1 34 29.1c0-.939.755-1.7 1.688-1.7c.931 0 1.687.761 1.687 1.7s-.755 1.7-1.688 1.7Zm-6.75 0a1.694 1.694 0 0 1-1.688-1.7c0-.939.756-1.7 1.688-1.7c.931 0 1.687.761 1.687 1.7s-.756 1.7-1.688 1.7Z"/>
                                </g>
                            </svg>
                        </i>
                    </a>
                    </#if>
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