{**
 * Prestashop module : ProForma
 *
 * @author Yann
 * @copyright  Yann
 * @license Tous droits réservés / Le droit d'auteur s'applique (All rights reserved / French copyright law applies)
 *}

{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Your quotations' mod='proforma'}
{/block}

{block name='page_content'}
  {if isset($deleted) && $deleted=="success"}
    <div class="alert alert-success">{l s='Quotation deleted' mod='proforma'}</div>
  {/if}

  {if $quotations && count($quotations)}
    <table id="order-list" class="table table-bordered table-striped">
      <thead>
      <tr>
        <th class="item"></th>
        <th class="item">{l s='Date' mod='proforma'}</th>
        {if isset($expiretime) && $expiretime > 0}
          <th class="item">{l s='Expired date' mod='proforma'}</th>
        {/if}
        <th class="item">{l s='Name' mod='proforma'}</th>
        <th class="item">&nbsp;</th>
        <th class="item">&nbsp;</th>
        <th class="last_item">&nbsp;</th>
      </tr>
      </thead>
      <tbody>
      {foreach from=$quotations item=quotation name=myLoop}
        <tr>
          <td>{$quotation.id_proforma|escape:'htmlall':'UTF-8'}</td>
          <td>{dateFormat date=$quotation.date_add full=1}</td>
          {if isset($quotation.expire_date) && $quotation.expire_date > 0}
            <td>{dateFormat date=$quotation.expire_date full=1}</td>
          {/if}
          <td><span id="name_{$quotation.id_proforma}">
                            {$quotation.name|escape:'htmlall':'UTF-8'}</span>
            <div class="collapse" id="collapseExample">
              <div class="card card-body">
                <input type="text"  class="form-control" name="newname" id="newname_{$quotation.id_proforma}"  placeholder="{$quotation.name|escape:'htmlall':'UTF-8'}" />
                <button type="submit" class="btn btn-outline-info btn-small" onclick="RenameQuote({$quotation.id_proforma});" name="send_new_name">{l s='Rename' mod='proforma'}</button>
              </div>
            </div>
          </td>
          <td>
            {if $quotation.status == ProfQuotation::VALIDATED}
              <a href="{$link->getModuleLink('proforma','loadquotation',['proformaId'=>$quotation.id_proforma,'proceedCheckout'=>true])|escape:'htmlall':'UTF-8'}" class="btn btn-primary">
                <span class="proFormaHide">{l s='Proceed to checkout' mod='proforma'}<i class="material-icons">done</i></span>
              </a>
            {else if $quotation.status == ProfQuotation::ORDERED}
              <a href="{$link->getPageLink('order-detail', true, NULL, "id_order={$quotation.id_order|intval}")|escape:'html':'UTF-8'}" class="btn btn-primary">
                <span class="proFormaHide">{l s='Display order' mod='proforma'}<i class="material-icons">library_books</i></span>
              </a>
            {else if $quotation.status == ProfQuotation::EXPIRED}
              {l s='Expired' mod='proforma'}
            {else}
              <a href="{$link->getModuleLink('proforma','loadquotation',['proformaId'=>$quotation.id_proforma])|escape:'htmlall':'UTF-8'}" class="btn btn-outline-primary btn-sm">
                <span class="proFormaHide">{l s='Modify' mod='proforma'} </span>
              </a>
            {/if}
          </td>
          <td>
            {if $quotation.status == ProfQuotation::NOT_VALIDATED || $quotation.status == ProfQuotation::EXPIRED}
              <a href="{$link->getModuleLink('proforma', 'listquotation', ['action' => 'delete', 'proformaId' => $quotation.id_proforma])|escape:'htmlall':'UTF-8'}" class="btn btn-outline-danger btn-sm">
                <span class="proFormaHide">{l s='Delete' mod='proforma'} </span>
              </a>
            {/if}
          </td>
          <td>
            <a href="{$link->getModuleLink('proforma', 'showquotation', ['id_cart' => $quotation.id_cart])|escape:'htmlall':'UTF-8'}" class="btn btn-outline-success btn-sm">
              <span class="proFormaHide">{l s='Download' mod='proforma'} </span>
            </a>
          </td>
        </tr>
      {/foreach}
      </tbody>
    </table>
    <div id="block-order-detail" class="hidden">&nbsp;</div>
  {else}
    <p class="warning">{l s='You have no quotation' mod='proforma'}</p>
  {/if}
{/block}
