{if $years}
    <div class="block ets_block_archive {$ETS_BLOG_RTL_CLASS|escape:'html':'UTF-8'}">
        <h2 class="title_blog title_block">
            {l s='Archives' mod='ets_blog'}
        </h2>
        <div class="content_block block_content">
            <ul class="list-year row">
                {foreach from=$years item='year'}
                    <li class="year-item">
                        <a href="{$year.link|escape:'html':'UTF-8'}">{l s='Posté en ' mod='ets_blog'}{$year.year_add|escape:'html':'UTF-8'} ({$year.total_post|intval})</a>
                        {*<span class="ets_axpand_button close closed"></span>*}
                        {if $year.months}
                            <ul class="list-months">{*hidden*}
                                {foreach from=$year.months item='month'}
                                    <li class="month-item"><a href="{$month.link|escape:'html':'UTF-8'}">{$month.month_add|escape:'html':'UTF-8'} ({$month.total_post|intval})</a></li>
                                {/foreach}
                            </ul>
                        {/if}
                    </li>
                {/foreach}
            </ul>
        </div>
    </div> 
{/if}