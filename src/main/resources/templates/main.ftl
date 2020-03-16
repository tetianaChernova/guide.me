<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<#import "parts/excards.ftl" as excards>
<@c.page "/static/main.css">
    <div class="header_container" style="height: 478px;">
        <div class="col-lg-4 top-right">
            <@l.logout></@l.logout>
        </div>
        <div class="header_mask">
            <header class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-md-offset-6 col-lg-offset-6">
                        <div class="enter">
                        </div>
                    </div>
                </div>
            </header>
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
    <@excards.cards excursions=excursionList></@excards.cards>
</@c.page>