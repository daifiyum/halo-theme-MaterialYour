<#include "module/macro.ftl">
<@layout title="标签列表 - ${blog_title!}">
<main class="self-container mdui-container">
  <div class="containerLeft">
    <article class="post">
      <div class="mdui-card">
      <div class="tags">
        <h3 class="pagetitle">标签</h3>
        <ul>
        <@tagTag method="list">
            <#if tags?? && tags?size gt 0>
                <#list tags as tag>
                <li>
                    <a href="${tag.fullPath!}" class="tagsa">
                        <div class="mdui-chip">
                            <span class="mdui-chip-title">${tag.name!}（${tag.postCount!}）</span>
                        </div>
                    </a>
                </li>
                </#list>
            </#if>
        </@tagTag>
        </ul>
      </div>
        
      </div>
    </article>
  </div>  
</main>
</@layout>
