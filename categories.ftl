<#include "module/macro.ftl">
<@layout title="分类列表 - ${blog_title!}">
<main class="self-container mdui-container">
  <div class="containerLeft animate__animated post_animate">
    <article class="post">
      <div class="mdui-card">
      <div class="categories">
        <h3 class="pagetitle">分类</h3>
        <ul>
        <@categoryTag method="list">
            <#if categories?? && categories?size gt 0>
                <#list categories as category>
                  <div class="catelist">
                    <i class="mdui-icon">
                      <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="img" width="24" height="24" preserveAspectRatio="xMidYMid meet" viewBox="0 0 1024 1024">
                        <path fill="currentColor" d="M928 444H820V330.4c0-17.7-14.3-32-32-32H473L355.7 186.2a8.15 8.15 0 0 0-5.5-2.2H96c-17.7 0-32 14.3-32 32v592c0 17.7 14.3 32 32 32h698c13 0 24.8-7.9 29.7-20l134-332c1.5-3.8 2.3-7.9 2.3-12c0-17.7-14.3-32-32-32zM136 256h188.5l119.6 114.4H748V444H238c-13 0-24.8 7.9-29.7 20L136 643.2V256zm635.3 512H159l103.3-256h612.4L771.3 768z"/>
                      </svg>
                    </i>
                    <li><a href="${category.fullPath!}">${category.name} （${category.postCount!0}）</a></li>
                  </div>
                </#list>
            </#if>
        </@categoryTag>
        </ul>

      </div>
        
      </div>
    </article>
  </div>  
</main>


</@layout>
