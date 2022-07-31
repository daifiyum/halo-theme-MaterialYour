<#include "module/macro.ftl">
<@layout title="${sheet.title!} - ${blog_title!}">
<main class="my-container mdui-container">
    <div class="animate__animated post_animate">
        <article class="my-article my-card">
            
                <#if post.thumbnail?? && post.thumbnail!=''>
                    <div class="mdui-card-media">
                        <div class="postBackground" style="background-image: url('${post.thumbnail!}')"></div>
                        <div class="mdui-card-media-covered mdui-card-media-covered-gradient">
                            <div class="mdui-card-primary">
                                <div class="mdui-card-primary-title">${sheet.title!}</div>
                            </div>
                        </div>
                    </div>
                    <#else>
                        <div class="noimg">
                            <h2 class="mdui-card-primary-title">${sheet.title!}</h2>
                        </div>
                </#if>

                <div class="postFront">
                    <div class="pleft">
                        <img class="mdui-img-circle" src="${settings.avatarLogo!'${theme_base!}/source/images/avatar.png'}" alt="${user.nickname!}">
                        <div>
                            <span>${user.nickname!}</span>
                            <span class="pls">${post.createTime?string["yyyy年MM月dd日"]!}&nbsp;&nbsp;·&nbsp;&nbsp;阅读&nbsp;${post.visits!}</span>
                        </div>
                    </div>
                    <div class="pright">
                        <button class="postCopyLink mdui-btn mdui-btn-icon mdui-ripple mdui-text-color-theme" data-clipboard-text="${blog_url!}${post.fullPath!}">
                            <i class="mdui-icon material-icons">share</i>
                        </button>
                    </div>
                </div>
                <div class="mdui-typo typo-layout">
                    ${sheet.formatContent!}
                </div>
            
        </article>
        <div class="comments my-card">
        <!--  评论区域  -->
        <#include "module/comment.ftl">
        <@comment post=sheet type="sheet" />
        <!--  评论区结束  -->
        </div>
    </div>
</main>
</@layout>