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
                       class="form-control ${(amountError??)?string('is-invalid', '')}"
                       name="amount"
                       value="<#if excursion??><#if excursion.amount??>${excursion.amount}</#if></#if>"
                       placeholder="Maximum people amount" required>
                <#if amountError??>
                    <div class="invalid-feedback">
                        "Enter positive number"
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col">
                        <input type="text"
                               class="form-control ${(durationHoursError??)?string('is-invalid', '')}"
                               name="durationHours"
                               value="<#if excursion??><#if excursion.durationHours??>${excursion.durationHours}</#if></#if>"
                               placeholder="Duration hours"
                               required>
                        <#if durationHoursError??>
                            <div class="invalid-feedback">
                                "Enter positive number between 0 and 24"
                            </div>
                        </#if>
                    </div>
                    <div class="col">
                        <input type="text"
                               class="form-control ${(durationMinutesError??)?string('is-invalid', '')}"
                               name="durationMinutes"
                               value="<#if excursion??><#if excursion.durationMinutes??>${excursion.durationMinutes}</#if></#if>"
                               placeholder="Duration minutes"
                               required>
                        <#if durationMinutesError??>
                            <div class="invalid-feedback">
                                "Enter positive number between 0 and 60"
                            </div>
                        </#if>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <input type="text"
                       class="form-control ${(priceError??)?string('is-invalid', '')}"
                       name="price"
                       value="<#if excursion??><#if excursion.price??>${excursion.price}</#if></#if>"
                       placeholder="Price for one"
                       required>
                <#if priceError??>
                    <div class="invalid-feedback">
                        "Enter positive number"
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text"
                       class="form-control"
                       name="city"
                       value="<#if excursion??>${excursion.city}</#if>"
                       placeholder="City"
                       required>
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