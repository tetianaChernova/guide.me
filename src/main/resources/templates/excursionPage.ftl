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
                        <ul class="images">
                            <li class="big-img">

                                <img src="https://db82kmzzne7f2.cloudfront.net/ghost-blog/2015/08/AdobeStock_76271180.jpg"/>
                            </li>
                        </ul>
                    </div>
                    <div class="info">

                        <h1>${excursion.title}</h1>
                        <h2 class="avatar_title">Guide: ${guide.firstName} ${guide.lastName}</h2>
                        <#if guide??>
                            <#if guide.filename??>
                                <img src="/img/${guide.filename}" alt="Avatar" class="avatar rounded-circle">
                            <#else>
                                <img src="https://f0.pngfuel.com/png/980/886/male-portrait-avatar-png-clip-art.png"
                                     alt="Avatar" class="avatar rounded-circle">
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
                        <button data-toggle="modal" data-target="#myModalAdd">Book this excursion</button>

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
                        <input type="hidden" id="touristId" name="touristId" value="${tourist.touristId}"/>
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
    #img-wrap {
        /* width: 550px; */
        width: 75%;
        margin-left: -170px;
        margin-top: -40px;
        height: 100%;
        float: left;
        position: relative;
    }

    /*#img-wrap {*/
    /*    !* width: 550px; *!*/
    /*    width: 90%;*/
    /*    margin-left: -350px;*/
    /*    margin-top: -65px;*/
    /*    height: 100%;*/
    /*    float: left;*/
    /*    position: relative;*/
    /*}*/


    .modal-title {
        overflow: auto;
        white-space: nowrap;
        /*width: 400px;*/
        /*font-size: 150%;*/
        width: 600px;
        font-size: 130%;
    }

    #img-wrap .images {
        width: 60%;
        overflow: hidden;
        margin: 270px auto 0 auto;
    }

    #img-wrap .images li {
        list-style: none;
        width: 33.33%;
        float: left;
        padding: 10px;
        text-align: center;
        cursor: pointer;
        opacity: 0.7;
    }

    #img-wrap .images li img {
        width: 80%;
    }

    #img-wrap .images li:nth-child(4) {
        padding-top: 25px;
    }

    #img-wrap .images li:hover {
        opacity: 1;
    }

    #img-wrap .images .big-img {
        width: 100%;
        float: none;
        padding: 0;
        /*margin: 0 12.5%;*/
        text-align: center;
        opacity: 1;
        position: absolute;
        top: 100px;
        left: 0;
    }

    #img-wrap .images .big-img img {
        -webkit-filter: drop-shadow(0px 7px 3px #6C7A89);
        filter: drop-shadow(0px 7px 3px #6C7A89);
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
        /*color: #D64541;*/
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

    /*.form .color {*/
    /*    -webkit-appearance: none;*/
    /*    -moz-appearance: none;*/
    /*    appearance: none;*/
    /*    padding: 0 20px;*/
    /*    width: 100%;*/
    /*    height: 40px;*/
    /*    border: none;*/
    /*    background: #F0C2C2;*/
    /*    font-size: 0.9em;*/
    /*    letter-spacing: 1px;*/
    /*    -webkit-border-radius: 5px;*/
    /*    -moz-border-radius: 5px;*/
    /*    -ms-border-radius: 5px;*/
    /*    border-radius: 5px;*/
    /*    color: #444B54;*/
    /*    cursor: pointer;*/
    /*    font-weight: 400;*/
    /*}*/

    /*.form .color:hover {*/
    /*    background: #efb7b7;*/
    /*}*/

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
