{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
<div class="product__additional-info js-product-additional-info">
  <button type="button" class="btn btn-lg btn-outline-primary" data-bs-toggle="modal"
          data-bs-target="#popupDeliveryModal">
    Délais de préparation et de fabrication
  </button>

  {include file="catalog/_partials/product-delivery-modal.tpl"}

  {hook h='displayProductAdditionalInfo' product=$product}
</div>
