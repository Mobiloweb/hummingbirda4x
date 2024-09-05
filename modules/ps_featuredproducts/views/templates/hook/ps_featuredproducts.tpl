{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
<section class="featured-products">
  <div class="container">
    {include file='components/section-title.tpl' title={l s='Popular Products' d='Shop.Theme.Catalog'}}
    {include file='catalog/_partials/productlist.tpl' products=$products productClass='col-6 col-lg-4 col-xl-3'}
  </div>

  <div class="featured-products-footer text-center">
    <a class="all-product-link btn btn-outline-primary btn-with-icon btn-lg fill-primary" href="{$allProductsLink}">
      {l s='All products' d='Shop.Theme.Catalog'}
      {include file='_svg/arrow-right.svg'}
    </a>
  </div>
</section>
