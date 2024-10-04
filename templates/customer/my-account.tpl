{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{extends file='customer/page.tpl'}

{$componentName = 'customer-link'}

{block name='page_title'}
  {l s='Mon compte' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <div class="{$componentName} row g-4">
    <a class="{$componentName}__link col-md-6 col-lg-4 text-md-center text-left" id="identity-link" href="{$urls.pages.identity}">
      <span class="link-item p-5 shadow">
        <i class="material-icons" aria-hidden="true">&#xE853;</i>
        <p class="text-uppercase mb-0">{l s='Information' d='Shop.Theme.Customeraccount'}</p>
      </span>
    </a>

    {if $customer.addresses|count}
      <a class="{$componentName}__link col-md-6 col-lg-4 text-md-center text-left" id="addresses-link" href="{$urls.pages.addresses}">
        <span class="link-item p-5 shadow">
          <i class="material-icons" aria-hidden="true">&#xE56A;</i>
          <p class="text-uppercase mb-0">{l s='Addresses' d='Shop.Theme.Customeraccount'}</p>
        </span>
      </a>
    {else}
      <a class="{$componentName}__link col-md-6 col-lg-4 text-md-center text-left" id="address-link" href="{$urls.pages.address}">
        <span class="link-item p-5 shadow">
          <i class="material-icons" aria-hidden="true">&#xE567;</i>
          <p class="text-uppercase mb-0">{l s='Add first address' d='Shop.Theme.Customeraccount'}</p>
        </span>
      </a>
    {/if}

    {if !$configuration.is_catalog}
      <a class="{$componentName}__link col-md-6 col-lg-4 text-md-center text-left" id="history-link" href="{$urls.pages.history}">
        <span class="link-item p-5 shadow">
          <i class="material-icons" aria-hidden="true">&#xE916;</i>
          <p class="text-uppercase mb-0">{l s='Order history and details' d='Shop.Theme.Customeraccount'}</p>
        </span>
      </a>
    {/if}

    {if !$configuration.is_catalog}
      <a class="{$componentName}__link col-md-6 col-lg-4 text-md-center text-left" id="order-slips-link" href="{$urls.pages.order_slip}">
        <span class="link-item p-5 shadow">
          <i class="material-icons" aria-hidden="true">&#xE8B0;</i>
          <p class="text-uppercase mb-0">{l s='Credit slips' d='Shop.Theme.Customeraccount'}</p>
        </span>
      </a>
    {/if}

    {if $configuration.voucher_enabled && !$configuration.is_catalog}
      <a class="{$componentName}__link col-md-6 col-lg-4 text-md-center text-left" id="discounts-link" href="{$urls.pages.discount}">
        <span class="link-item p-5 shadow">
          <i class="material-icons" aria-hidden="true">&#xE54E;</i>
          <p class="text-uppercase mb-0">{l s='Vouchers' d='Shop.Theme.Customeraccount'}</p>
        </span>
      </a>
    {/if}

    {if $configuration.return_enabled && !$configuration.is_catalog}
      <a class="{$componentName}__link col-md-6 col-lg-4 text-md-center text-left" id="returns-link" href="{$urls.pages.order_follow}">
        <span class="link-item p-5 shadow">
          <i class="material-icons" aria-hidden="true">&#xE860;</i>
          <p class="text-uppercase mb-0">{l s='Merchandise returns' d='Shop.Theme.Customeraccount'}</p>
        </span>
      </a>
    {/if}

    {block name='display_customer_account'}
      {hook h='displayCustomerAccount'}
    {/block}
  </div>
{/block}

{block name='page_footer'}
  {block name='my_account_links'}
    <div class="mt-4 text-sm-center">
      <a href="{$urls.actions.logout}" class="btn btn-primary">
        {l s='Sign out' d='Shop.Theme.Actions'}
      </a>
    </div>
  {/block}
{/block}
