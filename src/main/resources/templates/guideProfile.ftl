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
                                                 class="img-raised rounded-circle img-fluid"
                                                 style="width: 140px;height: 140px;">
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
                                        <a class="nav-link active" href="#all" id="allLink" role="tab" data-toggle="tab">
                                            <i class="material-icons">camera</i>
                                            All
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#personal" id="personalLink" role="tab" data-toggle="tab">
                                            <i class="material-icons">palette</i>
                                            Personal
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#mostVisited" id="mostVisitedLink" role="tab" data-toggle="tab">
                                            <i class="material-icons">favorite</i>
                                            Most visited
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content tab-space" id="all" style="display: initial;">
                        <@excards.cards excursions=allExcursionList isMainPage=false></@excards.cards>
                    </div>
                    <div class="tab-content tab-space" id="personal" style="display: none;">
                        <@excards.cards excursions=personalExcursionList isMainPage=false></@excards.cards>
                    </div>
                    <div class="tab-content tab-space" id="mostVisited" style="display: none;">
                        <@excards.cards excursions=mostVisitedExcursionList isMainPage=false></@excards.cards>
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

<script>
    $(function () {
        $('#allLink').click(function () {

            let dataDivAll = document.getElementById("all");
            let dataDivPersonal = document.getElementById("personal");
            let dataDivMostVisited = document.getElementById("mostVisited");
            if (dataDivAll.style.display === "none") {
                dataDivAll.style.display = "initial";
                dataDivPersonal.style.display = "none";
                dataDivMostVisited.style.display = "none";
                $(".show").removeClass('show');
            }
        });
        $('#personalLink').click(function () {

            let dataDivAll = document.getElementById("all");
            let dataDivPersonal = document.getElementById("personal");
            let dataDivMostVisited = document.getElementById("mostVisited");
            if (dataDivPersonal.style.display === "none") {
                dataDivAll.style.display = "none";
                dataDivPersonal.style.display = "initial";
                dataDivMostVisited.style.display = "none";
                $(".show").removeClass('show');
            }
        });
        $('#mostVisitedLink').click(function () {

            let dataDivAll = document.getElementById("all");
            let dataDivPersonal = document.getElementById("personal");
            let dataDivMostVisited = document.getElementById("mostVisited");
            if (dataDivMostVisited.style.display === "none") {
                dataDivAll.style.display = "none";
                dataDivPersonal.style.display = "none";
                dataDivMostVisited.style.display = "initial";
                $(".show").removeClass('show');
            }
        });
    });
</script>