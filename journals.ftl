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
              <i class="mdui-icon material-icons mdui-text-color-theme">create</i>
            </div>
            <div class="mdui-card">
              <time>
                ${journal.createTime?string('yyyy-MM-dd HH:mm:ss')}
              </time>
              <div class="mdui-typo">
                ${journal.content!}
              </div>
              <div class="journBottom">
                <div class="jbleft">
                  <span>${journal.likes!0}</span>
                  <i id="${journal.id}" class="mdui-icon material-icons likeb">favorite</i>
                </div>
              </div>
            </div>
          </li>
        </#list>
        </ul>
      </div>
      </div>
    </article>

            <#if journals.totalPages gt 1>
            <div class="nextpage mdui-card">
                <@paginationTag method="journals" page="${journals.number}" total="${journals.totalPages}" display="3">
                    <div>
                        <#if pagination.hasPrev>
                            <a href="${pagination.prevPageFullPath!}">
                                <button class="mdui-btn">
                                    上一页
                                </button>
                            </a>
                            <#else>
                                <button class="mdui-btn">
                                    没有了
                                </button>
                        </#if>
                    </div>
                    <div>
                        <#list pagination.rainbowPages as number>
                            <#if number.isCurrent>
                                <p>第${number.page!}页</p>
                                
                            </#if>
                        </#list>
                    </div>
                    <div>
                        <#if pagination.hasNext>
                            <a href="${pagination.nextPageFullPath!}">
                                <button class="mdui-btn">
                                    下一页
                                </button>
                            </a>
                            <#else>
                                <button class="mdui-btn">
                                    没有了
                                </button>
                        </#if>
                    </div>
                </@paginationTag>
            </div>
        </#if>
  </div>  
</main>

    
</@layout>
