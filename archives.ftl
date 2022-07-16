<#include "module/macro.ftl">
<@layout title="归档 - ${blog_title!}">
<main class="my-container mdui-container">
  <div class="animate__animated post_animate">
    <article class="my-article my-card archivesPadding">
      
      <div class="archives">
      <h3 class="pagetitle">归档</h3>
      <div class="archMain">
        <#list archives as archive>
            <div class="archCell wow animate__animated post_animate">
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

        <#if posts.totalPages gt 1>
        <@paginationTag method="archives" page="${posts.number}" total="${posts.totalPages}" display="3">
                <#include "module/turn_pages.ftl">
                <@turn_pages/>
        </@paginationTag>
        </#if>
     
    </article>


  </div>  
</main>

</@layout>
