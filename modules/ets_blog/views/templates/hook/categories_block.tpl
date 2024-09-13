{if $blockCategTree}
    {if isset($link_view_all)}
    <div class="block ets_block_categories {$ETS_BLOG_RTL_CLASS|escape:'html':'UTF-8'}">
        <h2 class="title_blog title_block">{l s='Catégories' mod='ets_blog'}</h2>    
        <div class="content_block block_content">
    {/if}
            <ul class="tree">
                {foreach from=$blockCategTree[0].children item=child name=blockCategTree}
        			{if $smarty.foreach.blockCategTree.last}
        				{include file="$branche_tpl_path" node=$child last='true'}
        			{else}
        				{include file="$branche_tpl_path" node=$child}
        			{/if}
        		{/foreach}
            </ul>
    {if isset($link_view_all)}
            <div class="blog_view_all_button">
                <a class="blog_view_all" href="{$link_view_all|escape:'html':'UTF-8'}">{l s='View all categories' mod='ets_blog'}</a>
            </div>
        </div>    
    </div>
    {/if}
{/if}