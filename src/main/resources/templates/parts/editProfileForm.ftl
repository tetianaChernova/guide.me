<#setting locale="en_US">
<#macro editprofile usr isGuideEditprofile>
    <div class="container">
        <h1>Edit Profile</h1>
        <hr>
        <div class="row">
            <!-- left column -->
            <div class="col-md-3">
                <div class="text-center">
                    <#if usr.filename??>
                        <img src="/img/${usr.filename}"
                             id="imgSrc"
                             alt="Circle Image"
                             class="img-raised rounded-circle img-fluid"
                             style="width: 125px;height: 125px;">
                    <#else>
                        <img src="https://f0.pngfuel.com/png/980/886/male-portrait-avatar-png-clip-art.png"
                             alt="Circle Image"
                             id="imgSrcNoPhoto"
                             class="img-raised rounded-circle img-fluid"
                             style="width: 125px;height: 125px;">
                    </#if>
                    <h6>Upload a different photo...</h6>
                    <input id="imgInput"
                           type="file"
                           name="file"
                            <#--                           value="${usr.filename}"-->
                           form="editForm"
                           class="form-control">
                </div>
            </div>

            <div class="col-md-9 personal-info">
                <div class="alert alert-info alert-dismissable">
                    <a class="panel-close close" data-dismiss="alert">×</a>
                    <i class="fa fa-coffee"></i>
                    Change your profile information
                </div>
                <h3>Personal info</h3>
                <#if isGuideEditprofile>
                <form action="/guide/profile/edit" method="post" id="editForm" enctype="multipart/form-data"
                      class="form-horizontal">
                    <#else>
                    <form action="/tourist/profile/edit" method="post" id="editForm" enctype="multipart/form-data"
                          class="form-horizontal">
                        </#if>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">First name:</label>
                            <div class="col-lg-8">
                                <input class="form-control"
                                       name="firstName"
                                       type="text"
                                       value="<#if usr??>${usr.firstName}</#if>" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Last name:</label>
                            <div class="col-lg-8">
                                <input class="form-control"
                                       name="lastName"
                                       type="text"
                                       value="<#if usr??>${usr.lastName}</#if>" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Phone:</label>
                            <div class="col-lg-8">
                                <input class="form-control"
                                       name="phone"
                                       type="tel"
                                       pattern="^\+[1-9]{1}[0-9]{3,14}$"
                                       value="<#if usr??>${usr.phone}</#if>" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">City:</label>
                            <div class="col-lg-8">
                                <input class="form-control"
                                       name="city"
                                       type="text"
                                       value="<#if usr??>${usr.city}</#if>" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Nationality:</label>
                            <div class="col-lg-8">
                                <input class="form-control"
                                       type="text"
                                       name="nationality"
                                       value="<#if usr??>${usr.nationality}</#if>" required>
                            </div>
                        </div>
                        <#if isGuideEditprofile>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Experience:</label>
                                <div class="col-lg-8">
                                    <input id="ex6"
                                           type="range"
                                           name="experience"
                                           class="form-control"
                                           value="<#if usr??>${usr.experience}</#if>"
                                           placeholder="<#if usr??>${usr.experience}</#if>"
                                           onchange="updateTextInput(this.value);"
                                           data-slider-step="1" min="0" max="40"/>
                                    <span>Experience year: <span
                                                id="rangeValueText"><#if usr??>${usr.experience}</#if></span></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Description:</label>
                                <div class="col-md-8">
                            <textarea
                                    name="description"
                                    rows="3"
                                    class="form-control rounded-0 ${(descriptionError??)?string('is-invalid', '')}"
                                    placeholder="Description"
                                    required="required"><#if userDto??>${userDto.description}<#else><#if usr??>${usr.description}</#if></#if></textarea>
                                    <#if descriptionError??>
                                        <div class="invalid-feedback">
                                            ${descriptionError}
                                        </div>
                                    </#if>
                                </div>
                            </div>
                        </#if>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <div class="form-group">
                            <label class="col-md-3 control-label"></label>
                            <div class="col-md-8">
                                <input type="submit" class="btn btn-primary" value="Save Changes"></input>
                                <span></span>
                                <#--                            <input type="reset" class="btn btn-default" value="Cancel">-->
                                <form action="/guide/profile">
                                    <input type="submit" class="btn btn-default" value="Cancel">

                                    <#--                                <input type="submit" value="Go to Google"/>-->
                                </form>
                            </div>
                        </div>
                    </form>
                </form>
            </div>
        </div>
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
            <#--$("#imgInput").val(${usr.filename});-->

            <#--$(".selectDiv").val("${usr.gender}").change();-->
            <#--$(`.selectDiv option[value=${usr.gender}]`).attr('selected','selected');-->
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                let reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgSrc').attr('src', e.target.result);
                    $('#imgSrcNoPhoto').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]); // convert to base64 string
            }
        }

        $("#imgInput").change(function () {
            readURL(this);
        });

    </script>
</#macro>