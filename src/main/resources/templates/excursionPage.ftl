<#setting number_format="0;;roundingMode=floor">
<#import "parts/common.ftl" as c>
<#import "parts/excards.ftl" as excards>
<#import "parts/navigation.ftl" as navbar>
<@c.page "/static/excursionpage.css">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark main main-raised" style="margin: 0;">
        <@navbar.nav user></@navbar.nav>
    </nav>
    <div class="profile-page">
        <div class="page-header header-filter" data-parallax="true"
             style="background-image:url('https://media.timeout.com/images/105189172/image.jpg'); margin: 0"></div>
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container" style="width: 1200px; height: 600px; margin: -250px auto;">
                    <div id="img-wrap">
                        <#if excursion??>
                            <#if excursion.filename??>
                                <img class="excImg" src="/img/${excursion.filename}"/>
                            <#else>
                                <img class="excImg"
                                     src="https://steemitimages.com/p/32FTXiZsHoAW6noHJDhrg3W8ZKHVFSsLYM859aTDCF8iErWLTod5pCiMV5bGfYDUfQ6W8cM5zcDSRt2Bfrc7VwhBaykTtn3QfRYLLJPu9bEiqLo882UTBrvVQxPoaQv8iHpiQGze98tp2rpe?format=match&mode=fit&width=1280"/>
                            </#if>
                        </#if>
                    </div>
                    <div class="info">
                        <h1>${excursion.title}</h1>
                        <h2 class="avatar_title">Guide: ${guide.firstName} ${guide.lastName}</h2>
                        <#if guide??>
                            <#if guide.filename??>
                                <a href="/guide/${guide.guideId}">
                                    <img src="/img/${guide.filename}" alt="Avatar" class="avatar rounded-circle">
                                </a>
                            <#elseif guide.gender = "male">
                                <a href="/guide/${guide.guideId}">
                                    <img src="https://f0.pngfuel.com/png/980/886/male-portrait-avatar-png-clip-art.png"
                                         alt="Avatar" class="avatar rounded-circle"></a>
                            <#else>
                                <a href="/guide/${guide.guideId}">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWKbLa_dJgtKiBItyiLId0m6ZKSbRwtCKCgf9dsgGED2uRcZXJ&usqp=CAU"
                                         alt="Avatar" class="avatar rounded-circle"></a>
                            </#if>
                        </#if>
                        <p style="max-height: 150px; overflow: scroll">${excursion.description}</p>

                        <div class="important1">
                            <p id="importantp">Price for one
                            <p>
                            <h1 id="price">$ ${excursion.priceForOne}</h1>
                        </div>
                        <div class="important2">
                            <p id="importantp">People amount
                            <p>
                            <h1 id="amount">${excursion.amount}</h1>
                        </div>
                        <div class="important3">
                            <p id="importantp">Duration
                            <p>
                            <h1 id="duration">${excursion.duration/60}h ${excursion.duration%60}m</h1>
                        </div>
                        <div class="important4">
                            <p id="importantp">Meeting point
                            <p>
                            <h1 id="meeting_point">${excursion.city}, ${excursion.meetingPoint}</h1>
                        </div>
                        <#if tourist??>
                            <button data-toggle="modal" data-target="#myModalAdd">Book this excursion</button>
                        </#if>
                        <#if currentGuide??>
                            <#if currentGuide.getGuideId()==excursion.getGuide().getGuideId()>
                                <form action="/excursions/${excursion.excursionId}/edit">
                                    <button type="submit">Edit this excursion</button>
                                </form>
                            </#if>
                        </#if>

                    </div>
                </div>
            </div>
        </div>
        <footer class="footer text-center ">
            <p>Made with <a href="https://demos.creative-tim.com/material-kit/index.html" target="_blank">Material
                    Kit</a>
                by Creative Tim</p>
        </footer>
    </div>
    <#if tourist??>
        <form action="/booking" method="post" role="form" id="formfield" enctype="multipart/form-data">
            <div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Book the excursion</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span style="float: right; margin-right: 1%;" aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input type="text" id="amountInput" name="peopleAmount" class="form-control"
                                       placeholder="People amount"
                                       required>
                            </div>
                            <div class="form-group">
                                <div class='input-group date' id='datetimepicker1'>
                                    <input type='text'
                                           name="bookingDate"
                                           class="form-control"
                                           id="datePickerInput"
                                           value="<#if booking??>${booking.bookingDate?datetime?string('dd/MM/yyyy')}</#if>"
                                           required/>
                                    <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" id="excursionId" name="excursionId" value="${excursion.excursionId}"/>
                        <input type="hidden" id="touristId" name="touristId"
                               value="<#if tourist??>${tourist.touristId}</#if>"/>
                        <input type="hidden" id="totalPrice" name="totalPrice" value=""/>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input style="margin-top: 28px" class="btn btn-primary" type="submit" id="submit_button"
                                   value="Confirm">
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <div class="alert alert-success collapse" role="alert" id="successAlert">
  <span>
  <p>Thank`s for book this excursion!</p>
  </span>
        </div>
    </#if>
</@c.page>

<script>

    jQuery.validator.addMethod("checkAmountForPositive", function (value, element) {
        return this.optional(element) || (parseFloat(value) > 0);
    });

    jQuery.validator.addMethod("checkAmountForLessThanAvailable", function (value, element) {
        let availablePeopleAmount = ${excursion.amount};
        return this.optional(element) || (parseFloat(value) <= availablePeopleAmount);
    });

    $("#formfield").validate({
        rules: {
            peopleAmount: {
                required: true,
                checkAmountForLessThanAvailable: true,
                checkAmountForPositive: true
            },
            bookingDate: {
                required: true
            },
        },
        messages: {
            peopleAmount: {
                required: "Please enter people amount",
                checkAmountForPositive: "People amount cannot be less than 1",
                checkAmountForLessThanAvailable: "People amount cannot be greater than available"
            },
            bookingDate: {
                required: "Please enter booking date"
            }
        },
        submitHandler: function (form) {
            let peoplAmount = $('#amountInput').val();
            let totalPrice = peoplAmount * ${excursion.priceForOne};
            $('#totalPrice').val(totalPrice);
            alert("Thank's for book this excursion! You will receive further information via email!")
            form.submit();
        }

    });

    $('#myModal').on('shown.bs.modal', function (e) {
        // do something...
        setTimeout(function () {
                $('#myModal').modal('hide');
            },
            5000);
    });

    $(function () {
        $('#datetimepicker1').datetimepicker({
            format: 'L',
            minDate: new Date()
        });
    });

    $('#myModalAdd').on('hidden.bs.modal', function (e) {
        $('#datePickerInput').val('');
        $('#amountInput').val('');
    });
</script>


<style>
    button {
        margin-top: 30px;
        font-size: 1.1em;
        line-height: 1.1em;
        border-radius: 5px;
        color: #F2F2F2;
        cursor: pointer;
    }
</style>
