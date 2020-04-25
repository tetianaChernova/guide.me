<#import "parts/common.ftl" as c>
<#import "parts/excards.ftl" as excards>
<#import "parts/navigation.ftl" as navbar>
<@c.page "/static/touristprofile.css">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark main main-raised" style="margin: 0;">
        <@navbar.nav user></@navbar.nav>
    </nav>
    <div class="profile-page">
        <div class="page-header header-filter" data-parallax="true"
             style="background-image:url('https://media.timeout.com/images/105189172/image.jpg'); margin: 0"></div>
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                            <div class="profile">
                                <div class="avatar">
                                    <#if tourist??>
                                        <#if tourist.filename??>
                                            <img src="/img/${tourist.filename}" alt="Circle Image"
                                                 class="img-raised rounded-circle img-fluid" style="width: 140px;height: 140px;">
                                        <#else>
                                            <img src="https://f0.pngfuel.com/png/980/886/male-portrait-avatar-png-clip-art.png"
                                                 alt="Circle Image" class="img-raised rounded-circle img-fluid">
                                        </#if>
                                    </#if>
                                </div>
                                <div class="name">
                                    <h3 class="title">${tourist.firstName} ${tourist.lastName}</h3>
                                    <p>${bookingsNumber} bookings <i class="glyphicon glyphicon-ok"></i></p>
                                    <p><i class="glyphicon glyphicon-phone"></i>${tourist.phone}</p>
                                    <p><i class="glyphicon glyphicon-envelope"></i> ${tourist.email}</p>
                                    <p>${tourist.nationality}, currently living in ${tourist.city}<i class="glyphicon glyphicon-map-marker"></i></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer text-center ">
            <p>Made with Love
                by GuideMe Team</p>
        </footer>
    </div>
</@c.page>