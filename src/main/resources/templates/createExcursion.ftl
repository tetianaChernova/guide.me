<#import "parts/common.ftl" as c>
<@c.page "/static/forms.css">
<form action="/excursions" method="post" enctype="multipart/form-data">
    <div class="form-group row">
        <label for="title" class="col-sm-2 col-form-label">Title</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="title" name="title">
        </div>
    </div>
    <div class="form-group row">
        <label for="description" class="col-sm-2 col-form-label">Description</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="description" name="description">
        </div>
    </div>
    <div class="form-group row">
        <label for="amount" class="col-sm-2 col-form-label">Max people amount</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="amount" name="amount">
        </div>
    </div>
    <div class="form-group row">
        <label for="duration" class="col-sm-2 col-form-label">Duration</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="duration" name="duration">
        </div>
    </div>
    <div class="form-group row">
        <label for="price" class="col-sm-2 col-form-label">Price</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="price" name="price">
        </div>
    </div>
    <div class="form-group row">
        <label for="city" class="col-sm-2 col-form-label">City</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="city" name="city">
        </div>
    </div>
    <div class="form-group row">
        <label for="file" class="col-sm-2 col-form-label">Upload photo</label>
        <div class="col-sm-10">
            <input type="file" class="form-control" id="file" name="file">
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div class="form-group row">
        <button type="submit" class="btn btn-success btn-lg btn-block">Create</button>
    </div>
</form>
</@c.page>