<#include "module/macro.ftl">
<@layout title="相册 - ${blog_title!}">
<#--  偷懒，水个相册页  -->
<main class="self-container mdui-container">
  <div class="containerLeft">
    <article class="post">
      <div class="mdui-card">
      <div class="photos">
        <h3 class="pagetitle">相册</h3>
            <@photoTag method="listTeams">
            <div class="mdui-tab" id="tab">
              <a href="#all" class="mdui-ripple">所有</a>
            <#list teams as team>
            <#if team.team != ''>
              <a href="#${team.team}" class="mdui-ripple">${team.team}</a>
            </#if>
            </#list>
            </div>
            <div class="grid">
            <#list teams as team>
            <#list team.photos as photo>
              <div class="grid-item ${team.team}">
                  <img alt="${photo.description}" src="${photo.url}" />
                  <div class="picDesc">
                        <#if photo.description != ''>
                        <div class="picz">
                          <i class="mdui-icon material-icons">landscape</i>${photo.description}
                        </div>
                        </#if>
                        <#if photo.location != ''>
                        <div class="picz">
                          <i class="mdui-icon material-icons">pin_drop</i>${photo.location}
                        </div>
                        </#if>
                        <div class="picz">
                          <i class="mdui-icon material-icons">date_range</i>${photo.takeTime?string["yyyy-MM-dd"]!}
                        </div>
                  </div>
              </div>
            </#list>
            </#list>
            </div>
            </@photoTag>
      </div>
      </div>
    </article>       
  </div>  
</main>
  
</@layout>
