<#include "module/macro.ftl">
<@layout title="说说 - ${blog_title!}">
    <h1>说说</h1>
    <ul>
  <#list journals.content as journal>
    <li>
        ${journal.createTime?string('yyyy年MM月dd日')}：${journal.content!}
    </li>
  </#list>
</ul>
    
</@layout>
