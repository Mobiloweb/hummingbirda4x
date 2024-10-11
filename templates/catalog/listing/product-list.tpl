{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}

{* Full width layout only for "Recherche par Type d'Accessoire" and "RECHERCHER VOTRE PRODUIT" pages *}
{if $category.id == '29815' || $category.id == '29814' || $as_search.id_search == '2' && $page.page_name == 'module-pm_advancedsearch4-searchresults'}
  {$layout = 'layouts/layout-full-width.tpl'}
{/if}

{* Full width layout if we are on the last category depth*}
{*{if Category::getLastPosition($category['id'], $category['id_shop_default']) == 1}*}
{*  {$layout = 'layouts/layout-full-width.tpl'}*}
{*{/if}*}

{extends file=$layout}

{block name='head_microdata_special'}
  {include file='_partials/microdata/product-list-jsonld.tpl' listing=$listing}
{/block}

{block name="top_page_title" append}
  <div class="container-fluid bg-light pt-3 pb-4 mb-4">
    {block name='product_list_header'}
      <h1 id="js-product-list-header display-4 fw-bold" class="h2 mb-4">{$listing.label}</h1>
    {/block}
  </div>
{/block}

{block name='content'}

  {*    {block name='product_list_header'}*}
  {*      <h1 id="js-product-list-header" class="h2 mb-4">{$listing.label}</h1>*}
  {*    {/block}*}

  {block name='product_list_description'}
    {include file='catalog/_partials/category-header.tpl' listing=$listing category=$category}
  {/block}

  {hook h='displayHeaderCategory'}
  <section id="products">
    {if $listing.products|count}

    {block name='product_list_top'}
      {include file='catalog/_partials/products-top.tpl' listing=$listing}
    {/block}

    {block name='product_list_active_filters'}
      {$listing.rendered_active_filters nofilter}
    {/block}

    {block name='product_list'}
      {include file='catalog/_partials/products.tpl' listing=$listing productClass='col-12 col-sm-6 col-lg-4 col-xl-3'}
    {/block}

    {block name='product_list_bottom'}
      {include file='catalog/_partials/products-bottom.tpl' listing=$listing}
    {/block}

    {else}
    <div id="js-product-list-top"></div>

    <div id="js-product-list">
      {capture assign="errorContent"}
        <p class="h4">{l s='No products available yet' d='Shop.Theme.Catalog'}</p>
        <p>{l s='Stay tuned! More products will be shown here as they are added.' d='Shop.Theme.Catalog'}</p>
      {/capture}

      {include file='errors/not-found.tpl' errorContent=$errorContent}
      <div>

        <div id="js-product-list-bottom"></div>
        {/if}
  </section>
  {block name='product_list_footer'}{/block}


  {hook h='displayFooterCategory'}
{/block}
