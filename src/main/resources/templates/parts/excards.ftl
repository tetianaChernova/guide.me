<#macro cards excursions>
        <div class="card-deck" style="margin-top: 30px;">
        <#list excursions as exc>
            <div class="col-sm-4 mb-5">
                <div class="card js-card h-100">
                    <#if exc.filename??>
                    <a href="#" class="js-product-open" data-toggle="modal" data-target="#exampleModal">
                        <img class="card-img-top" style="width:100%; height:15vw; object-fit: cover;" src="/img/${exc.filename}">
                    </a>
                    <#else>
                        <a href="#" class="js-product-open" data-toggle="modal" data-target="#exampleModal">
                            <img class="card-img-top" style="width:100%; height:15vw; object-fit: cover;" src="https://steemitimages.com/p/32FTXiZsHoAW6noHJDhrg3W8ZKHVFSsLYM859aTDCF8iErWLTod5pCiMV5bGfYDUfQ6W8cM5zcDSRt2Bfrc7VwhBaykTtn3QfRYLLJPu9bEiqLo882UTBrvVQxPoaQv8iHpiQGze98tp2rpe?format=match&mode=fit&width=1280">
                        </a>
                    </#if>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="#" class="js-product-open" data-toggle="modal"
                               data-target="#exampleModal">${exc.title}</a>
                        </h4>
                        <p class="card-text" style=" max-height: 200px; overflow-y: scroll">${exc.description}</p>
                    </div>
                </div>
            </div>
        <#else>
            <div class="mx-auto" style="text-align: center;">No excursions are available</div>
        </#list>
    </div>
</#macro>