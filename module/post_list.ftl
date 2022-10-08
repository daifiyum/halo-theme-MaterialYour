<#macro post_list>
    <#if posts.content?size gt 0>
        <#if settings.postlist_style == 'style1'>
            <div class="post-list" id="pload">
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

                            <a href="${post.fullPath!}" class="post-list-content" target="${(settings.postBlank_enabled!default) ? string('_blank','_self')}">
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
                            <div class="mdui-card-primary-subtitle"><i class="mdui-icon material-icons">today</i>${post.createTime?string["yyyy年MM月dd日"]!}</div>
                            <div class="mdui-card-primary-subtitle"><i class="mdui-icon material-icons">chat_bubble_outline</i>${post.commentCount!}条评论</div>
                        </div>
                    </article>
                </#list>
            </div>
        <#else>
            <div class="post-list2" id="pload">
                <#list posts.content as post>
                    <article class="pl2-layout wow animate__fadeIn animate__animated animate__slow">
                        <#if post.thumbnail?? && post.thumbnail!=''>
                            <div class="pthumb" onclick="window.location.href='${post.fullPath!}'">
                                <a href="${post.fullPath!}" class="poalink" target="${(settings.postBlank_enabled!default) ? string('_blank','_self')}">
                                    <img class="lazyloadImg" data-src="${post.thumbnail!}" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC" />
                                </a>
                            </div>
                        </#if>
                        <div class="post_box p16">
                            <div class="al">
                                <h2 class="post_title">
                                    <a href="${post.fullPath!}" class="poalink alink" target="${(settings.postBlank_enabled!default) ? string('_blank','_self')}">
                                    ${post.title}
                                    </a>
                                </h2>
                                <div class="sometips">
                                <#if post.topped>
                                    <span>置顶</span>
                                    </#if>
                                    <#if (post.categories)?? && post.categories?size !=0>
                                    <#list post.categories as categorie>
                                    <a href="${categorie.fullPath!}">${categorie.name!}</a>
                                    </#list>
                                    </#if>
                                </div>
                                <p>${post.summary!}
                                </p>
                            </div>
                            <div class="sometools">
                                <div class="time"><i class="mdui-icon material-icons">today</i>${post.createTime?string["yyyy年MM月dd日"]!}</div>
                                <div class="comment"><i class="mdui-icon material-icons">chat_bubble_outline</i>${post.commentCount!}条评论</div>
                            </div>
                        </div>
                    </article>
                </#list>
            </div>
        </#if>
    <#else>
        <div class="my-card nothing-layout">
            <div class="nothings">
                <img src="${theme_base!}/source/images/nothing.svg" alt="">
                <p>空空如也</p>
            </div>
        </div>
    </#if>
</#macro>