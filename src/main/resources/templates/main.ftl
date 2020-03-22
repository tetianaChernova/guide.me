<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<#import "parts/excards.ftl" as excards>
<#import "parts/navigation.ftl" as navbar>
<@c.page "/static/main.css">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark main main-raised" style="margin: 0;">
        <@navbar.nav user></@navbar.nav>
    </nav>

    <div class="header_container" style="height: 478px;">
        <div class="header_mask">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-md-offset-2 col-lg-offset-2 search_wrap">
                        <h1/>Unforgettable excursions</h1>
                        <form id="w0" class="headerSearchForm" action="/main" method="get" style="width:100%">
                            <div class="search ui-widget">
                                <div class="search_icon"></div>
                                <input type="text" id="tags" class="headerLocation ui-autocomplete-input"
                                       placeholder="What city you would like to visit?"
                                       name="filter" value="${filter?ifExists}"
                                       style="border-radius: 4px;">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <@excards.cards excursions=excursionList isMainPage=true></@excards.cards>
</@c.page>