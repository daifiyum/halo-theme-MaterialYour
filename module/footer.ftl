<#macro footer>
<footer class="footer-container">
    <div class="innerfooter mdui-container">
        <div class="mdui-typo-title">${blog_title!}</div>
        <div class="">© <span id="timeyear"></span> ${user.nickname!} 
            <a href="https://beian.miit.gov.cn/" target="_blank">${settings.record!}</a>
         </div>
		<#if settings.record2??>
			<div class="record2">
			    <a id="record" href="" target="_blank">
			        <img src="${settings.record2img!'${theme_base!}/source/images/record2.png'}"/>
			        <p>${settings.record2!}</p>
			    </a>
                <script>
					let record2 = "${settings.record2!}"
					let record2_num = +(record2.replace(/[^0-9]/ig,""));
					let url = "http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=" + record2_num
					$("#record").attr("href", url)
				</script>
			</div>
		</#if>
        <div class="">Powered by <a href="https://halo.run/" target="_blank">Halo</a>. Theme <a href="https://github.com/daifiyum/halo-MaterialYour" target="_blank">MaterialYour</a> by <a href="https://www.dnxrzl.com/" target="_blank">dnxrzl</a>.</div>
		<div class=""><@global.footer /></div>
    </div>
    <div class="totop mdui-shadow-3 mdui-color-theme-100 mdui-text-color-theme">
        <i class="mdui-icon material-icons">expand_less</i>
    </div>
	
</footer>
</#macro>