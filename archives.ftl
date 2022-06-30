<#include "module/macro.ftl">
<@layout title="归档 - ${blog_title!}">
<main class="self-container mdui-container">
  <div class="containerLeft">
    <article class="post">
      <div class="mdui-card">
      <div class="archives">
      <h3 class="pagetitle">归档</h3>
      <div class="archMain">
        <#list archives as archive>
            <div class="archCell wow animate__animated animate__fadeInUp animate__slow">
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
            </div>
        </#list>
        </div>
      </div>
      </div>
    </article>

    <#if posts.totalPages gt 1>
        <@paginationTag method="archives" page="${posts.number}" total="${posts.totalPages}" display="3">
                <#include "module/turnPages.ftl">
                <@turnPages/>
        </@paginationTag>
    </#if>
  </div>  
</main>

</@layout>
