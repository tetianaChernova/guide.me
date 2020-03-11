<#import "parts/common.ftl" as c>

<@c.page>
<div class="signup-form">
    <form action="/registration/guide" method="post">
        <h2>Register</h2>
        <p class="hint-text">Create your account. It's free and only takes a minute.</p>
        <div class="form-group">
            <div class="row">
                <div class="col-xs-6"><input type="text" class="form-control" name="firstName" placeholder="First Name" required="required"></div>
                <div class="col-xs-6"><input type="text" class="form-control" name="lastName" placeholder="Last Name" required="required"></div>
            </div>
        </div>
        <div class="form-group">
            <input type="email" class="form-control" name="email" placeholder="Email" required="required">
        </div>
        <div class="form-group">
            <select type="gender" placeholder="Gender" name="gender" class="form-control">
                <option value="female">Female</option>
                <option value="male">Male</option>
            </select>
        </div>
        <div class="form-group">
            <input type="date"  id="inputField" class="form-control" name="birthDate" placeholder="Birth date" required="required">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="experience" placeholder="Experience">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="city" placeholder="City" required="required">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="nationality" placeholder="Nationality" required="required">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Password" required="required">
        </div>
<#--        <div class="form-group">-->
<#--            <input type="password" class="form-control" name="confirm_password" placeholder="Confirm Password" required="required">-->
<#--        </div>-->
        <div class="form-group">
            <label class="checkbox-inline"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="form-group">
            <button type="submit" class="btn btn-success btn-lg btn-block">Register Now</button>
        </div>
    <div class="text-center">Already have an account? <a href="/login">Sign in</a></div>
    </form>
</div>

</@c.page>
<script>
    $(document).ready(function(){

        $("#inputField").datepicker();
    })
</script>