<@menuTag method="list">
<header>
    <div class="mdui-appbar mdui-appbar-fixed ${(settings.auto_headroom!default) ? string('mdui-appbar-scroll-hide','')} mdui-shadow-0 mdui-drawer-full-height" id="selfAppbar">
        <div class="nse mdui-toolbar mdui-color-theme-100 mdui-text-color-theme">
            <a href="javascript:;" class="mdui-btn mdui-btn-icon mdui-ripple" mdui-drawer="{overlay: true, target: '#left-drawer'}">
                <i class="mdui-icon material-icons">menu</i>
            </a>
            <a href="${blog_url!}" class="mdui-typo-title">${blog_title!}</a>
            <div class="mdui-toolbar-spacer"></div>

            <a class="searchNew mdui-btn mdui-btn-icon mdui-ripple">
                <i class="mdui-icon material-icons">search</i>
            </a>
            <form class="searchInput dark" method="get" action="/search" role="search">
              
                <button type="button" class="back mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">arrow_back</i></button>
                <button type="button" class="searchIcon mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">search</i></button>
                <input type="text" placeholder="搜索一下..." name="keyword">
                <button type="button" class="backClose mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">close</i></button>
                
            </form>

            
            
            <a href="/journals" class="mdui-btn mdui-btn-icon nodesk mdui-ripple">
                <i class="mdui-icon material-icons">${settings.journal_icon!'self_improvement'}</i>
            </a>

            <button class="mdui-btn mdui-btn-icon toc_button mdui-ripple" mdui-drawer="{target: '#right-drawer'}"><i class="mdui-icon material-icons">assignment</i></button>

            <#if settings.dark_enabled!false>
              <button class="mdui-btn mdui-btn-icon mdui-ripple darkButton">
                <i class="mdui-icon material-icons">brightness_6</i>
              </button>   
            </#if>
               
        </div> 
    </div>
    <div class="searchMask"></div>
</header>
        
      
<aside class="mdui-drawer mdui-drawer-close drawer-left" id="left-drawer">
  <div class="headerLogo" style="background-image: url('${settings.drawimg!'${theme_base!}/source/images/indexBack.jpg'}')">
    <img class="mdui-img-circle mdui-shadow-2" src="${settings.avatarLogo!'${theme_base!}/source/images/avatar.png'}" alt="">
    <span class="drawTitle">${user.nickname!}</span>
  </div>


 

  <ul class="mdui-list swmenu" mdui-collapse="{accordion: true}">
    <@menuTag method="tree">
      <#list menus?sort_by('priority') as menu>
        <#if menu.children?? && menu.children?size gt 0>
            <li class="mdui-collapse-item">
              <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons">${menu.icon!}</i>
                <div class="mdui-list-item-content">${menu.name}</div>
                <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
              </div>
              <ul class="mdui-collapse-item-body mdui-list mdui-list-dense">
            <#list menu.children as child>
                <a href="${child.url!}" target="${child.target!}">
                  <li class="mdui-list-item mdui-ripple">${child.name!}</li>
                </a>
            </#list>
              </ul>
            </li>
        <#else>
            <a href="${menu.url}" target="${menu.target!}">
              <li class="mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons">${menu.icon!}</i>
                <div class="mdui-list-item-content">${menu.name}</div>
              </li>
            </a>
        </#if>
      
      </#list>
    
    </@menuTag>
  </ul>
  
</aside>
<div class="mdui-drawer mdui-drawer-right toc_drawer" id="right-drawer">
    <div class="toc_title">目录</div>
    <div class="toc-content"></div>
</div>
      
</@menuTag>