<#setting number_format="0;;roundingMode=floor">
<#import "parts/common.ftl" as c>
<#import "parts/navigation.ftl" as navbar>
<@c.page "/static/editexcursion.css">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark main main-raised" style="margin: 0;">
        <@navbar.nav user></@navbar.nav>
    </nav>
    <div class="profile-page">
        <div class="page-header header-filter" data-parallax="true"
             style="margin: 0; background-color: white"></div>
        <div class="main main-raised">
            <div class="profile-content" style="margin-top: -20%;">
                <div class="container" style="width: 1200px; height: 660px; margin: -250px auto;">
                    <div id="img-wrap">
                        <#if excursion??>
                            <#if excursion.filename??>
                                <img id="imgSrc" class="excImg" src="/img/${excursion.filename}"/>
                            <#else>
                                <img class="excImg" id="imgSrcNoPhoto"
                                     src="https://steemitimages.com/p/32FTXiZsHoAW6noHJDhrg3W8ZKHVFSsLYM859aTDCF8iErWLTod5pCiMV5bGfYDUfQ6W8cM5zcDSRt2Bfrc7VwhBaykTtn3QfRYLLJPu9bEiqLo882UTBrvVQxPoaQv8iHpiQGze98tp2rpe?format=match&mode=fit&width=1280"/>
                            </#if>
                        </#if>
                        <h6>Upload a different photo...</h6>
                        <input id="imgInput"
                               type="file"
                               name="file"
                               class="form-control"
                               form="editForm">
                    </div>
                    <form id="editForm" method="post" action="/excursions/${excursion.excursionId}/edit"
                          enctype="multipart/form-data">
                        <div class="info">
                            <#if errorMessage??>
                                <p style="color: red">Couldn't edit this excursion because of errors</p>
                            </#if>
                            <input type='text'
                                   style="width: 100%; height: 8%; margin-bottom: 5px; font-size: 30px"
                                   name="title" value="${excursion.title}" placeholder="${excursion.title}" required>
                            <textarea
                                    name="description"
                                    type="text"
                                    rows="10"
                                    style="max-height: 150px; overflow: scroll; width: 100%; font-size: 16px;"
                                    required>${excursion.description}</textarea>
                            <div class="important1">
                                <p id="importantp">Price for one
                                </p>
                                <input type="text" id="price" name="price" value="${excursion.priceForOne}"
                                       placeholder="${excursion.priceForOne}" required>
                            </div>
                            <div class="important2">
                                <p id="importantp">People amount</p>
                                <input type="text" id="amount" name="amount" value="${excursion.amount}"
                                       placeholder="${excursion.amount}" required>
                            </div>
                            <div class="important3">
                                <p id="importantp">Duration Hours</p>
                                <input type="text" id="durationHours" name="durationHours"
                                       value="${excursion.duration/60}"
                                       placeholder="${excursion.duration/60}" required>
                            </div>
                            <div class="important4">
                                <p id="importantp">Duration Minutes</p>
                                <input type="text" id="durationMinutes" name="durationMinutes"
                                       value="${excursion.duration%60}"
                                       placeholder="${excursion.duration%60}" required>
                            </div>
                            <div class="important5">
                                <p id="importantp">City</p>
                                <input type="text" id="city" name="city" value="${excursion.city}"
                                       placeholder="${excursion.city}" required>
                            </div>
                            <div class="important6">
                                <p id="importantp">Meeting point</p>
                                <input type="text" id="meetingPoint" name="meetingPoint"
                                       value="${excursion.meetingPoint}"
                                       placeholder="${excursion.meetingPoint}" required>
                            </div>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button class="inline" type="submit">Edit this excursion</button>
                        </div>
                    </form>
                    <button class="btn-danger" data-toggle="modal" data-target="#myModalDelete"
                            style="width: 440px; float: right; margin-left: 60%; margin-top: -3%;">Delete
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Delete Excursion-->
    <form id="add-row-form" action="/excursions/${excursion.excursionId}/delete" method="post">
        <div class="modal fade" id="myModalDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <strong>Are you sure to delete this excursion?</strong>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</@c.page>
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            let reader = new FileReader();

            reader.onload = function (e) {
                $('#imgSrc').attr('src', e.target.result);
                $('#imgSrcNoPhoto').attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#imgInput").change(function () {
        readURL(this);
    });
</script>

<style>
    button {
        margin-top: 30px;
        line-height: 1.1em;
        border-radius: 5px;
        color: #F2F2F2;
        cursor: pointer;
    }
</style>