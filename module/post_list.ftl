<#macro post_list>
        <#if posts.content?size gt 0>
        <div class="post-list">
        <#list posts.content as post>
            <article class="mdui-card post-item wow animate__fadeIn animate__animated animate__slow">
                <div class="post-list-main">
                    <#if (post.topped) || ((post.categories)?? && post.categories?size !=0) >
                    <div class="post-list-top mdui-card-primary-subtitle">
                        <#if post.topped>
                            <span class="topped">置顶</span>
                        </#if>
                        <#if (post.categories)?? && post.categories?size !=0>
                        <#list post.categories as categorie>
                            <a href="${categorie.fullPath!}">${categorie.name!}</a>
                        </#list>
                        </#if>
                    </div>
                    </#if>
                    
                    <a href="${post.fullPath!}" class="post-list-content">
                        <div class="post-l-left">
                            <div class="post-list-title">${post.title}</div>
                            <div class="post-list-summary">${post.summary!}</div>
                        </div>
                        <#if post.thumbnail?? && post.thumbnail!=''>
                        <div class="post-l-right">
                            <img class="post-list-thumbnail lazyloadImg" data-src="${post.thumbnail!}" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC" />
                        </div>
                        </#if>
                    </a>
                </div>
                
                <div class="post-list-bottom">
                    <div class="mdui-card-primary-subtitle">${post.createTime?string["yyyy年MM月dd日"]!}</div>
                    <div class="mdui-card-primary-subtitle">${post.commentCount!}条评论</div>
                </div>
            </article>
        </#list>
         </div>
        <#else>
        <div class="my-card nothing-layout">
            <div class="nothings">
                <img src="${theme_base!}/source/images/nothing.svg" alt="">
                <p>空空如也</p>
            </div>
        </div>
       
        </#if>
</#macro>