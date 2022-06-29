<#include "module/macro.ftl">
<@layout title="${post.title!} - ${blog_title!}">
<main class="self-container mdui-container line-numbers">
    <div class="containerLeft">
        <article class="post">
            <div class="mdui-card">
                <#if post.thumbnail?? && post.thumbnail!=''>
                    <div class="mdui-card-media">
                        <div class="postBackground" style="background-image: url('${post.thumbnail!}')"></div>
                        <div class="mdui-card-media-covered mdui-card-media-covered-gradient">
                            <div class="mdui-card-primary">
                                <div class="mdui-card-primary-title">${post.title!}</div>
                            </div>
                        </div>
                    </div>
                    <#else>
                        <div class="noimg">
                            <h2 class="mdui-card-primary-title">${post.title!}</h2>
                        </div>
                </#if>

                <div class="postFront">
                    <div class="pleft">
                        <img class="mdui-img-circle" src="${blog_logo!}" alt="${user.nickname!}">
                        <div>
                            <span>${user.nickname!}</span>
                            <span>${post.createTime?string["yyyy年MM月dd日"]!} 阅读:${post.visits!}</span>
                        </div>
                    </div>
                    <div class="pright">
                        <button class="copylink mdui-btn mdui-btn-icon mdui-ripple mdui-text-color-theme">
                            <i class="mdui-icon material-icons">share</i>
                        </button>
                    </div>
                </div>
                <div id="images" class="mdui-card-content mdui-typo js-toc-content">
                    ${post.formatContent!}
                </div>
                <div class="pbottom mdui-card-primary-subtitle">
                    <div class="smallbu">分类:
                        <#if (post.categories)?? && post.categories?size !=0>
                            <#list post.categories as categorie>
                                <a href="${categorie.fullPath!}">${categorie.name!}</a>
                            </#list>
                            <#else>
                                <span>无</span>
                        </#if>
                    </div>
                    <div class="smallbu2">标签:
                        <#if (post.tags)?? && post.tags?size !=0>
                            <#list post.tags as tag>
                                <a href="${tag.fullPath!}">${tag.name!}</a>
                            </#list>
                            <#else>
                                <span>无</span>
                        </#if>
                    </div>
                </div>
            </div>
        </article>
        <div class="nextPost">
            <#if prevPost??>
                <a href="${prevPost.fullPath!}">
                    <button class="mdui-btn">
                        上一篇
                    </button>
                </a>
                <#else>
                    <button class="mdui-btn">
                        没有了
                    </button>
            </#if>
            <#if nextPost??>
                <a href="${nextPost.fullPath!}">
                    <button class="mdui-btn">
                        下一篇
                    </button>
                </a>
                <#else>
                    <button class="mdui-btn">
                        没有了
                    </button>
            </#if>
        </div>
        <!--  评论区域  -->
        <#include "module/comment.ftl">
        <@comment post=post type="post" />
        <!--  评论区结束  -->
    </div>

    <div class="containerRight">
        <div class="sticky">
            <div class="mdui-card">
                <div class="profile">
                    <div class="protop">
                        <img class="mdui-shadow-2" src="${blog_logo!}" alt="">
                        <div class="pttext">
                            <p>${user.nickname!}</p>
                            <small>${settings.profile_desc!}</small>
                        </div>
                    </div>
                    <div class="ptc">
                    
                            <a href="${settings.github!}" target="_blank">
                                <div class="mdui-chip mdui-color-theme-100 mdui-text-color-theme">
                                    <span class="mdui-chip-title"> <i class="mdui-icon icon-github"></i>GitHub</span>
                                </div>
                            </a>
                            <a href="mailto:${settings.email!}" target="_blank">
                                <div class="mdui-chip mdui-color-theme-100 mdui-text-color-theme">
                                    <span class="mdui-chip-title"> <i class="mdui-icon icon-mail"></i>E-mail</span>
                                </div>
                            </a>

                    </div>
                    <div class="ptb">
                        <div class="ptbz">
                            <@postTag method="count">
                                <span>${count!0}</span>
                            </@postTag>
                            <p>文章</p>
                        </div>
                        <div class="ptbz">
                            <@categoryTag method="count">
                                <span>${count!0}</span>
                            </@categoryTag>
                            <p>分类</p>
                        </div>
                        <div class="ptbz">
                            <@tagTag method="count">
                                <span>${count!0}</span>
                            </@tagTag>
                            <p>标签</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mdui-card">
                <div class="mdui-typo-title">分类</div>
                <div class="scrollbar">
                    <@categoryTag method="list">
                        <#list categories as category>
                            <a href="${category.fullPath!}">
                                <div class="mdui-chip mdui-color-theme-100 mdui-text-color-theme">
                                    <span class="mdui-chip-title">${category.name}
                                        （${category.postCount!0}）</span>
                                </div>
                            </a>
                        </#list>
                    </@categoryTag>
                </div>
            </div>
            <div class="mdui-card">
                <div class="mdui-typo-title">目录</div>
                <div class="pindex index">
                
                </div>
            </div>

        </div>
    </div>
</main>
<div class="mdui-dialog" id="indexDialog">
    <div class="mdui-dialog-content">
      <div class="mdui-dialog-title">目录</div>
      <div class="mobileIndex indexs">
        
      </div>
    </div>
    <div class="mdui-dialog-actions">
      <button class="mdui-btn mdui-ripple" mdui-dialog-close>OK</button>
    </div>
</div>
<script>
    function switchIndex(){
            var d = 0;
            if(window.innerWidth < 800){
                    tocbot.init({
                    tocSelector: '.indexs',
                    contentSelector: '.js-toc-content',
                    headingSelector: 'h1, h2, h3, h4, h5, h6',
                    hasInnerContainers: true,
                    headingsOffset: 80, 
                    scrollSmoothOffset: -80, 
                });
            }else{
                    tocbot.init({
                    tocSelector: '.index',
                    contentSelector: '.js-toc-content',
                    headingSelector: 'h1, h2, h3, h4, h5, h6',
                    hasInnerContainers: true,
                    headingsOffset: 80, 
                    scrollSmoothOffset: -80, 
                    });
            }

            $(window).resize(function(){
                if(d == 0){
                    d++;
                    switchIndex();
                }
                
            });
        }
    
    
    $(document).ready(function () {
        switchIndex();
        $('#images').viewer();
    });    
</script>
</@layout>