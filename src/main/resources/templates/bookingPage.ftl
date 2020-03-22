<#import "parts/common.ftl" as c>
<#import "parts/bookingCards.ftl" as bcards>
<#import "parts/navigation.ftl" as navbar>
<@c.page "/static/main.css">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark main main-raised" style="margin: 0;">
        <@navbar.nav user></@navbar.nav>
    </nav>
    <@bcards.booking bookings=bookingList></@bcards.booking>
</@c.page>