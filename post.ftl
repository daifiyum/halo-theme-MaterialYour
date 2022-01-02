<#include "module/macro.ftl">
<@layout title="${post.title!} - ${blog_title!}">


<main class="self-container mdui-container">
  <div class="containerLeft pwidth">
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
            <img class="mdui-img-circle" src="${blog_logo!}" alt="${user.nickname!}">
            <div>
              <span>${user.nickname!}</span>
              <span>${post.createTime?string["yyyy年MM月dd日"]!}</span>
            </div>
          </div>
          <div class="pright">
            <button class="copylink mdui-btn mdui-btn-icon mdui-ripple mdui-text-color-theme"><i
                class="mdui-icon material-icons">share</i></button>
          </div>
        </div>
        <div class="mdui-card-content">
          ${post.formatContent!}
        </div>
        <div class="pbottom">
              <div>分类:
                <#if (post.categories)?? && post.categories?size !=0>
                    <#list post.categories as categorie>
                        <a href="${categorie.fullPath!}">${categorie.name!}</a>
                    </#list>
                <#else>
                    <span>无</span>
                </#if>
              </div>
              <div>标签:
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
    <div class="comments mdui-card">
        <#include "module/comment.ftl">
        <@comment post=post type="post" />
    </div>
  </div>
</main>

    
</@layout>
