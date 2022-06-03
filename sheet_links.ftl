<#include "module/macro.ftl">
<@layout title="友链 - ${blog_title!}">
<main class="self-container mdui-container">
  <div class="containerLeft">
    <article class="post">
      <div class="mdui-card">
        <div class="links">
            <h3 class="pagetitle">${sheet.title!}</h3>
            <div class="mdui-typo mdui-card-content">
              ${sheet.formatContent!}
            </div>
            <@linkTag method="listTeams">
              <#list teams as team>
                <h4>${team.team}</h4>
                <div class="linksBlock">
                  <#list team.links as link>
                    <div class="linkCard">
                      <a href="${link.url!}" target="_blank">
                        <img class="mdui-img-circle" src="${link.logo}"/>
                        <span>${link.name!}</span>
                      </a>
                    </div>
                  </#list>
                </div>
              </#list>
            </@linkTag>
        </div>
      </div>
    </article>
    
    <!--  评论区域  -->
        <#include "module/comment.ftl">
        <@comment post=sheet type="sheet" />
    <!--  评论区结束  -->
  </div>  
</main>
</@layout>