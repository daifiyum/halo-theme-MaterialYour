<@menuTag method="list">
      <header>
        <div class="mdui-appbar mdui-appbar-fixed mdui-color-theme-100 mdui-text-color-theme mdui-shadow-0" id="selfAppbar">
          <div class="mdui-toolbar">
              <a href="javascript:;" class="mdui-btn mdui-btn-icon" mdui-drawer="{target: '#left-drawer'}">
                <i class="mdui-icon material-icons">menu</i>
              </a>
              <a href="${blog_url!}" class="mdui-typo-title">${blog_title!}</a>
              <div class="mdui-toolbar-spacer"></div>
              
              <form method="get" action="/search" role="search">
                <i class="mdui-icon material-icons">search</i>
                <input type="text" placeholder="搜索一下..." name="keyword">

              </form>
            
              <a href="javascript:;" class="i1 mdui-btn mdui-btn-icon">
                <i class="btSearch mdui-icon material-icons">search</i>
              </a>
              
          </div>
        </div>
      </header>
      <aside class="mdui-drawer" id="left-drawer">
        <div class="headerLogo mdui-text-color-theme">
          <img class="mdui-img-circle" src="${blog_logo!}" alt="">
          <span class="mdui-typo-title">${blog_title!}</span>
        </div>
        <ul class="mdui-list">
          <#list menus?sort_by('priority') as menu>
          <a href="${menu.url}">
            <li class="mdui-list-item mdui-ripple">
              <i class="mdui-list-item-icon mdui-icon material-icons">${menu.icon!}</i>
              <div class="mdui-list-item-content">${menu.name}</div>
            </li>
          </a>
          </#list>
        </ul>
      </aside>
</@menuTag>