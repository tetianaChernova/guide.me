<#import "parts/common.ftl" as c>
<#import "parts/navigation.ftl" as navbar>
<#import "parts/editProfileForm.ftl" as editprofile>
<@c.page "/static/main.css">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark main main-raised" style="margin: 0;">
        <@navbar.nav user></@navbar.nav>
    </nav>
    <@editprofile.editprofile usr></@editprofile.editprofile>
</@c.page>
