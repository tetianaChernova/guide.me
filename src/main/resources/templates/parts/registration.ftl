<#macro registration isGuideRegistrationForm>
    <div class="signup-form">
        <#if isGuideRegistrationForm>
        <form action="/registration/guide" method="post">
            </#if>
            <#if !isGuideRegistrationForm>
            <form action="/registration/tourist" method="post">
                </#if>
                <h2>Register</h2>
                <p class="hint-text">Create your account. It's free and only takes a minute.</p>
                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-6"><input type="text" class="form-control" name="firstName"
                                                     placeholder="First Name" required="required"></div>
                        <div class="col-xs-6"><input type="text" class="form-control" name="lastName"
                                                     placeholder="Last Name" required="required"></div>
                    </div>
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" name="email" placeholder="Email" required="required">
                </div>
                <div class="form-group">
                    <input type="tel" class="form-control" name="phone" pattern="^\+[1-9]{1}[0-9]{3,14}$"
                           placeholder="Phone" required="required">
                </div>
                <#if isGuideRegistrationForm>
                    <div class="form-group">
                        <select type="gender" name="gender" class="form-control">
                            <option value="female">Female</option>
                            <option value="male">Male</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker1'>
                            <input type='text' class="form-control" name="birthDate" required/>
                            <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                        </div>

                    </div>
                    <div class="form-group">
                        <input id="ex6" type="range" onchange="updateTextInput(this.value);" name="experience"
                               data-slider-step="1" min="0" max="40"
                               value="0"/>
                        <span>Experience year: <span id="rangeValueText"></span></span>
                    </div>
                </#if>
                <div class="form-group">
                    <input type="text" class="form-control" name="city" placeholder="City" required="required">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="nationality" placeholder="Nationality"
                           required="required">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Password"
                           required="required">
                </div>
                <div class="form-group">
                    <label class="checkbox-inline"><input type="checkbox" required="required"> I accept the <a href="#">Terms
                            of Use</a> &amp; <a href="#">Privacy Policy</a></label>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-lg btn-block">Register Now</button>
                </div>
                <div class="text-center">Already have an account? <a href="/login">Sign in</a></div>
            </form>
        </form>
    </div>
    <script>
        function updateTextInput(value) {
            console.log("value is: ", value);
            document.getElementById('rangeValueText').innerHTML = value;
        }

        $(function () {
            $('#datetimepicker1').datetimepicker({
                format: 'L'
            });
        });
    </script>
</#macro>