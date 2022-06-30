<#include "module/macro.ftl">
<@layout title="说说 - ${blog_title!}">
<main class="self-container mdui-container">
  <div class="containerLeft">
    <article class="post">
      <div class="mdui-card">
      <div class="journals">
        <h3 class="pagetitle">说说</h3>
        <ul class="journalList">
        <#list journals.content as journal>
          <li>
            <div class="journLine">
              <i class="mdui-icon material-icons">create</i>
            </div>
            <div class="mdui-card jpadding wow animate__animated animate__fadeInUp animate__slow">
              <time>
                ${journal.createTime?string('yyyy-MM-dd HH:mm:ss')}
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
        <@paginationTag method="journals" page="${journals.number}" total="${journals.totalPages}" display="3">
          <#if pagination.hasNext>
              <button data-href="${pagination.nextPageFullPath!}" class="mdui-btn mdui-btn-raised mdui-btn-dense mdui-ripple mdui-center ajaxPostLists">加载更多</button>
          </#if>
        </@paginationTag>
      </div>
      </div>
    </article>
   
  </div> 
</main>

</@layout>
