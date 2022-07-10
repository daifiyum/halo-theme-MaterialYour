<@menuTag method="list">
<header>
    <div class="mdui-appbar mdui-appbar-fixed mdui-shadow-0" id="selfAppbar">
        <div class="nse mdui-toolbar mdui-color-theme-100 mdui-text-color-theme">
            <a href="javascript:;" class="mdui-btn mdui-btn-icon" mdui-drawer="{target: '#left-drawer'}">
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
                <#--  <div class="seh"></div>  -->
                <button type="button" class="backClose mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">close</i></button>
             
            </form>
            
            <#--  <#if is_post??>  -->
                <a href="javascript:;" class="mdui-btn mdui-btn-icon nodesk nodindex" mdui-dialog="{target: '#indexDialog'}">
                    <i class="mdui-icon material-icons">assignment</i>
                </a>
            <#--  </#if>  -->

            <a href="/journals" class="mdui-btn mdui-btn-icon nodesk">
                <i class="mdui-icon material-icons">self_improvement</i>
            </a>

            <!--Material Player-->
            <#--  <div id="mp-music" data-autoplay="no" data-autoplaynext="yes" style="overflow: initial;line-height: 0px;">
                
                <div id="mp-music-wrapper" class="">
                    <div id="mp-list" style="display: none; width: 0px;">
                        <ul>

                        </ul>
                    </div>
                    <div id="mp-ctrl-group">
                        <button id="mp-music-album" class=" mp-mdl-button  mp-mdl-button--icon"><i
                                class="material-icons">music_note</i>
                        </button>
                        <div id="mp-hide-panel">
                            <div id="mp-ctrl-panel">
                                <button id="mp-music-volume" class=" mp-mdl-button mp-mdl-button--icon"><i
                                        class="material-icons">volume_up</i></button>
                                <button id="mp-music-list" class=" mp-mdl-button mp-mdl-button--icon"><i
                                        class="material-icons">playlist_play</i></button>
                                <button id="mp-music-prev" class=" mp-mdl-button mp-mdl-button--icon"><i
                                        class="material-icons">skip_previous</i></button>
                                <button id="mp-music-play" class=" mp-mdl-button mp-mdl-button--icon"><i
                                        class="material-icons">play_circle_filled</i></button>
                                <button id="mp-music-next" class=" mp-mdl-button mp-mdl-button--icon"><i
                                        class="material-icons">skip_next</i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  -->
            <!--music over-->
              
            <#if settings.dark_enabled!false>
              <a class="mdui-btn mdui-btn-icon darkButton">
                <i class="mdui-icon material-icons">brightness_6</i>
              </a>   
            </#if>

            <#--  <img class="author mdui-img-circle mdui-btn-icon" src="/upload/2022/01/au-65a514587a4b42708c44865880348565.jpg" mdui-tooltip="{content: 'dnxrzl'}"/>  -->

        </div> 
    </div>
</header>
      
        
      
<aside class="mdui-drawer ${(settings.drawer_enabled!default) ? string('','mdui-drawer-close')}" id="left-drawer">
  <div class="headerLogo" style="background-image: url('${settings.drawimg!'${theme_base!}/source/images/indexBack.jpg'}')">
    <img class="mdui-img-circle mdui-shadow-2" src="${settings.avatarLogo!'${theme_base!}/source/images/avatar.png'}" alt="">
    <span class="drawTitle">${user.nickname!}</span>
  </div>
  <ul class="mdui-list" mdui-collapse="{accordion: true}">
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
      
</@menuTag>