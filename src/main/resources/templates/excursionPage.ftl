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
                <div class="container" style="width: 1200px; height: 600px; margin: -100px auto;">
                    <div id="img-wrap">
                        <ul class="images">
                            <li class="big-img">
                                <img src="https://db82kmzzne7f2.cloudfront.net/ghost-blog/2015/08/AdobeStock_76271180.jpg"/>
                            </li>
                        </ul>
                    </div>
                    <div class="info">

                        <h1>Classic Mid Volume</h1>
                        <h2>Guide: Anna Todd</h2>
                        <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(20).jpg" alt="Avatar" class="avatar rounded-circle">

                        <p>A backpack with adjustable and padded shoulder straps. It has a padded back panel and contains multiple compartments.</p>
                        <p>Has a volume on 18 L. and is made of 100% Polyester.</p>

                        <div class="important1">
                            <p id="importantp">Price<p>
                            <h1 id="price">$ 62.25</h1>
                        </div>
                        <div class="important2">
                            <p id="importantp">People amount<p>
                            <h1 id="amount">5</h1>
                        </div>
                        <div class="important3">
                            <p id="importantp">Duraration<p>
                            <h1 id="duration">1h 30m</h1>
                        </div>
                        <div class="important4">
                            <p id="importantp">Meetingpoint<p>
                            <h1 id="meeting_point">Rome, de Trevi</h1>
                        </div>
                        <button>Add to cart</button>

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
</@c.page>


<style>
    #img-wrap {
        /* width: 550px; */
        width: 80%;
        margin-left: -300px;
        margin-top: -40px;
        height: 100%;
        float: left;
        position: relative;
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
        /*padding: 50px 0px 50px 0;*/
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
    .info #importantp, .info{
        text-transform: uppercase;
        letter-spacing: 1px;
        font-size: 0.9em;
        color: #D64541;
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

    .form .color {
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        padding: 0 20px;
        width: 100%;
        height: 40px;
        border: none;
        background: #F0C2C2;
        font-size: 0.9em;
        letter-spacing: 1px;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        -ms-border-radius: 5px;
        border-radius: 5px;
        color: #444B54;
        cursor: pointer;
        font-weight: 400;
    }
    .form .color:hover {
        background: #efb7b7;
    }

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
</style>
