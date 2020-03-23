<#macro nav user>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="navbar-brand" href="/main">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <#if user.role="GUIDE">
                    <a class="navbar-brand" href="/guide/profile">Guide Profile</a>
                <#else>
                    <a class="navbar-brand" href="/tourist/profile">Tourist Profile</a>
                </#if>
            </li>
            <li class="nav-item dropdown">
                <a class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Actions
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Change profile</a>
                    <#if user.role="GUIDE">
                        <a class="dropdown-item" href="/excursions">Create excursions</a>
                    </#if>
                </div>
            </li>
             <#if user.role="GUIDE">
            <li class="nav-item">
                <a class="navbar-brand disabled" href="/booking">Bookings</a>
            </li>
            </#if>
        </ul>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <a class="navbar-brand pull-right" style="color: white;"
               onclick="$(this).closest('form').submit()">Logout</a>
        </form>

    </div>
</#macro>