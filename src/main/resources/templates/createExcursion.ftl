<#import "parts/common.ftl" as c>
<@c.page "/static/forms.css">
    <div class="signup-form">
        <form action="/excursions" method="post" enctype="multipart/form-data" class="md-form">
            <h1 style="color: #464646" class="d-flex justify-content-center">
                Create Excursion</h1>
            <div class="form-group">
                <input type="text"
                       class="form-control"
                       name="title"
                       value="<#if excursion??>${excursion.title}</#if>"
                       placeholder="Title" required>
            </div>
            <div class="form-group">
                    <textarea
                            type="text"
                            class="form-control rounded-0 ${(descriptionError??)?string('is-invalid', '')}"
                            name="description"
                            placeholder="Description"
                            rows="3" required><#if excursion??>${excursion.description}</#if></textarea>
                <#if descriptionError??>
                    <div class="invalid-feedback">
                        ${descriptionError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text"
                       class="form-control"
                       name="amount"
                       value="<#if excursion??>${excursion.amount}</#if>"
                       placeholder="Maximum people amount" required>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col">
                        <input type="text"
                               class="form-control"
                               name="durationHours"
                               placeholder="Duration hours"
                        value="<#if excursion??>${excursion.durationHours}</#if>" required>
                    </div>
                    <div class="col">
                        <input type="text"
                               class="form-control"
                               name="durationMinutes"
                               placeholder="Duration minutes"
                        value="<#if excursion??>${excursion.durationMinutes}</#if>" required>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <input type="text"
                       class="form-control"
                       name="price"
                       placeholder="Price for one"
                value="<#if excursion??>${excursion.price}</#if>" required>
            </div>
            <div class="form-group">
                <input type="text"
                       class="form-control"
                       name="city"
                       placeholder="City"
                value="<#if excursion??>${excursion.city}</#if>" required>
            </div>
            <div class="form-group">
                <input type="text"
                       class="form-control"
                       name="meetingPoint"
                       value="<#if excursion??>${excursion.meetingPoint}</#if>"
                       placeholder="Meeting point" required>
            </div>
            <div class="custom-file form-group">
                <input type="file"
                        <#if excursion??><#if excursion.filename??>${excursion.filename}
                       class="custom-file-input is-invalid"
                            <#else>
                                class="custom-file-input"
                        </#if></#if>
                       id="customFileLang"
                       name="file">
                <label class="custom-file-label form-control-lg d-inline-block" for="customFileLang"
                       style="color: #969fa4;">Upload photo</label>
                <#if excursion??><#if excursion.filename??>
                    <div class="invalid-feedback">
                        Please upload file again
                    </div>
                </#if></#if>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group row">
                <button type="submit" class="btn btn-success btn-lg btn-block">Create</button>
            </div>
        </form>
    </div>
</@c.page>

<style>
    body {
        background-image: url('https://cdn.contexttravel.com/image/upload/c_fill,q_60,w_2600/v1549318570/production/city/hero_image_2_1549318566.jpg');
    }
</style>