<#include "module/macro.ftl">
<@layout title="分类列表 - ${blog_title!}">
<main class="my-container mdui-container">
  <div class="animate__animated post_animate">
    <article class="my-article my-card">
    
      <div class="categories">
        <h3 class="pagetitle">分类</h3>
        <ul>
        <@categoryTag method="list">
            <#if categories?? && categories?size gt 0>
                <#list categories as category>
                  <div class="catelist">
                    <i class="mdui-icon material-icons">folder_open</i>
                    <li><a href="${category.fullPath!}">${category.name} （${category.postCount!0}）</a></li>
                  </div>
                </#list>
            </#if>
        </@categoryTag>
        </ul>

      </div>
        
     
    </article>
  </div>  
</main>


</@layout>
