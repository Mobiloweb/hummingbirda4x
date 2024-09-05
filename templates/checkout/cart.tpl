{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{extends file=$layout}

{block name='content'}
  <div class="cart-grid row gap-4">
    <!-- Left Block: cart product informations & shpping -->
    <div class="cart-grid__body col-lg-8 px-0 border px-2 p-4">
      <h1 class="page-title-section display-4 fw-bold">{l s='Shopping Cart' d='Shop.Theme.Checkout'}</h1>

      <!-- cart products detailed -->
      <div class="cart-container mb-3 px-2">
        {block name='cart_overview'}
          {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
        {/block}

        {block name='continue_shopping'}
          <a class="btn btn-outline-primary btn-with-icon" href="{$urls.pages.index}">
            {include file="_svg/chevron-left.svg"}
            {l s='Continue shopping' d='Shop.Theme.Actions'}
          </a>
        {/block}

        <!-- shipping informations -->
        {block name='hook_shopping_cart_footer'}
          {hook h='displayShoppingCartFooter'}
        {/block}
      </div>
    </div>


    <!-- Right Block: cart subtotal & cart total -->
    <div class="cart-grid__right col border p-4">
      <h2 class="h4">{l s='Order summary' d='Shop.Theme.Checkout'}</h2>
      {block name='cart_summary'}
        <div class="card cart-summary">
          {block name='hook_shopping_cart'}
            {hook h='displayShoppingCart'}
          {/block}

          {block name='cart_totals'}
            {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
          {/block}

          {block name='cart_actions'}
            {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
          {/block}
        </div>
      {/block}

      <hr />

      {block name='hook_reassurance'}
        {hook h='displayReassurance'}
      {/block}
    </div>
  </div>

  {hook h='displayCrossSellingShoppingCart'}
{/block}
