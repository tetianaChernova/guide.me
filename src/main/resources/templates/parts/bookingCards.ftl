<#macro booking bookings hasExpired>
    <div class="card-deck" style="margin-top: 30px;" id="cardDeck">
        <#list bookings as book>
            <div class="col-sm-4 mb-5">
                <div class="card js-card h-100">
                    <div class="card-body" id="myCard">
                        <h4 class="card-title">
                            <a href="/excursions/${book.excursion.excursionId}">${book.excursion.title}</a>
                        </h4>
                        <#if book.tourist.filename??>
                            <a href="/tourist/${book.tourist.touristId}">
                                <img id="fixedAvatar" src="/img/${book.tourist.filename}"
                                     height="60" width="60"
                                     class="avatar rounded-circle">
                            </a>
                        <#else>
                            <a href="/tourist/${book.tourist.touristId}">
                                <img id="fixedAvatar"
                                     src="https://f0.pngfuel.com/png/980/886/male-portrait-avatar-png-clip-art.png"
                                     height="60" width="60"
                                     class="avatar rounded-circle">
                            </a>
                        </#if>
                        <div class="pull-right" style="font-size: 110%">
                            <div>
                                <span style="margin-left: 50%"> ${book.touristAmount}</span>
                                <span class="glyphicon glyphicon-user" style="float:right; font-size: 130%;"></span>
                            </div>
                            <div>
                                <span style="margin-left: 30%"> ${book.totalPrice}</span>
                                <span class="glyphicon glyphicon-usd" style="float:right; font-size: 130%;"></span>
                            </div>
                            <div>
                                <span> ${book.bookingDate?datetime?string('dd/MM/yyyy')}</span>
                                <span class="glyphicon glyphicon-calendar" style="font-size: 130%;"></span>
                            </div>
                        </div>
                    </div>
                    <#if !book.isConfirmed && !hasExpired>
                        <div class="card-footer align-content-center" id="mytable">
                            <button
                                    type="button"
                                    class="btn btn-sm btn-danger cancelBtn"
                                    data-toggle="modal"
                                    data-id="${book.bookingId}"
                                    data-tourist="${book.tourist.touristId}"
                                    id="confirmBtn"
                                    value=""
                                    data-target="#myModalCancel">
                                Cancel booking
                            </button>

                            <button
                                    type="button"
                                    class="btn btn-sm btn-success pull-right confirmBtn"
                                    data-toggle="modal"
                                    data-id="${book.bookingId}"
                                    data-tourist="${book.tourist.touristId}"
                                    id="confirmBtn"
                                    value=""
                                    data-target="#myModalConfirm">
                                Confirm booking
                            </button>
                        </div>
                    </#if>
                    <#if hasExpired>
                        <div class="card-footer align-content-center" id="mytable">
                            <div class="alert alert-warning alert-dismissable">
<#--                                <a class="panel-close close" data-dismiss="alert">×</a>-->
                                <i class="fa fa-coffee"></i>
                                This booking has expired
                            </div>
                        </div>
                    </#if>

                </div>
            </div>
        <#else>
            <div class="mx-auto" style="text-align: center;">No bookings are available</div>
        </#list>
    </div>

    <div class="modal " id="myModalConfirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure you want to confirm this booking?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/booking/confirm" method="post" id="confirmForm">
                        <textarea
                                name="message"
                                rows="3"
                                class="form-control rounded-0"
                                required></textarea>
                        <input type="hidden" class="form-control" name="bookingId" value="">
                        <input type="hidden" class="form-control" name="touristId" value="">
                        <input type="hidden" class="form-control" name="_csrf" value="${_csrf.token}"/>
                    </form>
                    <h5 style="color:green">Please, write the message that will gives the details about booking.<br/>Provide
                        the most convenient time period for the excursion. <br/>This message will be sent to the tourist
                        via
                        email!</h5>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" id="confirmSubmit" class="btn btn-primary" form="confirmForm">Confirm</button>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModalCancel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure you want to cancel this booking?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <form action="/booking/cancel" method="post" id="cancelForm">
                        <textarea
                                name="message"
                                rows="3"
                                class="form-control rounded-0"
                                required></textarea>
                        <input type="hidden" name="bookingId" value="">
                        <input type="hidden" class="form-control" name="touristId" value="">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                    <p style="color:indianred">Please, write the message that will explain you cancellation.<br/>This
                        message will be sent to the tourist via email!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" form="cancelForm">Confirm cancellation</button>
                </div>
            </div>
        </div>
    </div>
</#macro>