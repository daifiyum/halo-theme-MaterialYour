<#include "social_link.ftl">

<#macro home_banner>
            <div class="home-banner animate__animated">
            <div class="welcome_media">
                <img src="${settings.indeximg!'${theme_base!}/source/images/indexBack.jpg'}" alt="">
            </div>
            <div class="welcome">
                <div class="welcome_hello"></div>
                <div class="welcome_descr">
                <#if settings.aWord_enabled != true>
                    ${settings.index_notice!default}
                </#if>
                </div>
                <div class="welcome_contact">
                    <@social_link/>
                </div>
            </div>
            <div class="welcome__figures">
                <div class="welcome__stat">
                    <@postTag method="count">
                        <span class="welcome__count">${count!0}</span> 
                    </@postTag>
                    <span class="welcome__count-descr">文章数</span>
                </div>
                <div class="welcome__stat">
                    <@categoryTag method="count">
                        <span class="welcome__count">${count!0}</span> 
                    </@categoryTag>
                    <span class="welcome__count-descr">分类数</span>
                </div>
                <div class="welcome__stat">
                    <@tagTag method="count">
                        <span class="welcome__count">${count!0}</span> 
                    </@tagTag>
                    <span class="welcome__count-descr">标签数</span>
                </div>
                <div class="welcome__stat">
                    <@commentTag method="count">
                        <span class="welcome__count">${count!0}</span> 
                    </@commentTag>
                    <span class="welcome__count-descr">评论数</span>
                </div>
            </div>
        </div>
</#macro>