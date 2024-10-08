{**
 * Prestashop module : OpartDevis
 *
 * @author Olivier CLEMENCE <manit4c@gmail.com>
 * @copyright  Op'art
 * @license Tous droits réservés / Le droit d'auteur s'applique (All rights reserved / French copyright law applies)
 *}

{extends file='page.tpl'}

{block name="page_content"}
  {capture name=path}{l s='Quotation request' mod='opartdevis'}{/capture}

  <h1>{l s='Quotation Request' mod='opartdevis'}</h1>

  {if isset($errors)}
    {include file='_partials/form-errors.tpl' errors=$errors}
  {/if}

  {if isset($confirmation)}
    <p class="alert alert-success mt-3">{l s='Votre demande a bien été envoyée à nos équipes' mod='opartdevis'}</p>
  {/if}

  <form action="{$link->getModuleLink('opartdevis', 'simplequotation')|escape:'htmlall':'UTF-8'}" method="post" class="row g-3 mt-4" enctype="multipart/form-data" id="opartDevisForm">
    <div class="card">
      <div class="card-header">
        {l s='Simple form request' mod='opartdevis'}
      </div>
      <div class="card-body mt-4">
        {if $customer_id == 0}
          <!-- Customer -->
          <div class="row mb-3">
            <div class="col-md-3 mb-3">
              <label for="customer_firstname" class="form-label">{l s='Firstname' mod='opartdevis'}*</label>
              <input class="form-control" type="text" name="customer_firstname" value="{if isset($smarty.post.customer_firstname)}{$smarty.post.customer_firstname|escape:'htmlall':'UTF-8'}{/if}" id="customer_firstname" />
            </div>
            <div class="col-md-3 mb-3">
              <label for="customer_lastname" class="form-label">{l s='Lastname' mod='opartdevis'}*</label>
              <input class="form-control" type="text" name="customer_lastname" value="{if isset($smarty.post.customer_lastname)}{$smarty.post.customer_lastname|escape:'htmlall':'UTF-8'}{/if}" id="customer_lastname" />
            </div>
            <div class="col-md-3 mb-3">
              <label for="customer_email" class="form-label">{l s='Email' mod='opartdevis'}*</label>
              <input class="form-control" type="email" name="customer_email" value="{if isset($smarty.post.customer_email)}{$smarty.post.customer_email|escape:'htmlall':'UTF-8'}{/if}" id="customer_email" />
            </div>
            <div class="col-md-3 mb-3">
              <label for="customer_phone" class="form-label">{l s='Phone' mod='opartdevis'}</label>
              <input class="form-control" type="text" name="customer_phone" value="{if isset($smarty.post.customer_phone)}{$smarty.post.customer_phone|escape:'htmlall':'UTF-8'}{/if}" id="customer_phone" />
            </div>
          </div>
          <!-- /Customer -->
        {/if}

        <!-- addresses -->
        {if count($addresses) > 0}
          <div class="row mb-3">
            <div class="col-md-6">
              <label for="delivery_address" class="form-label">{l s='Adresse de livraison' mod='opartdevis'}</label>
              <select name="delivery_address" id="delivery_address" class="form-select">
                {foreach $addresses as $address}
                  <option value="{$address.id_address|escape:'htmlall':'UTF-8'}">{$address.firstname|escape:'htmlall':'UTF-8'} {$address.lastname|escape:'htmlall':'UTF-8'} - {$address.address1|escape:'htmlall':'UTF-8'}{if $address.address2!=""} {$address.address2|escape:'htmlall':'UTF-8'}{/if} - {$address.postcode|escape:'htmlall':'UTF-8'} {$address.city|escape:'htmlall':'UTF-8'}</option>
                {/foreach}
              </select>
            </div>
            <div class="col-md-6">
              <label for="invoice_address" class="form-label">{l s='Adresse de facturation' mod='opartdevis'}</label>
              <select name="invoice_address" id="invoice_address" class="form-select">
                {foreach $addresses as $address}
                  <option value="{$address.id_address|escape:'htmlall':'UTF-8'}">{$address.firstname|escape:'htmlall':'UTF-8'} {$address.lastname|escape:'htmlall':'UTF-8'} - {$address.address1|escape:'htmlall':'UTF-8'}{if $address.address2!=""} {$address.address2|escape:'htmlall':'UTF-8'}{/if} - {$address.postcode|escape:'htmlall':'UTF-8'} {$address.city|escape:'htmlall':'UTF-8'}</option>
                {/foreach}
              </select>
            </div>
          </div>
        {else}
          <div class="row mb-3">
            <div class="col-md-6 mb-3">
              <label for="delivery_address_text" class="form-label">{l s='Adresse de livraison' mod='opartdevis'}</label>
              <textarea class="form-control" id="delivery_address_text" name="delivery_address_text">{if isset($smarty.post.delivery_address_text)}{$smarty.post.delivery_address_text|escape:'htmlall':'UTF-8'}{/if}</textarea>
            </div>
            <div class="col-md-6">
              <label for="invoice_address_text" class="form-label">{l s='Adresse de facturation' mod='opartdevis'}</label>
              <textarea class="form-control" id="invoice_address_text" name="invoice_address_text">{if isset($smarty.post.invoice_address_text)}{$smarty.post.invoice_address_text|escape:'htmlall':'UTF-8'}{/if}</textarea>
            </div>
          </div>
        {/if}
        <!-- /addresses -->

        <!-- Quotation description -->
        <div class="mb-3">
          <label for="quotation_message" class="form-label">{l s='Votre demande' mod='opartdevis'}*</label>
          <textarea class="form-control" rows="3" id="quotation_message" name="quotation_message">{if isset($smarty.post.quotation_message)}{$smarty.post.quotation_message nofilter}{/if}</textarea>
        </div>
        <!-- /Quotation description -->

        <!-- attached file -->
{*        <div class="mb-3">*}
{*          <label for="quotation_file" class="form-label">{l s='Attachments (5MB max) :' mod='opartdevis'}*</label>*}
{*          <input type="hidden" name="MAX_FILE_SIZE" value="5242880">*}
{*          <input id="quotation_file" type="file" name="quotation_file" class="form-control" enctype="multipart/form-data">*}
{*          <div class="form-text">{l s='Fields with a * are required' mod='opartdevis'}</div>*}
{*        </div>*}
        <!-- /attached file -->
      </div>
    </div>

    <div class="d-flex gap-2">
      <a href="{$link->getPageLink('my-account', true)|escape:'htmlall':'UTF-8'}" class="btn btn-outline-secondary">
        {include file="_svg/chevron-left.svg"} {l s='Back to Your Account' mod='opartdevis'}
      </a>
{*      <a href="{$urls.base_url}" class="btn btn-secondary">*}
{*        <i class="bi bi-chevron-left"></i> {l s='Accueil' mod='opartdevis'}*}
{*      </a>*}
      {if (Configuration::get('OPARTDEVIS_CAPTCHA') && Configuration::get('OPARTDEVIS_CAPTCHA_PUBLIC_KEY') && Configuration::get('OPARTDEVIS_CAPTCHA_PRIVATE_KEY'))}
        <script src='https://www.google.com/recaptcha/api.js' async defer></script>
        <div class="g-recaptcha col-md-4" data-sitekey="{Configuration::get('OPARTDEVIS_CAPTCHA_PUBLIC_KEY')}"></div>
      {/if}
      <button type="submit" name="submitOpartMessage" id="submitOpartMessage" class="btn btn-primary ms-auto me-0">
        <i class="bi bi-save"></i> {l s='Send your request' mod='opartdevis'}
      </button>
    </div>
  </form>
{/block}
