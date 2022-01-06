<#include "module/macro.ftl">
<@layout title="搜索 - ${blog_title!}">
<main class="self-container mdui-container">
    <div class="containerLeft">
        <div class="index-cover">
            <div class="mdui-card">
                <div class="mdui-card-media">
                    <div class="indexImg" style="background-image: url('${settings.indeximg!}')"></div>
                    <div class="mdui-card-media-covered mdui-card-media-covered-gradient">
                        <div class="mdui-card-primary">
                            <div class="mdui-card-primary-title">搜索：${keyword!}</div>
                        </div>
                    </div>
                </div>
                <div class="mdui-card-primary">
                    <i class="mdui-icon material-icons mdui-text-color-theme-200">bubble_chart</i>
                    <div class="mdui-card-content">${settings.index_notice!}</div>
                </div>
            </div>
        </div>
        <#if posts.content?size gt 0>
        <#list posts.content as post>
            <article>
                <a href="${post.fullPath!}">
                    <div class="mdui-card">
                        <div class="selfLayout">
                            <div class="left">
                                <div class="mdui-card-primary">
                                    <div class="mdui-card-primary-subtitle">
                                        <#if (post.categories)?? && post.categories?size !=0>
                                            <#list post.categories as categorie>
                                                <span>${categorie.name!}</span>
                                            </#list>
                                        </#if>
                                    </div>
                                    <div class="mdui-card-primary-title">${post.title}</div>
                                </div>
                                <div class="mdui-card-content">${post.summary!}</div>
                            </div>
                            <#if post.thumbnail?? && post.thumbnail!=''>
                                <div class="right">
                                    <div class="mdui-card-media">
                                        <img class="mdui-shadow-2" src="${post.thumbnail!}" />
                                    </div>
                                </div>
                            </#if>
                        </div>
                        <div class="postBottom">
                            <div class="mdui-card-primary-subtitle">${post.createTime?string["yyyy年MM月dd日"]!}</div>
                            <div class="mdui-card-primary-subtitle">${post.commentCount!}条评论</div>
                        </div>
                    </div>
                </a>
            </article>
        </#list>
        <#else>
        <div class="mdui-card">
            <div class="nothings">
                
            </div>
        </div>
        </#if>
        <#if posts.totalPages gt 1>
            <div class="nextpage mdui-card">
                <@paginationTag method="search" page="${posts.number}" total="${posts.totalPages}" display="3" keyword="${keyword!}">
                    <div>
                        <#if pagination.hasPrev>
                            <a href="${pagination.prevPageFullPath!}">
                                <button class="mdui-btn">
                                    上一页
                                </button>
                            </a>
                            <#else>
                                <button class="mdui-btn">
                                    没有了
                                </button>
                        </#if>
                    </div>
                    <div>
                        <#list pagination.rainbowPages as number>
                            <#if number.isCurrent>
                                <p>第${number.page!}页</p>
                            </#if>
                        </#list>
                    </div>
                    <div>
                        <#if pagination.hasNext>
                            <a href="${pagination.nextPageFullPath!}">
                                <button class="mdui-btn">
                                    下一页
                                </button>
                            </a>
                            <#else>
                                <button class="mdui-btn">
                                    没有了
                                </button>
                        </#if>
                    </div>
                </@paginationTag>
            </div>
        </#if>
    </div>

    <div class="containerRight">
        <div class="sticky">
            <div class="mdui-card">
                <div class="mdui-typo-title">分类</div>
                <@categoryTag method="list">
                    <#list categories as category>
                        <a href="${category.fullPath!}">
                            <div class="mdui-chip mdui-color-theme-100 mdui-text-color-theme">
                                <span class="mdui-chip-title">${category.name} （${category.postCount!0}）</span>
                            </div>
                        </a>
                    </#list>
                </@categoryTag>
            </div>
            <div class="mdui-card">
                <div class="mdui-typo-title">标签</div>
                <@tagTag method="list">
                    <#list tags as tag>
                        <a href="${tag.fullPath!}"></a>
                        <div class="mdui-chip mdui-color-theme-100 mdui-text-color-theme">
                            <span class="mdui-chip-title">${tag.name!}（${tag.postCount!}）</span>
                        </div>
                        </a>
                    </#list>
                </@tagTag>
            </div>
        </div>
    </div>
</main>
</@layout>