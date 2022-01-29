<#include "module/macro.ftl">
<@layout title="图库 - ${blog_title!}">
<#--  偷懒，水个图库页  -->
<main class="self-container mdui-container">
  <div class="containerLeft">
    <article class="post">
      <div class="mdui-card">
      <div class="photos">
        <h3 class="pagetitle">图库</h3>
            <div id="images" class="fj-gallery">
                <@photoTag method="list">
                    <#list photos as photo>
                    <div class="fj-gallery-item">
                        
                        <img alt="${photo.name}" src="${photo.url}"/>
                        <p>${photo.name}</p>
                    </div>
                    </#list>
                </@photoTag>
            </div>
      </div>
      </div>
    </article>       
  </div>  
</main>

<script>
    fjGallery(document.querySelectorAll('.fj-gallery'), {
        itemSelector: '.fj-gallery-item'
    });
    $(document).ready(function () {
        photoalt();
    });
</script>    
</@layout>
