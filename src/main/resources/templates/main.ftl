<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<#import "parts/excards.ftl" as excards>
<@c.page>
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

<style>
    .header_mask {
        padding-top: 50px;
        width: 100%;
        height: 100%;
        background: url("https://db82kmzzne7f2.cloudfront.net/ghost-blog/2015/08/AdobeStock_76271180.jpg");
        background-size: cover;
    }

    .container {
        padding-left: 30px;
        padding-right: 30px;
    }

    .row {
        margin-left: -15px;
        margin-right: -15px;
    }

    .col-lg-2 {
        width: 16.66666667%;
    }

    .col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12 {
        float: left;
    }

    address, article, aside, div, footer, header, hgroup, layer, main, nav, section {
        display: block;
    }

    h1, h2, h3, h4, h5, h6 {
        margin: 0;
    }

    .header_container .search_wrap h1 {
        font-size: 92px;
        color: #636363;
        text-align: center;
        font-family: 'ProximaNova-Semibold';
        /*font-family: 'karla', sans-serif;*/
        position: initial;
    }

    form {
        display: block;
        margin-top: 0em;
    }

    .header_container .search_wrap .search {
        width: 100%;
        height: 46px;
        font-family: 'ProximaNova-Light';
        /*font-family: 'karla', sans-serif;*/
        color: #9CA4C2;
        position: relative;
        margin-top: 41px;
    }

    .header_container .search_wrap .search_icon {
        position: absolute;
        left: 15px;
        top: 11px;
        width: 16px;
        height: 24px;
        background: url(https://cdn3.iconfinder.com/data/icons/online-marketing-19/64/52-512.png) no-repeat;
        background-size: 20px auto;
        background-position: -3px;
    }

    .header_container .search_wrap input {
        width: 100%;
        height: 47px;
        outline: none;
        border: none;
        padding-left: 40px;
        padding-right: 15px;
        border-radius: 5px;
        color: #464646;
    }

    .ui-widget input, .ui-widget select, .ui-widget textarea, .ui-widget button {
        font-family: Verdana, Arial, sans-serif;
        font-size: 1em;
    }
</style>