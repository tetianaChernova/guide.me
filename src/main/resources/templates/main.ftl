<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<div>
    <@l.logout></@l.logout>
</div>
    <div>List of guides</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter}">
        <button type="submit">Search</button>
    </form>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1> Guides </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <table class="table">
                <thead>
                <tr>
                    <th> Email </th>
                    <th> Name </th>
                </tr>
                </thead>
                <tbody>
                <#list guides as guide>
                <tr>
                    <td><span text="${guide.email}"> ${guide.email}</span></td>
                    <td><span text="${guide.firstName}"> ${guide.firstName}</span></td>
                    <td><span text="${guide.lastName}"> ${guide.lastName}</span></td>
                </tr>
                    <#else>
                    No guides are available
                </#list>
                </tbody>
            </table>
        </div>
    </div>
</div>

</@c.page>