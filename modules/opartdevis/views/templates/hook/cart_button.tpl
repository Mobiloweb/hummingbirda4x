{**
 * Prestashop module : OpartDevis
 *
 * @author Olivier CLEMENCE <manit4c@gmail.com>
 * @copyright  Op'art
 * @license Tous droits réservés / Le droit d'auteur s'applique (All rights reserved / French copyright law applies)
 *}

<div class="clearfix text-sm-center mt-1 mb-4">
  <a href="{$link->getModuleLink('opartdevis', 'createquotation', ['create' => true])|escape:'htmlall':'UTF-8'}" class="btn btn-outline-primary w-100">
        <span>
            <b>
                {if !$quotation}
                  {l s='Turn this cart into a quote' mod='opartdevis'}
                {else}
                  {l s='Update the quotation' mod='opartdevis'}
                {/if}
            </b>
        </span>
  </a>
</div>
