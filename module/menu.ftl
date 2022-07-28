<@menuTag method="list">
<header>
    <div class="mdui-appbar mdui-appbar-fixed ${(settings.auto_headroom!default) ? string('mdui-appbar-scroll-hide','')} mdui-shadow-0 mdui-appbar-inset mdui-drawer-full-height" id="selfAppbar">
        <div class="nse mdui-toolbar mdui-color-theme-100 mdui-text-color-theme">
            <a href="javascript:;" class="mdui-btn mdui-btn-icon" mdui-drawer="{overlay: true, target: '#left-drawer'}">
                <i class="mdui-icon material-icons">menu</i>
            </a>
            <a href="${blog_url!}" class="mdui-typo-title">${blog_title!}</a>
            <div class="mdui-toolbar-spacer"></div>

            <a class="searchNew mdui-btn mdui-btn-icon">
                <i class="mdui-icon material-icons">search</i>
            </a>
            <form class="searchInput dark" method="get" action="/search" role="search">
              
                <button type="button" class="back mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">arrow_back</i></button>
                <button type="button" class="searchIcon mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">search</i></button>
                <input type="text" placeholder="搜索一下..." name="keyword">
                <button type="button" class="backClose mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">close</i></button>
                
            </form>

            
            
            <a href="/journals" class="mdui-btn mdui-btn-icon nodesk">
                <i class="mdui-icon material-icons">self_improvement</i>
            </a>

            <#if settings.dark_enabled!false>
              <a class="mdui-btn mdui-btn-icon darkButton">
                <i class="mdui-icon material-icons">brightness_6</i>
              </a>   
            </#if>
               
        </div> 
    </div>
    <div class="searchMask"></div>
</header>
        
      
<aside class="mdui-drawer mdui-drawer-close" id="left-drawer">
  <div class="headerLogo" style="background-image: url('${settings.drawimg!'${theme_base!}/source/images/indexBack.jpg'}')">
    <img class="mdui-img-circle mdui-shadow-2" src="${settings.avatarLogo!'${theme_base!}/source/images/avatar.png'}" alt="">
    <span class="drawTitle">${user.nickname!}</span>

    <div class="swtoc">
    
      <button data-toggle="toc" class="swtocl mdui-btn mdui-color-theme-accent mdui-btn-dense mdui-ripple mdui-btn-raised">目录</button>
    </div>
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
  <div class="toc-content"></div>
</aside>
      
</@menuTag>