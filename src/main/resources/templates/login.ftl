<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page "/static/forms.css">
    <#if message??>${message}</#if>
    <@l.login "/login" />
</@c.page>