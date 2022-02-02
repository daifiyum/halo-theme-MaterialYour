<@menuTag method="list">
      <header>
        <div class="mdui-appbar mdui-appbar-fixed mdui-shadow-0" id="selfAppbar">
          <div class="mdui-toolbar mdui-color-theme-100 mdui-text-color-theme">
              <a href="javascript:;" class="mdui-btn mdui-btn-icon" mdui-drawer="{target: '#left-drawer'}">
                <i class="mdui-icon material-icons">menu</i>
              </a>
              <a href="${blog_url!}" class="mdui-typo-title">${blog_title!}</a>
              <div class="mdui-toolbar-spacer"></div>
              
              <form class="mdui-color-theme-50 mdui-text-color-theme" method="get" action="/search" role="search">
                <i class="mdui-icon material-icons">search</i>
                <input class="mdui-textfield-input" type="text" placeholder="搜索一下..." name="keyword">

              </form>
            
              <a href="javascript:;" class="i1 mdui-btn mdui-btn-icon">
                <i class="btSearch mdui-icon material-icons">search</i>
              </a>
              
              <#if is_post??>
              <a href="javascript:;" class="mdui-btn mdui-btn-icon nodesk" mdui-dialog="{target: '#indexDialog'}">
                <i class="mdui-icon material-icons">assignment</i>
              </a>
              </#if>
              <a href="/journals" class="mdui-btn mdui-btn-icon nodesk">
                <i class="mdui-icon material-icons">self_improvement</i>
              </a>
          </div>
        </div>
      </header>
      
        
      
      <aside class="mdui-drawer mdui-card" id="left-drawer">
        <div class="headerLogo" style="background-image: url('${settings.drawimg!}')">
          <img class="mdui-img-circle mdui-shadow-2" src="${blog_logo!}" alt="">
          <span class="drawTitle">${user.nickname!}</span>
        </div>
        <ul class="mdui-list" mdui-collapse="{accordion: true}">
          <@menuTag method="tree">
            <#list menus as menu>
              <#if menu.children?? && menu.children?size gt 0>
                  <li class="mdui-collapse-item">
                    <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                      <i class="mdui-list-item-icon mdui-icon material-icons">${menu.icon!}</i>
                      <div class="mdui-list-item-content">${menu.name}</div>
                      <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
                    </div>
                    <ul class="mdui-collapse-item-body mdui-list mdui-list-dense">
                  <#list menu.children as child>
                      <a href="${child.url!}">
                        <li class="mdui-list-item mdui-ripple">${child.name!}</li>
                      </a>
                  </#list>
                    </ul>
                  </li>
              <#else>
                  <a href="${menu.url}">
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
      
</@menuTag>