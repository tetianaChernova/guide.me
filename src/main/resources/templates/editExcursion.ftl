<#setting number_format="0;;roundingMode=floor">
<#import "parts/common.ftl" as c>
<#import "parts/navigation.ftl" as navbar>
<@c.page "/static/guideprofile.css">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark main main-raised" style="margin: 0;">
        <@navbar.nav user></@navbar.nav>
    </nav>
    <div class="profile-page">
        <div class="page-header header-filter" data-parallax="true"
             style="margin: 0; background-color: white"></div>
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container" style="width: 1200px; height: 600px; margin: -250px auto;">
                    <#--                    <form method="post" action="/excursions/${excursion.excursionId}/edit"-->
                    <#--                          enctype="multipart/form-data">-->
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
<#--                    <div class="uploadPhoto">-->

<#--                    </div>-->
                    <form id="editForm" method="post" action="/excursions/${excursion.excursionId}/edit"
                          enctype="multipart/form-data">
                        <div class="info">
                            <input type='text'
                                   style="width: 100%; height: 8%; margin-bottom: 5px; font-size: 30px"
                                   name="title" value="${excursion.title}" placeholder="${excursion.title}">
                            <textarea
                                    name="description"
                                    type="text"
                                    rows="10"
                                    style="max-height: 150px; overflow: scroll; width: 100%; font-size: 16px;">${excursion.description}</textarea>
                            <div class="important1">
                                <p id="importantp">Price for one
                                </p>
                                <input type="text" id="price" name="price" value="${excursion.priceForOne}"
                                       placeholder="${excursion.priceForOne}">
                            </div>
                            <div class="important2">
                                <p id="importantp">People amount</p>
                                <input type="text" id="amount" name="amount" value="${excursion.amount}"
                                       placeholder="${excursion.amount}">
                            </div>
                            <div class="important3">
                                <p id="importantp">Duration Hours</p>
                                <input type="text" id="durationHours" name="durationHours"
                                       value="${excursion.duration/60}"
                                       placeholder="${excursion.duration/60}">
                            </div>
                            <div class="important4">
                                <p id="importantp">Duration Minutes</p>
                                <input type="text" id="durationMinutes" name="durationMinutes"
                                       value="${excursion.duration%60}"
                                       placeholder="${excursion.duration%60}">
                            </div>
                            <div class="important5">
                                <p id="importantp">City</p>
                                <input type="text" id="city" name="city" value="${excursion.city}"
                                       placeholder="${excursion.city}">
                            </div>
                            <div class="important6">
                                <p id="importantp">Meeting point</p>
                                <input type="text" id="meetingPoint" name="meetingPoint"
                                       value="${excursion.meetingPoint}"
                                       placeholder="${excursion.meetingPoint}">
                            </div>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit">Edit this excursion</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</@c.page>
<script>
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
<style>

    #img-wrap {
        width: 65%;
        height: 82%;
        float: left;
        overflow: auto;
        margin: 5% 0 0 -100px;
    }

    .excImg {
        max-width: 100%;
        max-height: 100%;
        margin-left: auto;
        margin-right: auto;
        display: block;
    }

    .info {
        width: 440px;
        height: 100%;
        float: right;
        padding: 50px 50px 50px 0;
        padding: 50px 0px 50px 0;
    }

    .info h1 {
        font-size: 1.5em;
        font-weight: 400;
        float: left;
        text-transform: uppercase;
        letter-spacing: 2px;
    }

    .info h2 {
        font-size: 1em;
        letter-spacing: 1.5px;
        text-transform: uppercase;
        padding: 5px 0 20px 0;
        float: left;
        color: #8199A3;
    }

    .info p textarea label {
        clear: both;
        margin-bottom: 7px;
        line-height: 1.5em;
        font-size: 1em;
        letter-spacing: 0.5px;
    }

    .info #importantp, .info {
        text-transform: uppercase;
        letter-spacing: 1px;
        font-size: 0.9em;
    }

    .info #price, #amount, #meetingPoint, #city, #durationHours, #durationMinutes {
        margin-top: 0;
        font-size: 16px;
        float: none;
    }

    .important1, .important3, .important5 {
        width: 50%;
        float: left;
        margin-top: 15px;
    }

    .important2, .important4, .important6 {
        width: 50%;
        float: right;
        margin-top: 15px;
    }

    button {
        width: 100%;
        margin-top: 30px;
        border: none;
        background: #1abc9c;
        padding: 20px 0;
        font-size: 1.1em;
        line-height: 1.1em;
        letter-spacing: 1px;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
        color: #F2F2F2;
        cursor: pointer;
    }
</style>
