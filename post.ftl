<#include "module/macro.ftl">
<@layout title="${post.title!} - ${blog_title!}">
<main class="self-container mdui-container line-numbers">
    <div class="postContainerLeft animate__animated post_animate">
        <article class="post">
            <div class="mdui-card">
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
                            <span>${post.createTime?string["yyyy年MM月dd日"]!} 阅读:${post.visits!}</span>
                        </div>
                    </div>
                    <div class="pright">
                        <button class="copylink mdui-btn mdui-btn-icon mdui-ripple mdui-text-color-theme">
                            <i class="mdui-icon material-icons">share</i>
                        </button>
                    </div>
                </div>
                <div class="mdui-card-content mdui-typo js-toc-content">
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
        <div class="comments mdui-card">
        <!--  评论区域  -->
        <#include "module/comment.ftl">
        <@comment post=post type="post" />
        <!--  评论区结束  -->
        </div>
    </div>

    <div class="containerRight animate__animated post_animate">
        <div class="sticky">
            <div class="mdui-card">
                <div class="mdui-typo-title">目录</div>
                <div class="pindex index">
                
                </div>
            </div>

        </div>
    </div>
</main>
<div class="mdui-dialog" id="indexDialog">
    <div class="mdui-dialog-title">目录</div>
    <div class="mdui-dialog-content">
      <div class="mobileIndex indexs">
        
      </div>
    </div>
    <div class="mdui-dialog-actions">
      <button class="mdui-btn mdui-ripple" mdui-dialog-close>OK</button>
    </div>
</div>

</@layout>