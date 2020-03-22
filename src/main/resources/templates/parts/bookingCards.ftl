<#macro booking bookings>
    <div class="card-deck" style="margin-top: 30px;">
        <#list bookings as book>
            <div class="col-sm-4 mb-5">
                <div class="card js-card h-100">
                    <div class="card-body">
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
                </div>
            </div>
        <#else>
            <div class="mx-auto" style="text-align: center;">No bookings are available</div>
        </#list>
    </div>
</#macro>