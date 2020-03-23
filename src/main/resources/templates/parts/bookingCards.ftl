<#macro booking bookings>
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
<#--                    <#if !book.isConfirmed>-->
                    <div class="card-footer align-content-center" id="mytable">
                        <button
                                type="button"
                                class="btn btn-sm btn-danger cancelBtn"
                                data-toggle="modal"
                                data-id="${book.bookingId}"
                                id="confirmBtn"
                                data-target="#myModalCancel">
                            Cancel booking
                        </button>

                        <button
                                type="button"
                                class="btn btn-sm btn-success pull-right confirmBtn"
                                data-toggle="modal"
                                data-id="${book.bookingId}"
                                id="confirmBtn"
                                data-target="#myModalConfirm">
                            Confirm booking
                        </button>
                    </div>

                </div>
<#--                </#if>-->
            </div>
        <#else>
            <div class="mx-auto" style="text-align: center;">No bookings are available</div>
        </#list>
    </div>

    <form action="/confirm" method="post">
        <div class="modal fade" id="myModalConfirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <form action="/booking" method="post">
                            <input type="hidden" name="bookingId" id="bookingId" value="">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" id="confirmSubmit" class="btn btn-primary">Confirm</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <form action="/cancel" method="post">
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
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <form action="/booking" method="post">
                            <input type="hidden" name="bookingId" id="bookingId" value="">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-primary">Confirm cancelation</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </form>
</#macro>