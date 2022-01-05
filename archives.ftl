<#include "module/macro.ftl">
<@layout title="归档 - ${blog_title!}">
<main class="self-container mdui-container">
  <div class="containerLeft">
    <article class="post">
      <div class="mdui-card">
      <div class="archives">
      <h3 class="pagetitle">归档</h3>
        <#list archives as archive>
              <div class="archiveyear">
                  ${archive.year?c}
              </div>
      
              <#list archive.posts as post>
              <div class="timenode">
              <a href="${post.fullPath!}" class="focircle">
                  <time>${post.createTime?string["MMM d"]}</time>
                  <span>
                    ${post.title!}
                  </span>
              </a>
              </div>
              </#list>
        </#list>
      </div>
      </div>
    </article>
    <#if posts.totalPages gt 1>
        <div class="nextpage mdui-card">
            <@paginationTag method="archives" page="${posts.number}" total="${posts.totalPages}" display="3">
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
