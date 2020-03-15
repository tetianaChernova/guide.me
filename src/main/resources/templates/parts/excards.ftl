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
                        <p class="card-text" style=" max-height: 500px; overflow-y: scroll">${exc.description}</p>
                    </div>
                </div>
            </div>
        <#else>
            No excursions are available
        </#list>
    </div>
</#macro>
<#--<style>-->
<#--    .col-sm-4:hover{-->
<#--        -webkit-box-shadow: -1px 9px 40px -12px rgba(0,0,0,0.75);-->
<#--        -moz-box-shadow: -1px 9px 40px -12px rgba(0,0,0,0.75);-->
<#--        box-shadow: -1px 9px 40px -12px rgba(0,0,0,0.75);-->
<#--    }-->
<#--</style>-->
<#--<script>-->
<#--    $(document).ready(function () {-->
<#--        $('.card').hover(-->
<#--            function () {-->
<#--            $(this).animate({-->
<#--                marginTop: "-=1%",-->
<#--            },200)},-->

<#--            function () {-->
<#--                $(this).animate({-->
<#--                    marginTop: "0%",-->
<#--                },200)}-->
<#--        );-->
<#--    })-->
<#--</script>-->