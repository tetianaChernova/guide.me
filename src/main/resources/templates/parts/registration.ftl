<#setting locale="en_US">
<#macro registration isGuideRegistrationForm>
    <div class="signup-form">
        <#if isGuideRegistrationForm>
        <form action="/registration/guide" method="post" enctype="multipart/form-data" class="md-form">
            </#if>
            <#if !isGuideRegistrationForm>
            <form action="/registration/tourist" method="post" enctype="multipart/form-data" class="md-form">
                </#if>
                <h2>Register</h2>
                <p class="hint-text">Create your account. It's free and only takes few minutes.</p>
                <div class="form-group">
                    <div class="row">
                        <div class="col">
                            <input type="text"
                                   name="firstName"
                                   class="form-control"
                                   value="<#if user??>${user.firstName}</#if>"
                                   placeholder="First Name" required="required">
                        </div>
                        <div class="col">
                            <input type="text"
                                   name="lastName"
                                   class="form-control"
                                   value="<#if user??>${user.lastName}</#if>"
                                   placeholder="Last Name" required="required">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <input type="email"
                           name="email"
                           class="form-control ${(emailError??)?string('is-invalid', '')}"
                           value="<#if user??>${user.email}</#if>"
                           placeholder="Email" required="required">
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <input type="tel"
                           name="phone"
                           class="form-control"
                           value="<#if user??>${user.phone}</#if>"
                           pattern="^\+[1-9]{1}[0-9]{3,14}$"
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
                            <input type='text'
                                   name="birthDate"
                                   class="form-control"
                                   value="<#if user??>${user.birthDate?datetime?string('dd/MM/yyyy')}</#if>"
                                   required/>
                            <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                        </div>

                    </div>
                    <div class="form-group">
                        <input id="ex6"
                               type="range"
                               name="experience"
                               class="form-control"
                               value="<#if user??>${user.experience}</#if>"
                               onchange="updateTextInput(this.value);"
                               data-slider-step="1" min="0" max="40"
                               value="0"/>
                        <span>Experience year: <span id="rangeValueText"></span></span>
                    </div>
                </#if>
                <div class="form-group">
                    <input type="text"
                           name="city"
                           class="form-control"
                           value="<#if user??>${user.city}</#if>"
                           placeholder="City"
                           required="required">
                </div>
                <div class="form-group">
                    <input type="text"
                           name="nationality"
                           value="<#if user??>${user.nationality}</#if>"
                           class="form-control"
                           placeholder="Nationality"
                           required="required">
                </div>
                <div class="custom-file form-group">
                    <input type="file"
                            <#if user??><#if user.filename??>
                                class="custom-file-input is-invalid"
                            <#else>
                                class="custom-file-input"
                            </#if></#if>
                           id="customFileLang"
                           name="file">
                    <label class="custom-file-label form-control-lg d-inline-block"
                           for="customFileLang"
                           style="color: #969fa4;">Upload photo</label>
                    <#if user??><#if user.filename??>
                        <div class="invalid-feedback">
                            Please upload file again
                        </div>
                    </#if></#if>
                </div>
                <#if isGuideRegistrationForm>
                    <div class="form-group">
                        <textarea
                                name="description"
                                rows="3"
                                class="form-control rounded-0 ${(descriptionError??)?string('is-invalid', '')}"
                                placeholder="Description"
                                required="required"><#if user??>${user.description}</#if></textarea>
                        <#if descriptionError??>
                            <div class="invalid-feedback">
                                ${descriptionError}
                            </div>
                        </#if>
                    </div>
                </#if>

                <div class="form-group">
                    <input type="password"
                           name="password"
                           class="form-control ${(passwordError??)?string('is-invalid', '')}"
                           placeholder="Password"
                           required="required">
                    <#if passwordError??>
                        <div class="invalid-feedback">
                            ${passwordError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <input type="password"
                           name="password2"
                           class="form-control ${(password2Error??)?string('is-invalid', '')}"
                           placeholder="Confirm password"
                           required="required">
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <label class="checkbox-inline">
                        <input type="checkbox" required="required"> I accept the <a href="#">Terms
                            of Use</a> &amp; <a href="#">Privacy Policy</a>
                    </label>
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

<style>
    body {
        background-image: url('https://cdn.contexttravel.com/image/upload/c_fill,q_60,w_2600/v1549318570/production/city/hero_image_2_1549318566.jpg');
    }
</style>