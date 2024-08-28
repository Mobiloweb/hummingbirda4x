{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{extends file='catalog/listing/product-list.tpl'}

{block name="header" append}
  {widget name="pm_advancedsearch4" id_search_engine="2"}
{/block}

{block name='product_list_header'}
  {include file='components/page-title-section.tpl' title={$category.name nofilter}}
{/block}

{block name='product_list_footer'}
  {include file='catalog/_partials/category-footer.tpl' listing=$listing category=$category}
{/block}
