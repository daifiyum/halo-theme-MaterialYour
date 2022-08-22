<#macro social_link>

    <#if settings.github??>
        
            <a target="_blank" class="mdui-btn mdui-btn-icon" class="mdui-btn mdui-btn-icon" href="https://github.com/${settings.github}" title="GitHub">
                <i class="mdui-icon ri-github-line"></i>
            </a>
        
    </#if>

    <#if settings.email??>
        
            <a target="_blank" class="mdui-btn mdui-btn-icon" href="mailto:${settings.email}" title="Email">
                <i class="mdui-icon ri-mail-line"></i>
            </a>
        
    </#if>

    <#if settings.telegram??>
        
            <a target="_blank" class="mdui-btn mdui-btn-icon" href="https://t.me/${settings.telegram}" title="Telegram">
                <i class="mdui-icon ri-telegram-line"></i>
            </a>
        
    </#if>

    <#if settings.bilibili??>
        
            <a target="_blank" class="mdui-btn mdui-btn-icon" href="https://space.bilibili.com/${settings.bilibili}" title="bilibili">
                <i class="mdui-icon ri-bilibili-line"></i>
            </a>
        
    </#if>

    <#if settings.weibo??>
        
            <a target="_blank" class="mdui-btn mdui-btn-icon" href="https://weibo.com/${settings.weibo}" title="Weibo">
                <i class="mdui-icon ri-weibo-line"></i>
            </a>
        
    </#if>

    <#if settings.qq??>
        
            <a target="_blank" class="mdui-btn mdui-btn-icon" href="tencent://message/?uin=${settings.qq}&Site=&Menu=yes" title="QQ">
                <i class="mdui-icon ri-qq-line"></i>
            </a>
        
    </#if>

    <#if settings.twitter??>
        
            <a target="_blank" class="mdui-btn mdui-btn-icon" class="mdui-btn mdui-btn-icon" href="https://twitter.com/${settings.twitter}" title="Twitter">
                <i class="mdui-icon ri-twitter-line"></i>
            </a>
        
    </#if>

    <#if settings.facebook??>
        
            <a target="_blank" class="mdui-btn mdui-btn-icon" href="https://www.facebook.com/${settings.facebook}" title="Facebook">
                <i class="mdui-icon ri-facebook-line"></i>
            </a>
        
    </#if>

    <#if settings.instagram??>
        
            <a target="_blank" class="mdui-btn mdui-btn-icon" href="https://www.instagram.com/${settings.instagram}" title="Instagram">
                <i class="mdui-icon ri-instagram-line"></i>
            </a>
        
    </#if>

    <#if settings.myrss!true>
            <a target="_blank" class="mdui-btn mdui-btn-icon" href="${rss_url!}" title="rss">
                <i class="mdui-icon ri-rss-line"></i>
            </a>
    </#if>

</#macro>