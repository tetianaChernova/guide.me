<#import "parts/common.ftl" as c>
<#import "parts/bookingCards.ftl" as bcards>
<#import "parts/navigation.ftl" as navbar>
<@c.page "/static/main.css">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark main main-raised" style="margin: 0;">
        <@navbar.nav user></@navbar.nav>
    </nav>
    <div class="row">
        <div class="col-md-6 ml-auto mr-auto">
            <div class="profile-tabs">
                <ul class="nav nav-pills nav-pills-icons justify-content-center" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" href="#notConfirmed" id="notConfirmedLink" role="tab"
                           data-toggle="tab">
                            <i class="material-icons">camera</i>
                            Not confirmed
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#future" role="tab" id="futureLink" data-toggle="tab">
                            <i class="material-icons">palette</i>
                            Future
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#past" role="tab" id="pastLink" data-toggle="tab">
                            <i class="material-icons">favorite</i>
                            Past
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#expired" id="expiredLink" role="tab"
                           data-toggle="tab">
                            <i class="material-icons">alarm_on</i>
                            Expired
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div id="notConfirmed" style="display: initial;">
        <@bcards.booking bookings=notConfirmedBookings hasExpired=false></@bcards.booking>
    </div>
    <div id="future" style="display: none;">
        <@bcards.booking bookings=futureBookings hasExpired=false></@bcards.booking>
    </div>
    <div id="past" style="display: none;">
        <@bcards.booking bookings=pastBookings hasExpired=false></@bcards.booking>
    </div>
    <div id="expired" style="display: none;">
        <@bcards.booking bookings=expiredBookings hasExpired=true></@bcards.booking>
    </div>

</@c.page>
<script>

    $('#myModalCancel').on('hidden.bs.modal', function (e) {
        $(this)
            .find("textarea")
            .val('')
            .end()
            .prop("checked", "")
            .end();
    });

    $('#myModalConfirm').on('hidden.bs.modal', function (e) {
        $(this)
            .find("textarea")
            .val('')
            .end()
            .find("input[type=checkbox], input[type=radio]")
            .prop("checked", "")
            .end();
    });

    $(function () {
        $('#notConfirmedLink').click(function () {

            let dataDivNotConfirmed = document.getElementById("notConfirmed");
            let dataDivFuture = document.getElementById("future");
            let dataDivPast = document.getElementById("past");
            let dataDivExpired = document.getElementById("expired")
            if (dataDivNotConfirmed.style.display === "none") {
                dataDivNotConfirmed.style.display = "initial";
                dataDivFuture.style.display = "none";
                dataDivPast.style.display = "none";
                dataDivExpired.style.display = "none";
                $(".show").removeClass('show');
            }
        });
        $('#futureLink').click(function () {

            let dataDivNotConfirmed = document.getElementById("notConfirmed");
            let dataDivFuture = document.getElementById("future");
            let dataDivPast = document.getElementById("past");
            let dataDivExpired = document.getElementById("expired")
            if (dataDivFuture.style.display === "none") {
                dataDivNotConfirmed.style.display = "none";
                dataDivFuture.style.display = "initial";
                dataDivPast.style.display = "none";
                dataDivExpired.style.display = "none";
                $(".show").removeClass('show');
            }
        });
        $('#pastLink').click(function () {

            let dataDivNotConfirmed = document.getElementById("notConfirmed");
            let dataDivFuture = document.getElementById("future");
            let dataDivPast = document.getElementById("past");
            let dataDivExpired = document.getElementById("expired")
            if (dataDivPast.style.display === "none") {
                dataDivNotConfirmed.style.display = "none";
                dataDivFuture.style.display = "none";
                dataDivPast.style.display = "initial";
                dataDivExpired.style.display = "none";
                $(".show").removeClass('show');
            }
        });
        $('#expiredLink').click(function () {

            let dataDivNotConfirmed = document.getElementById("notConfirmed");
            let dataDivFuture = document.getElementById("future");
            let dataDivPast = document.getElementById("past");
            let dataDivExpired = document.getElementById("expired")
            if (dataDivExpired.style.display === "none") {
                dataDivNotConfirmed.style.display = "none";
                dataDivFuture.style.display = "none";
                dataDivPast.style.display = "none";
                dataDivExpired.style.display = "initial";
                $(".show").removeClass('show');
            }
        });
    });
    $(document).on("click", ".confirmBtn", function () {
        let myBookingId = $(this).data('id');
        let myTouristId = $(this).data('tourist');
        $('[name ="bookingId"]').val(myBookingId);
        $('[name ="touristId"]').val(myTouristId);
    });

    $(document).on("click", ".cancelBtn", function () {
        let myBookingId = $(this).data('id');
        let myTouristId = $(this).data('tourist');
        $('[name ="bookingId"]').val(myBookingId);
        $('[name ="touristId"]').val(myTouristId);

    });
</script>