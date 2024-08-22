{*
* DISCLAIMER
*
* Do not edit or add to this file.
* You are not authorized to modify, copy or redistribute this file.
* Permissions are reserved by FME Modules.
*
*  @author    FMM Modules
*  @copyright FME Modules 2021
*  @license   Single domain
*}

<script type="text/javascript">
  var carrier_name = "{l s='Carrier Name:' mod='shippingratecalculator' js=1}";
  var delay_name = "{l s='Delay Name:' mod='shippingratecalculator' js=1}";
  var shipping_price = "{l s='Shipping Price with tax:' mod='shippingratecalculator' js=1}";
  var with_cart_item = "{l s='Shipping price with tax and cart items: ' mod='shippingratecalculator' js=1}";
  var alert_message = "{l s='Cart is empty' mod='shippingratecalculator' js=1}";
</script>
<div id="fmm-sc-wrapper" class="fmm-sc-wrapper py-5 px-3" style="display:none">
  <div class="col-12">
    <div class="input-group">
      <p class="h2 text-center fmm-sc-heading">
        {l s='Shipping Calculator' mod='shippingratecalculator'}
      </p>
    </div>
  </div>
  <div class="container px-0">
    <div class="col-12">
      <p>Veuillez préciser vers quelle destination vous souhaitez calculer le tarif d'expédition</p>
      <div class="form-group">
        <label>{l s='Country' mod='shippingratecalculator'}<span class="text-danger">*</span></label>
        <select class="mt-3 noUniform form-control form-control-select" name="id_sc_country" id="id_sc_country">
          {if $fmm_sc_countries AND $fmm_sc_countries|@count > 0}
            {foreach from=$fmm_sc_countries item=country}
              <option value="{$country.id_country|escape:'htmlall':'UTF-8'}">{$country.name|escape:'htmlall':'UTF-8'}</option>
            {/foreach}
          {/if}
        </select>
      </div>

{*      <div class="form-group">*}
{*        <label><strong>{l s='State/Province' mod='shippingratecalculator'}</strong><sub> ({l s='optional' mod='shippingratecalculator'})</sub></label>*}
{*        <select class="noUniform form-control form-control-select" name="id_sc_state" id="id_sc_state">*}
{*          {if $fmm_sc_states AND $fmm_sc_states|@count > 0}*}
{*            {foreach from=$fmm_sc_states item=state}*}
{*              <option value="{$state.id_state|escape:'htmlall':'UTF-8'}">{$state.name|escape:'htmlall':'UTF-8'}</option>*}
{*            {/foreach}*}
{*          {/if}*}
{*        </select>*}
{*      </div>*}

      {if $fmm_sc_city}
        <div class="form-group">
          <label>{l s='City' mod='shippingratecalculator'}<sub> ({l s='optional' mod='shippingratecalculator'})</sub></label>
          <input type="text" class="form-control" name="id_sc_city" id="id_sc_city">
        </div>
      {/if}

      {if $fmm_sc_zipcode}
        <div class="form-group">
          <label>{l s='Zip/Postal Code' mod='shippingratecalculator'}<sub> ({l s='optional' mod='shippingratecalculator'})</sub></label>
          <input type="text" class="form-control" name="id_sc_zipcode" id="id_sc_zipcode">
        </div>
      {/if}

{*      <div class="form-group">*}
{*        <label*}
{*          class="include-cart-item"><strong>{l s='Inlcude Cart Items' mod='shippingratecalculator'}</strong></label>*}
{*        <div class="clearfix">*}
{*          <label class="radio-inline">*}
{*            <input class="optradio_shippingratecalculator" value="1" type="radio" id="radio_1"*}
{*                   name="optradio">{l s=' Yes' mod='shippingratecalculator'}*}
{*          </label>*}
{*          <label class="radio-inline">*}
{*            <input class="optradio_shippingratecalculator" value="0" type="radio" id="radio_2"*}
{*                   name="optradio" checked>{l s=' No' mod='shippingratecalculator'}*}
{*          </label>*}
{*        </div>*}
{*      </div>*}

      <div class="alert alert-danger" id="fmm-sc-error">{l s='Please select a country' mod='shippingratecalculator'}</div>
      <div class="fme-shpping-spinner mt-5" style="display: none;">
        <div class="fme-shpping-spinner-dot"></div>
        <div class="fme-shpping-spinner-dot"></div>
        <div class="fme-shpping-spinner-dot"></div>
        <div class="fme-shpping-spinner-dot"></div>
        <div class="fme-shpping-spinner-dot"></div>
        <div class="fme-shpping-spinner-dot"></div>
      </div>

      <div class="form-group mt-5">
        <button class="btn btn-primary btn-lg"
                type="button"
                id="calculate-shipping-cost"
                shipping_id_product="{$shipping_id_product|escape:'htmlall':'UTF-8'}"
                shipping_id_product_attribute="{$shipping_id_product_attribute|escape:'htmlall':'UTF-8'}"
                shipping_id_customization="{$shipping_id_customization|escape:'htmlall':'UTF-8'}">
          {l s='Calculate' mod='shippingratecalculator'}
        </button>
      </div>
    </div>

    <div class="col-12 mt-5">
      <div class="shipping-rate-calculator-result"></div>
    </div>
  </div>
</div>
<a class="btn btn-lg btn-primary" href="#fmm-sc-wrapper" id="estimate_shipping">
  <i class="fill-light">{include file="_svg/local-shipping.svg"}</i>
  {l s='Estimate Shipping' mod='shippingratecalculator'}
</a>
