<#macro login path>
    <div class="signup-form">
        <form action="${path}" method="post">
            <h2>Login</h2>
            <div class="form-group">
                <input type="email" class="form-control" name="email" placeholder="Email" required="required">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="password" placeholder="Password" required="required">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-success btn-lg btn-block">Login</button>
            </div>
            <div class="text-center">Don`t have an account? <a href="/registration/guide">Create account</a></div>
        </form>
    </div>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button class="btn btn-primary" type="submit">Sign out</button>
    </form>
</#macro>