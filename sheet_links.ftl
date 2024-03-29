<#include "module/macro.ftl">
<@layout title="友链 - ${blog_title!}">
<main class="my-container mdui-container">
  <div class="animate__animated post_animate">
    <article class="my-article my-card">
     
        <div class="links">
            <h3 class="pagetitle">${sheet.title!}</h3>
            <div class="mdui-typo">
              ${sheet.formatContent!}
            </div>
            <@linkTag method="listTeams">
              <#list teams as team>
                <h4>${team.team}</h4>
                <div class="linksBlock">
                  <#list team.links as link>
                      <a class="linkCard" href="${link.url!}" target="_blank">
                        <img class="lazyloadImg mdui-img-circle" data-src="${(link.logo != '') ? string('${link.logo}','${theme_base!}/source/images/friendlink.png')}" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC" />
                        <div class="linkDesc">
                        <span>${link.name!}</span>
                        <span>${link.description!}</span>
                        </div>
                      </a>
                    
                  </#list>
                </div>
              </#list>
            </@linkTag>
        </div>
      
    </article>
    <div class="comments my-card">
    <!--  评论区域  -->
        <#include "module/comment.ftl">
        <@comment post=sheet type="sheet" />
    <!--  评论区结束  -->
    </div>
  </div>  
</main>
</@layout>