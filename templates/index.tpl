{extends file=$layout}

{block name='breadcrumb'}{/block}

{block name='content_columns'}
  {block name='content_wrapper'}
    <div id="content-wrapper" class="wrapper__content">
      {block name='content'}
        {block name='page_content_container'}

          <section aria-label="Sélection de votre véhicule">
            <div class="d-flex flex-column flex-xl-row gap-0 mt-2 mb-5">
              <div class="order-1 order-xl-0 col-xl-3 col-xxl-4 bg-dark position-relative">
                <div class="container-fluid h-100 PM_HomeContainer">
                  {widget name="pm_advancedsearch4" id_search_engine="2"}
                </div>
              </div>
              <div class="order-0 order-xl-1 col-xl-9 col-xxl-8">
                {widget name="ps_imageslider"}
              </div>
            </div>
          </section>
          
          <section id="content" class="page-content page-home" aria-label="Contenu">
            {block name='page_content'}
              {block name='hook_home'}
                
                {include file='components/home-banner-section.tpl'}
                {include file='components/home-carousel.tpl'}

                {widget name="mbw_imgcatscarousel" id_categories=[12856, 31394, 12857, 31701, 12859, 12860, 12861, 12862, 31960, 12863, 12865, 12866, 31975, 12867, 12868, 31679, 12870, 12871, 12872, 12873, 12874, 12883, 12875, 12876, 12877, 12879, 12880, 12881, 32214, 30860, 12912, 12884, 12885, 31739, 12886, 12887, 12888, 31698, 12890, 12891, 31695, 31687, 12894, 31945, 12895, 12897, 12898, 12899, 12900, 12901, 12902, 12903, 29870, 12904, 12905, 12906]}

                {include file='components/home-carousel-alternate.tpl'}

                <section class="container-fluid mt-5">
                  <div class="row">
                    <div class="col-12 col-lg-6 col-xl-7">
                      <img src="{$urls.img_url}/home/accessauto4x4-a-votre-ecoute-depuis-2007.webp" alt="Personne à l'écoute" class="img-fluid w-100" loading="lazy">
                    </div>
                    <div class="col-12 col-lg-6 col-xl-5">
                      <h2 class="mt-3 mt-lg-0 text-uppercase">Accessauto4x4.com, spécialiste e-commerce de vos accessoires auto depuis 2007</h2>
                      <p>Chez Accessauto4x4, nous sommes <strong>spécialisés dans les accessoires automobiles pour les véhicules 4x4, SUV et utilitaires</strong>. Nous savons que chaque véhicule est unique, tout comme son conducteur, c'est pourquoi nous proposons une large gamme de produits conformes ou constructeurs qui s'adaptent parfaitement à votre modèle.</p>
                      <p>Nous sommes fiers de vous offrir des produits de qualité supérieure, des conseils d'experts et un service client à l’écoute. Que vous cherchiez des barres de toit, des marchepieds, des pare-chocs, des échappements, des protège-carters ou tout autre accessoire, nous avons ce qu'il vous faut pour personnaliser votre véhicule à votre goût, et l’adapter à vos besoins.</p>
                      <p><strong>Avec plus de 30 000 références d'accessoires automobiles pour toutes les marques</strong>, nous sommes sûrs que vous trouverez tout ce dont vous avez besoin pour personnaliser votre véhicule à votre image. N'hésitez pas à contacter notre équipe si vous avez des questions ou besoin de conseils, nous sommes là pour vous aider à trouver les meilleurs produits pour votre véhicule, à des prix compétitifs. <strong>Merci de faire confiance à Accessauto4x4</strong> depuis toutes ces années pour l'équipement de vos véhicules en accessoires automobiles !</p>
                    </div>
                  </div>
                </section>
              {/block}
            {/block}
          </section>

        {/block}
      {/block}
    </div>
  {/block}
{/block}
