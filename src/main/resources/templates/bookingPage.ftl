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
                        <a class="nav-link active" href="#notConfirmed" role="tab" data-toggle="tab">
                            <i class="material-icons">camera</i>
                            Not confirmed
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#works" role="tab" data-toggle="tab">
                            <i class="material-icons">palette</i>
                            Future
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#favorite" role="tab" data-toggle="tab">
                            <i class="material-icons">favorite</i>
                            Past
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div id="notConfirmed">
                <@bcards.booking bookings=bookingList></@bcards.booking>
    </div>
</@c.page>
<script>
    $(document).on("click", ".confirmBtn", function () {
        let myBookingId = $(this).data('id');
        console.log(myBookingId);
        $(".modal-body #bookingId").val( myBookingId );
    });

    $(document).on("click", ".cancelBtn", function () {
        let myBookingId = $(this).data('id');
        console.log(myBookingId);
        $(".modal-body #bookingId").val( myBookingId );
    });
</script>