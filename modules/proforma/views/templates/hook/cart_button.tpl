{**
 * Prestashop module : ProForma
 *
 * @author Yann
 * @copyright  Yann
 * @license Tous droits réservés / Le droit d'auteur s'applique (All rights reserved / French copyright law applies)
 *}

<div class="clearfix text-sm-center mt-1 mb-3">
  <a id="proforma_button" href="{$link->getModuleLink('proforma', 'createquotation', ['create' => true])|escape:'htmlall':'UTF-8'}" class="btn btn-outline-primary w-100">
        <span>
            <b>
                {if !$quotation}
                  {l s='Turn this cart into a quote' mod='proforma'}
                {else}
                  {l s='Update the quotation' mod='proforma'}
                {/if}
            </b>
        </span>
  </a>
</div>
