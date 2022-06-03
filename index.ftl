<#include "module/macro.ftl">
<@layout title="${blog_title!}">
<main class="self-container mdui-container">
    <div class="containerLeft">
        <div class="index-cover">
            <div class="mdui-card">
                <div class="mdui-card-media">
                    <div class="indexImg" style="background-image: url('${settings.indeximg!}');"></div>
                    <div class="mdui-card-media-covered mdui-card-media-covered-gradient">
                        <div class="mdui-card-primary">
                            <div class="mdui-card-primary-title"><span class="welcome"></span></div>
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
                                                <span class="cated">${categorie.name!}</span>
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
                            <div class="mdui-card-primary-subtitle">
                                ${post.createTime?string["yyyy年MM月dd日"]!}</div>
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
        
                <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
                    

                    <#if pagination.hasNext>
                        <button data-href="${pagination.nextPageFullPath!}" class="mdui-btn mdui-btn-raised mdui-btn-dense mdui-ripple mdui-center ajaxPostLists">加载更多</button>
                    </#if>

                    
                </@paginationTag>

    </div>

    <div class="containerRight">
        <div class="sticky">
            <div class="mdui-card">
                <div class="profile">
                    <div class="protop">
                        <img class="mdui-shadow-2" src="${blog_logo!}" alt="">
                        <div class="pttext">
                            <p>${user.nickname!}</p>
                            <small>${settings.profile_desc!}</small>
                        </div>
                    </div>
                    <div class="ptc">
                    
                            <a href="${settings.github!}" target="_blank">
                                <div class="mdui-chip mdui-color-theme-100 mdui-text-color-theme">
                                    <span class="mdui-chip-title"> <i class="mdui-icon icon-github"></i>GitHub</span>
                                </div>
                            </a>
                            <a href="mailto:${settings.email!}" target="_blank">
                                <div class="mdui-chip mdui-color-theme-100 mdui-text-color-theme">
                                    <span class="mdui-chip-title"> <i class="mdui-icon icon-mail"></i>E-mail</span>
                                </div>
                            </a>

                    </div>
                    <div class="ptb">
                        <div class="ptbz">
                            <@postTag method="count">
                                <span>${count!0}</span>
                            </@postTag>
                            <p>文章</p>
                        </div>
                        <div class="ptbz">
                            <@categoryTag method="count">
                                <span>${count!0}</span>
                            </@categoryTag>
                            <p>分类</p>
                        </div>
                        <div class="ptbz">
                            <@tagTag method="count">
                                <span>${count!0}</span>
                            </@tagTag>
                            <p>标签</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mdui-card">
                <div class="mdui-typo-title">分类</div>
                <div class="scrollbar">
                    <@categoryTag method="list">
                        <#list categories as category>
                            <a href="${category.fullPath!}">
                                <div class="mdui-chip mdui-color-theme-100 mdui-text-color-theme">
                                    <span class="mdui-chip-title">${category.name}
                                        （${category.postCount!0}）</span>
                                </div>
                            </a>
                        </#list>
                    </@categoryTag>
                </div>
            </div>
            <div class="mdui-card">
                <div class="mdui-typo-title">标签</div>
                <div class="scrollbar">
                    <@tagTag method="list">
                        <#list tags as tag>
                            <a href="${tag.fullPath!}">
                                <div class="mdui-chip mdui-color-theme-100 mdui-text-color-theme">
                                    <span class="mdui-chip-title">${tag.name!}（${tag.postCount!}）</span>
                                </div>
                            </a>
                        </#list>
                    </@tagTag>
                </div>
            </div>

            <#if settings.ad_enabled!false>
            <div class="mdui-card">
                <div class="mdui-typo-title">广告</div>
                <div class="ad">
                    <a href="${settings.adlink!}">
                        <img src="${settings.adimg!}"/>
                    </a>
                </div>
            </div>
            </#if>
        </div>
    </div>
</main>
</@layout>