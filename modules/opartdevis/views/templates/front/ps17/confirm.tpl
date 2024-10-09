{**
 * Prestashop module : OpartDevis
 *
 * @author Olivier CLEMENCE <manit4c@gmail.com>
 * @copyright  Op'art
 * @license Tous droits réservés / Le droit d'auteur s'applique (All rights reserved / French copyright law applies)
 *}

{extends file='page.tpl'}

{block name="page_content"}
  {capture name=path}{l s='Quotation created' mod='opartdevis'}{/capture}

  <h1>{l s='Quote created' mod='opartdevis'}</h1>

  <p class="alert alert-success">
    {l s='Your quote has been successfully created.' mod='opartdevis'}
  </p>



  <p>
    <a href="{$link->getModuleLink('opartdevis', 'showquotation', ['id_cart' => $id_cart])|escape:'htmlall':'UTF-8'}" class="btn btn-primary button button-medium">
            <span>
                {l s='Click here to download your quote in PDF format' mod='opartdevis'}
                <i class="icon-chevron-right right"></i>
            </span>
    </a>
  </p>

  <p>
    <a href="{$link->getModuleLink('opartdevis', 'listquotation')|escape:'htmlall':'UTF-8'}" class="btn btn-dark button button-medium">
            <span>
                {l s='Voir mes devis' mod='opartdevis'}
            </span>
    </a>
  </p>

  <ul class="footer_links clearfix">
    <li>
      <a href="{$link->getPageLink('my-account', true)|escape:'htmlall':'UTF-8'}" class="btn btn-outline-secondary button button-small">
        <span> {include file="_svg/chevron-left.svg"} {l s='Back to Your Account' mod='opartdevis'}</span>
      </a>
    </li>
  </ul>
{/block}
