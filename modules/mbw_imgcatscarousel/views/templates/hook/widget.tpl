<section class="container-fluid text-center mt-5 pb-5">
    <h2 class="dyn-title text-uppercase"><span class="fw-normal d-block fs-6">Toutes</span>nos marques</h2>

    <div class="container position-relative">
        <ul class="glider-imgcats">
            {foreach from=$categories item=$category}
                <li class="d-flex flex-column">
                    <img class="img-fluid mx-auto" alt="Image par défaut de la catégorie numéro {$category.id}"
                         src="{$mbw_imgcatscarousel_public_url}/img/default.webp" width="75" height="75"
                         loading="lazy">
                    <a href="{$category.link}" class="text-dark fw-bold mt-4">{$category.name}</a>
                </li>
            {/foreach}
        </ul>

        <div class="owl-nav bg-dark">
            <button type="button" class="owl-prev start-0" id="owl-prev-imgcats-{$id_instance}">
                <img width="16" height="16" loading="lazy" src="{$mbw_imgcatscarousel_public_url}/img/svg/chevron-left.svg"
                     alt="slide left">
            </button>
            <button type="button" class="owl-next end-0" id="owl-next-imgcats-{$id_instance}">
                <img width="16" height="16" loading="lazy" src="{$mbw_imgcatscarousel_public_url}/img/svg/chevron-right.svg"
                     alt="slide right">
            </button>
        </div>
    </div>
</section>
