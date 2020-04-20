<#macro cards excursions isMainPage>
    <div class="card-deck" style="margin-top: 30px;">
        <#list excursions as exc>
            <div class="col-sm-4 mb-5">
                <div class="card js-card h-100">
                    <#if exc.filename??>
                        <a href="/excursions/${exc.excursionId}">
                            <img class="card-img-top" style="width:100%; height:15vw; object-fit: cover;"
                                 src="/img/${exc.filename}">
                        </a>
                    <#else>
                        <a href="/excursions/${exc.excursionId}">
                            <img class="card-img-top" style="width:100%; height:15vw; object-fit: cover;"
                                 src="https://steemitimages.com/p/32FTXiZsHoAW6noHJDhrg3W8ZKHVFSsLYM859aTDCF8iErWLTod5pCiMV5bGfYDUfQ6W8cM5zcDSRt2Bfrc7VwhBaykTtn3QfRYLLJPu9bEiqLo882UTBrvVQxPoaQv8iHpiQGze98tp2rpe?format=match&mode=fit&width=1280">
                        </a>
                    </#if>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="/excursions/${exc.excursionId}">${exc.title}</a>
                        </h4>
                        <p class="card-text" style=" max-height: 130px; overflow-y: scroll">${exc.description}</p>
                        <#if isMainPage>
                            <#if exc.guide.filename??>
                                <a href="/guide/${exc.guide.guideId}">
                                    <img id="fixedAvatar" src="/img/${exc.guide.filename}"
                                         height="60" width="60"
                                         class="avatar rounded-circle"></a>
                            <#elseif exc.guide.gender = "male">
                                <a href="/guide/${exc.guide.guideId}">
                                    <img id="fixedAvatar"
                                         src="https://f0.pngfuel.com/png/980/886/male-portrait-avatar-png-clip-art.png"
                                         height="60" width="60"
                                         class="avatar rounded-circle"></a>
                            <#else>
                                <a href="/guide/${exc.guide.guideId}">
                                    <img id="fixedAvatar"
                                         src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWKbLa_dJgtKiBItyiLId0m6ZKSbRwtCKCgf9dsgGED2uRcZXJ&usqp=CAU"
                                         height="60" width="60"
                                         class="avatar rounded-circle"></a>
                            </#if>
                        </#if>
                        <div class="pull-right" style="font-size: 110%">
                            <div>
                                <span> ${exc.city}, ${exc.meetingPoint}</span>
                                <span class="glyphicon glyphicon-globe" style="font-size: 130%;"></span>
                            </div>
                            <div>
                                <span style="margin-left: 59%"> ${exc.priceForOne}</span>
                                <span class="glyphicon glyphicon-usd" style="float:right; font-size: 130%;"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <#else>
            <div class="mx-auto" style="text-align: center;">No excursions are available</div>
        </#list>
    </div>
</#macro>

<style>
    #fixedAvatar {
        /*background-color:#ddd;*/
        position: fixed;
        padding: 2em;
        left: 50%;
        top: 0%;
        transform: translateX(-50%);
    }
</style>