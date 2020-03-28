<#setting number_format="0;;roundingMode=floor">
<#import "parts/common.ftl" as c>
<#import "parts/excards.ftl" as excards>
<#import "parts/navigation.ftl" as navbar>
<@c.page "/static/guideprofile.css">
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
                                        <img class="excImg" src="https://steemitimages.com/p/32FTXiZsHoAW6noHJDhrg3W8ZKHVFSsLYM859aTDCF8iErWLTod5pCiMV5bGfYDUfQ6W8cM5zcDSRt2Bfrc7VwhBaykTtn3QfRYLLJPu9bEiqLo882UTBrvVQxPoaQv8iHpiQGze98tp2rpe?format=match&mode=fit&width=1280"/>
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
                            <#else>
                                <a href="/guide/${guide.guideId}">
                                    <img src="https://f0.pngfuel.com/png/980/886/male-portrait-avatar-png-clip-art.png"
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
                        <#else>
                            <button data-toggle="modal" data-target="#myModalEdit">Edit this excursion</button>
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
        <form action="/save" method="post" role="form" id="formfield" enctype="multipart/form-data">
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
                                <input type="text" id="amountInput" name="name" class="form-control"
                                       placeholder="People amount"
                                       required>
                            </div>
                            <div class="form-group">
                                <div class='input-group date' id='datetimepicker1'>
                                    <input type='text'
                                           name="birthDate"
                                           class="form-control"
                                           id="datePickerInput"
                                           value="<#if booking??>${booking.bookingDate?datetime?string('dd/MM/yyyy')}</#if>"
                                           required/>
                                    <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input type="button" name="btn" value="Confirm" id="submitBtn"
                                   data-dismiss="modal" data-toggle="modal"
                                   data-target="#confirm-submit" class="btn btn-primary"/>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <div class="modal fade" id="confirm-submit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Are you sure you want to submit the following details?</h5>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <tr>
                                <th>People amount</th>
                                <td id="mamount"></td>
                            </tr>
                            <tr>
                                <th>Date of excursion</th>
                                <td id="mdate"></td>
                            </tr>
                            <tr>
                                <th>Total price</th>
                                <td id="mprice"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <form action="/booking" method="post">
                            <input type="hidden" id="excursionId" name="excursionId" value="${excursion.excursionId}"/>
                            <input type="hidden" id="touristId" name="touristId"
                                   value="<#if tourist??>${tourist.touristId}</#if>"/>
                            <input type="hidden" id="peopleAmount" name="peopleAmount" value=""/>
                            <input type="hidden" id="bookingDate" name="bookingDate" value=""/>
                            <input type="hidden" id="totalPrice" name="totalPrice" value=""/>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-primary">Confirm</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </#if>
</@c.page>

<script>
    $(function () {
        $('#datetimepicker1').datetimepicker({
            format: 'L'
        });
    });

    $('#submitBtn').click(function () {
        let peoplAmount = $('#amountInput').val();
        let excursionDate = $('#datePickerInput').val();
        let totalPrice = peoplAmount * ${excursion.priceForOne};
        $('#mamount').text(peoplAmount);
        $('#mdate').text(excursionDate);
        $('#mprice').text(totalPrice);
        $('#peopleAmount').val(peoplAmount);
        $('#bookingDate').val(excursionDate);
        $('#totalPrice').val(totalPrice);

    });

    $('#submit').click(function () {
        alert('submitting');
        $('#formfield').submit();
    });

</script>


<style>

    #img-wrap{
        width: 65%;
        height: 82%;
        float: left;
        overflow: auto;
        margin: 6% 0 0 -100px;
    }

    .excImg{
        max-width: 100%;
        max-height: 100%;
        margin-left: auto;
        margin-right: auto;
        display: block;
    }

    .modal-title {
        overflow: auto;
        white-space: nowrap;
        width: 600px;
        font-size: 130%;
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

    .info p {
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

    .info #price, #amount, #meeting_point, #duration {
        margin-top: 15px;
        float: none;
    }

    .important1, .important3 {
        width: 50%;
        float: left;
        margin-top: 15px;
    }

    .important2, .important4 {
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
        -ms-border-radius: 5px;
        border-radius: 5px;
        color: #F2F2F2;
        cursor: pointer;
    }

    .avatar {
        vertical-align: middle;
        width: 100px;
        height: 100px;
        border-radius: 50%;
        margin-top: -50px;
        float: right;
    }

    .avatar_title {
        float: left;
        clear: left;
        display: inline;
    }
</style>
