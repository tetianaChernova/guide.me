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
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                            <div class="profile">
                                <div class="avatar">
                                    <#if guide??>
                                        <#if guide.filename??>
                                            <img src="/img/${guide.filename}" alt="Circle Image"
                                                 class="img-raised rounded-circle img-fluid">
                                        <#else>
                                            <img src="https://f0.pngfuel.com/png/980/886/male-portrait-avatar-png-clip-art.png"
                                                 alt="Circle Image" class="img-raised rounded-circle img-fluid">
                                        </#if>
                                    </#if>
                                </div>
                                <div class="name">
                                    <h3 class="title">${guide.firstName} ${guide.lastName}</h3>
                                    <h6>${guide.email}        ${guide.phone}</h6>
                                    <a href="#pablo" class="btn btn-just-icon btn-link btn-dribbble"><i
                                                class="fa fa-dribbble"></i></a>
                                    <a href="#pablo" class="btn btn-just-icon btn-link btn-twitter"><i
                                                class="fa fa-twitter"></i></a>
                                    <a href="#pablo" class="btn btn-just-icon btn-link btn-pinterest"><i
                                                class="fa fa-pinterest"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="description text-center">
                        <p>${guide.description}</p>
                    </div>
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                            <div class="profile-tabs">
                                <ul class="nav nav-pills nav-pills-icons justify-content-center" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#all-exc" role="tab" data-toggle="tab">
                                            <i class="material-icons">camera</i>
                                            All
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#works" role="tab" data-toggle="tab">
                                            <i class="material-icons">palette</i>
                                            Work
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#favorite" role="tab" data-toggle="tab">
                                            <i class="material-icons">favorite</i>
                                            Favorite
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content tab-space" id="all-exc">
                        <@excards.cards excursions=excursionList></@excards.cards>
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