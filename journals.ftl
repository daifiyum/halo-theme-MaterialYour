<#include "module/macro.ftl">
<@layout title="说说 - ${blog_title!}">
<main class="my-container mdui-container">
  <div class="animate__animated post_animate">
    <article class="post my-card archivesPadding">
      
      <div class="journals">
        <h3 class="pagetitle">日志</h3>
        <#if journals.content?size gt 0>
        <ul class="journalList">
        <#list journals.content as journal>
          <li class="journItem">
            <div class="journLine">
              <i class="mdui-icon material-icons">create</i>
            </div>
            <div class="my-card jpadding wow animate__animated post_animate">
              <time>
                ${journal.createTime?string('yyyy年MM月dd日 HH:mm')}
              </time>
              <div class="journal-content mdui-typo">
                ${journal.content!}
              </div>
              <div class="journBottom">
                <div id="${journal.id}" class="jbleft likeb" clickNum="true">
                  <i class="mdui-icon material-icons">thumb_up</i>
                  <span>${journal.likes!0}</span>
                </div>
                <div class="jbleft chatb">
                  <i class="mdui-icon material-icons">chat</i>
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

      </div>
     <#if journals.totalPages gt 1>
        <@paginationTag method="journals" page="${journals.number}" total="${journals.totalPages}" display="3">
                <#include "module/turn_pages.ftl">
                <@turn_pages/>
        </@paginationTag>
        </#if>
    </article>
   
  </div> 
</main>

</@layout>
