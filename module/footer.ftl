<#macro footer>
<footer class="footer-container">
    <div class="innerfooter mdui-container">
        <div class="mdui-typo-title">${blog_title!}</div>
        <div class="">© <span id="timeyear"></span> ${user.nickname!} <a href="https://beian.miit.gov.cn/" target="_blank">${settings.record!}</a></div>
        <div class="">Powered by <a href="https://halo.run/" target="_blank">Halo</a>. Theme <a href="https://github.com/daifiyum/halo-MaterialYour" target="_blank">MaterialYour</a> by <a href="https://www.dnxrzl.com/" target="_blank">dnxrzl</a>.</div>
    </div>
    <div class="totop mdui-shadow-3 mdui-color-theme-100 mdui-text-color-theme">
        <i class="mdui-icon material-icons">expand_less</i>
    </div>
</footer>
</#macro>