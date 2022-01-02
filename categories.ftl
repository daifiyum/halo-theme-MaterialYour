<#include "module/macro.ftl">
<@layout title="分类列表 - ${blog_title!}">
<main class="self-container mdui-container">
  <div class="containerLeft pwidth">
    <article class="post">
      <div class="mdui-card">
        <ul>
        <@categoryTag method="list">
            <#if categories?? && categories?size gt 0>
                <#list categories as category>
                    <li><a href="${category.fullPath!}">${category.name}</a></li>
                </#list>
            </#if>
        </@categoryTag>
    </ul>
      </div>
    </article>
  </div>  
</main>


</@layout>
