<#macro postList>
        <#if posts.content?size gt 0>
        <div class="postLayout">
        <#list posts.content as post>
            <article class="wow animate__fadeIn animate__animated animate__slow">
                <a href="${post.fullPath!}">
                    <div class="mdui-card plistLayout">
                        <div class="selfLayout">
                            <div class="left">
                                <div class="mdui-card-primary">
                                    <div class="mdui-card-primary-subtitle">
                                        <#if post.topped>
                                        <span class="topped">
                                            置顶
                                        </span>
                                        </#if>
                                        <#if (post.categories)?? && post.categories?size !=0>
                                            <#list post.categories as categorie>
                                                <span class="cated">${categorie.name!}</span>
                                            </#list>
                                        </#if>
                                    </div>
                                    <div class="mdui-card-primary-title">${post.title}</div>
                                </div>
                                <div class="mdui-card-content">${post.summary!}</div>
                            </div>
                            <#if post.thumbnail?? && post.thumbnail!=''>
                                <div class="right">
                                    <div class="mdui-card-media">
                                        <img src="${post.thumbnail!}" />
                                    </div>
                                </div>
                            </#if>
                        </div>
                        <div class="postBottom">
                            <div class="mdui-card-primary-subtitle">
                                ${post.createTime?string["yyyy年MM月dd日"]!}</div>
                            <div class="mdui-card-primary-subtitle">${post.commentCount!}条评论</div>
                        </div>
                    </div>
                </a>
            </article>
        </#list>
         </div>
        <#else>
        <div class="mdui-card">
            <div class="nothings">
                <img src="${theme_base!}/source/images/nothing.svg" alt="">
                <p>空空如也</p>
            </div>
        </div>
       
        </#if>
</#macro>