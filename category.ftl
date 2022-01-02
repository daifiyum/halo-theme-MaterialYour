<#include "module/macro.ftl">
<@layout title="分类：${category.name} - ${blog_title!}">
<main class="self-container mdui-container">
  <div class="containerLeft pwidth">
    <article class="post">
      <div class="mdui-card">
        <ul>
        <#list posts.content as post>
            <li>
                <a href="${post.fullPath}">${post.title}</a>
            </li>
        </#list>
        </ul>
      </div>
    </article>
    <#if posts.totalPages gt 1>
        <div class="nextpage mdui-card">
            <@paginationTag method="categoryPosts" page="${posts.number}" total="${posts.totalPages}" display="3" slug="${category.slug!}">
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
</main>

</@layout>
