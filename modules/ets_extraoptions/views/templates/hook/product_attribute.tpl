{*
 * Copyright ETS Software Technology Co., Ltd
 *
 * NOTICE OF LICENSE
 *
 * This file is not open source! Each license that you purchased is only available for 1 website only.
 * If you want to use this file on more websites (or projects), you need to purchase additional licenses.
 * You are not allowed to redistribute, resell, lease, license, sub-license or offer our resources to any third party.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future.
 *
 * @author ETS Software Technology Co., Ltd
 * @copyright  ETS Software Technology Co., Ltd
 * @license    Valid for 1 website (or project) for each purchase of license
*}
{if $ETS_ETO_CHECKBOX_BACKGROUD_COLOR}
  <style>
    {literal}
    input[type="checkbox"]:checked + .ets_input_check,
    input[type="radio"]:checked + .ets_input_radio {
      background: {/literal}{$ETS_ETO_CHECKBOX_BACKGROUD_COLOR|escape:'html':'UTF-8'}{literal} none repeat scroll 0 0;
      border-color: {/literal}{$ETS_ETO_CHECKBOX_BACKGROUD_COLOR|escape:'html':'UTF-8'}{literal};
    }

    {/literal}
  </style>
{/if}
{if $attribute_groups}
  <div>
    <div class="block-product-attribute-custom">
      <div class="col-md-12">
        <div class="form-group">
          <h2 class="h4 mb-4">
            {$attribute_title|escape:'html':'UTF-8'}
            {if Count($attribute_groups) ==1 && isset($attribute_groups[0]['required']) && $attribute_groups[0]['required']}
              <span class="required"></span>
            {/if}
          </h2>
        </div>
        <div class="list-attribute-custom">
          {foreach from=$attribute_groups item='group'}
            {if $group.attributes}
              <div class="from-group-option{if $group.required} required{/if}">
                {if $group.id_ets_eto_attr_group || Count($attribute_groups)>1}
                  <h3 class="h5">{$group.name|escape:'html':'UTF-8'} {if $group.required}
                      <span class="required"></span>
                    {/if}</h3>
                {/if}
                {if $group.type_option=='radio'}
                  {foreach from=$group.attributes item='attribute'}
                    <div class="radio my-3">
                      <label id="custom-attribute-{$attribute.id_ets_eto_attr|intval}" class="control-label fs-6 d-flex align-items-center">
                        <div class="ets_input_group">
                          <input id="custom-attribute-{$attribute.id_ets_eto_attr|intval}"
                                 name="ets-ca-custom-attribute[{$group.id_ets_eto_attr_group|intval}]"
                                 data-price="{$attribute.price|escape:'html':'UTF-8'}"
                                 value="{$attribute.id_ets_eto_attr|intval}"
                                 type="radio"{if $attribute.checked} checked="checked"{/if} />
                          <div class="ets_input_radio" data-before="✔">
                            <svg width="14" height="14" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                              <path
                                d="M1671 566q0 40-28 68l-724 724-136 136q-28 28-68 28t-68-28l-136-136-362-362q-28-28-28-68t28-68l136-136q28-28 68-28t68 28l294 295 656-657q28-28 68-28t68 28l136 136q28 28 28 68z"/>
                            </svg>
                          </div>
                        </div>

                        <span class="d-flex gap-2">
                          {if $attribute.image}<img class="border" src="{$attribute.image|escape:'html':'UTF-8'}"
                                                    style="height: 80px; width: 80px;" /> {/if}{$attribute.name|escape:'html':'UTF-8'}
                        <span class="product-discount d-inline-flex text-primary">
                                                    (
                                                    {if isset($attribute.price_without_reduction) && $attribute.price_without_reduction}
                                                      <span
                                                        class="regular-price">{$attribute.price_without_reduction|escape:'html':'UTF-8'}</span>
                                                    {/if}
                                                    <div class="product-price has-discount">
                                                        <div class="current-price">
                                                            <span>{$attribute.price_text|escape:'html':'UTF-8'}</span>
                                                        </div>
                                                        {if isset($attribute.reduction) && $attribute.reduction}<span
                                                          class="discount discount-percentage">{l s='Save' mod='ets_extraoptions'} {$attribute.reduction|escape:'html':'UTF-8'}
                                                          %</span> {/if}
                                                    </div>
                                                    )
                                                </span>
                        </span>

                      </label>
                      {if $attribute.description}
                        <span class="desc d-none">
                                                    <svg width="1792" height="1792" viewBox="0 0 1792 1792"
                                                         xmlns="http://www.w3.org/2000/svg"><path
                                                        d="M1024 1376v-192q0-14-9-23t-23-9h-192q-14 0-23 9t-9 23v192q0 14 9 23t23 9h192q14 0 23-9t9-23zm256-672q0-88-55.5-163t-138.5-116-170-41q-243 0-371 213-15 24 8 42l132 100q7 6 19 6 16 0 25-12 53-68 86-92 34-24 86-24 48 0 85.5 26t37.5 59q0 38-20 61t-68 45q-63 28-115.5 86.5t-52.5 125.5v36q0 14 9 23t23 9h192q14 0 23-9t9-23q0-19 21.5-49.5t54.5-49.5q32-18 49-28.5t46-35 44.5-48 28-60.5 12.5-81zm384 192q0 209-103 385.5t-279.5 279.5-385.5 103-385.5-103-279.5-279.5-103-385.5 103-385.5 279.5-279.5 385.5-103 385.5 103 279.5 279.5 103 385.5z"/></svg>
                                                    <span class="content">{$attribute.description|nl2br nofilter}</span>
                                                </span>
                      {/if}
                    </div>
                  {/foreach}
                {elseif $group.type_option=='select'}
                  <select name="ets-ca-custom-attribute[{$group.id_ets_eto_attr_group|intval}]"
                          class="form-control form-control-selectp">
                    <option data-price="0" value="0">{l s='-- Select an item --' mod='ets_extraoptions'}</option>
                    {foreach from=$group.attributes item='attribute'}
                      <option data-price="{$attribute.price|escape:'html':'UTF-8'}"
                              value="{$attribute.id_ets_eto_attr|intval}"
                              type="radio"{if $attribute.checked} selected="selected"{/if}>
                        {$attribute.name|escape:'html':'UTF-8'} ({$attribute.price_text|escape:'html':'UTF-8'})
                      </option>
                    {/foreach}
                  </select>
                {else}
                  {foreach from=$group.attributes item='attribute'}
                    <div class="checkbox{if $attribute.required} required{/if} my-3">
                      <label id="custom-attribute-{$attribute.id_ets_eto_attr|intval}" class="control-label fs-6 d-flex align-items-center">
                        <div class="ets_input_group">
                          <input id="custom-attribute-{$attribute.id_ets_eto_attr|intval}"
                                 name="ets-ca-custom-attribute[{$group.id_ets_eto_attr_group|intval}][]"
                                 data-price="{$attribute.price|escape:'html':'UTF-8'}"
                                 value="{$attribute.id_ets_eto_attr|intval}"
                                 type="checkbox"{if $attribute.checked} checked="checked"{/if} />
                          <div class="ets_input_check" data-before="✔">
                            <svg width="14" height="14" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                              <path
                                d="M1671 566q0 40-28 68l-724 724-136 136q-28 28-68 28t-68-28l-136-136-362-362q-28-28-28-68t28-68l136-136q28-28 68-28t68 28l294 295 656-657q28-28 68-28t68 28l136 136q28 28 28 68z"/>
                            </svg>
                          </div>
                        </div>
                        <span class="d-flex gap-2">
                          {if $attribute.required}<span class="required"></span>{/if}
                          {if $attribute.image}<img class="border" src="{$attribute.image|escape:'html':'UTF-8'}"
                                                    style="height: 80px; width: 80px;"/> {/if}
                          {$attribute.name|escape:'html':'UTF-8'}
                          <span class="product-discount d-inline-flex text-primary">
                                                    (
                                                    {if isset($attribute.price_without_reduction) && $attribute.price_without_reduction}
                                                      <span
                                                        class="regular-price">{$attribute.price_without_reduction|escape:'html':'UTF-8'}</span>
                                                    {/if}
                                                    <div class="product-price has-discount">
                                                        <div class="current-price">
                                                            <span>{$attribute.price_text|escape:'html':'UTF-8'}</span>
                                                        </div>
                                                        {if isset($attribute.reduction) && $attribute.reduction}<span
                                                          class="discount discount-percentage">{l s='Save' mod='ets_extraoptions'} {$attribute.reduction|escape:'html':'UTF-8'}
                                                          %</span> {/if}
                                                    </div>
                                                    )
                                                </span>
                        </span>



                      </label>
                      {if $attribute.description}
                        <span class="desc d-none">
                                                    <svg width="1792" height="1792" viewBox="0 0 1792 1792"
                                                         xmlns="http://www.w3.org/2000/svg"><path
                                                        d="M1024 1376v-192q0-14-9-23t-23-9h-192q-14 0-23 9t-9 23v192q0 14 9 23t23 9h192q14 0 23-9t9-23zm256-672q0-88-55.5-163t-138.5-116-170-41q-243 0-371 213-15 24 8 42l132 100q7 6 19 6 16 0 25-12 53-68 86-92 34-24 86-24 48 0 85.5 26t37.5 59q0 38-20 61t-68 45q-63 28-115.5 86.5t-52.5 125.5v36q0 14 9 23t23 9h192q14 0 23-9t9-23q0-19 21.5-49.5t54.5-49.5q32-18 49-28.5t46-35 44.5-48 28-60.5 12.5-81zm384 192q0 209-103 385.5t-279.5 279.5-385.5 103-385.5-103-279.5-279.5-103-385.5 103-385.5 279.5-279.5 385.5-103 385.5 103 279.5 279.5 103 385.5z"/></svg>
                                                    <span class="content">{$attribute.description|nl2br nofilter}</span>
                                                </span>
                      {/if}
                    </div>
                  {/foreach}
                {/if}
              </div>
            {/if}
          {/foreach}
          {if $ETS_ETO_NOTIFICATION}
            <p class="ets_notification_ex">{$ETS_ETO_NOTIFICATION|escape:'html':'UTF-8'}</p>
          {/if}
        </div>
        <div class="attribute-custom-price">{$attribute_total_title|escape:'html':'UTF-8'}: <span class="price"></span>
        </div>
      </div>
    </div>
  </div>
{/if}
