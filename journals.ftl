<#include "module/macro.ftl">
<@layout title="说说 - ${blog_title!}">
<main class="self-container mdui-container">
  <div class="containerLeft animate__animated post_animate">
    <article class="post">
      <div class="mdui-card">
      <div class="journals">
        <h3 class="pagetitle">说说</h3>
        <#if journals.content?size gt 0>
        <ul class="journalList">
        <#list journals.content as journal>
          <li>
            <div class="journLine">
              <i class="mdui-icon material-icons">create</i>
            </div>
            <div class="mdui-card jpadding wow animate__animated post_animate">
              <time>
                ${journal.createTime?string('yyyy年MM月dd日 HH:mm')}
              </time>
              <div class="mdui-typo">
                ${journal.content!}
              </div>
              <div class="journBottom">
                <div class="jbleft">
                  <i id="${journal.id}" class="mdui-icon material-icons likeb" clickNum="true">thumb_up</i>
                  <span>${journal.likes!0}</span>
                </div>
                <div class="jbleft">
                  <i class="mdui-icon material-icons chatb">chat</i>
                  <span>${journal.commentCount!0}</span>
                </div>
              </div>
              <div class="journComment">
                <#include "module/comment.ftl">
                <@comment post=journal type="journal" />
              </div>
            </div>
          </li>
        </#list>
        </ul>
        <#else>
          <div class="nothings">
              <img src="${theme_base!}/source/images/nothing.svg" alt="">
              <p>空空如也</p>
          </div>
        </#if>

        <#if journals.totalPages gt 1>
        <@paginationTag method="journals" page="${journals.number}" total="${journals.totalPages}" display="3">
                <#include "module/turnPages.ftl">
                <@turnPages/>
        </@paginationTag>
        </#if>

      </div>
      </div>
    </article>
   
  </div> 
</main>

</@layout>
