<#include "module/macro.ftl">
<@layout title="${post.title!} - ${blog_title!}">
<main class="my-container mdui-container line-numbers">
    <div class="animate__animated post_animate">
        <article class="my-article my-card">
            
                <#if post.thumbnail?? && post.thumbnail!=''>
                    <div class="mdui-card-media">
                        <div class="postBackground" style="background-image: url('${post.thumbnail!}')"></div>
                        <div class="mdui-card-media-covered mdui-card-media-covered-gradient">
                            <div class="mdui-card-primary">
                                <div class="mdui-card-primary-title">${post.title!}</div>
                            </div>
                        </div>
                    </div>
                    <#else>
                        <div class="noimg">
                            <h2 class="mdui-card-primary-title">${post.title!}</h2>
                        </div>
                </#if>

                <div class="postFront">
                    <div class="pleft">
                        <img class="mdui-img-circle" src="${settings.avatarLogo!'${theme_base!}/source/images/avatar.png'}" alt="${user.nickname!}">
                        <div>
                            <span>${user.nickname!}</span>
                            <span><i class="mdui-icon material-icons">today</i>${post.createTime?string["yyyy-MM-dd"]!} <i class="mdui-icon material-icons">visibility</i>${post.visits!}</span>
                        </div>
                    </div>
                    <div class="pright">
                        <button class="ptoc mdui-btn mdui-btn-icon mdui-ripple mdui-text-color-theme" mdui-drawer="{overlay: true, target: '#left-drawer'}">
                            <i class="mdui-icon material-icons">assignment</i>
                        </button>
                        <button class="postCopyLink mdui-btn mdui-btn-icon mdui-ripple mdui-text-color-theme" data-clipboard-text="${blog_url!}${post.fullPath!}">
                            <i class="mdui-icon material-icons">share</i>
                        </button>
                    </div>
                </div>
                <div class="typo-layout mdui-typo js-toc-content">
                    ${post.formatContent!}
                </div>
                <div class="pbottom mdui-card-primary-subtitle">
                    <div class="smallbu">分类:
                        <#if (post.categories)?? && post.categories?size !=0>
                            <#list post.categories as categorie>
                                <a href="${categorie.fullPath!}">${categorie.name!}</a>
                            </#list>
                            <#else>
                                <span>无</span>
                        </#if>
                    </div>
                    <div class="smallbu2">标签:
                        <#if (post.tags)?? && post.tags?size !=0>
                            <#list post.tags as tag>
                                <a href="${tag.fullPath!}">${tag.name!}</a>
                            </#list>
                            <#else>
                                <span>无</span>
                        </#if>
                    </div>
                </div>

                <div class="copyright">
                    <#--  <img src="${theme_base!}/source/images/copyright-line.svg"/>  -->
                    <svg class="copyricon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="32" height="32"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 2c5.52 0 10 4.48 10 10s-4.48 10-10 10S2 17.52 2 12 6.48 2 12 2zm0 2c-4.42 0-8 3.58-8 8s3.58 8 8 8 8-3.58 8-8-3.58-8-8-8zm0 3c1.82 0 3.413.973 4.288 2.428l-1.714 1.029A3 3 0 1 0 12 15a2.998 2.998 0 0 0 2.573-1.456l1.715 1.028A4.999 4.999 0 0 1 7 12c0-2.76 2.24-5 5-5z"/></svg>
                    <div class="crbox alink">
                        <div class="cr1">
                            <span>本文作者：${user.nickname!}</span>
                        </div>
                        <div class="cr2">
                            <span>本文链接：</span>
                            <a href="${post.fullPath!}">${blog_url!}${post.fullPath!}</a>
                        </div>
                        <div class="cr3">
                            <span>版权声明：</span>
                            <a href="https://creativecommons.org/licenses/by-nc-sa/3.0/deed.zh"> 本文采用 CC BY-NC-SA 3.0 协议进行许可</a>
                        </div>
                    </div>
                    
                </div>
        </article>
        <div class="nextPost">
            <#if prevPost??>
                <a href="${prevPost.fullPath!}">
                    <button class="mdui-btn">
                        上一篇
                    </button>
                </a>
                <#else>
                    <button class="mdui-btn">
                        没有了
                    </button>
            </#if>
            <#if nextPost??>
                <a href="${nextPost.fullPath!}">
                    <button class="mdui-btn">
                        下一篇
                    </button>
                </a>
                <#else>
                    <button class="mdui-btn">
                        没有了
                    </button>
            </#if>
        </div>
        <div class="comments my-card">
        <!--  评论区域  -->
        <#include "module/comment.ftl">
        <@comment post=post type="post" />
        <!--  评论区结束  -->
        </div>
    </div>

</main>

</@layout>