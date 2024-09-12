<div class="block ets_block_search {$ETS_BLOG_RTL_CLASS|escape:'html':'UTF-8'}">
    <h2 class="title_blog title_block">{l s='Rechercher dans le blog' mod='ets_blog'}</h2>
    <div class="content_block block_content">
        <form action="{$action|escape:'html':'UTF-8'}" method="post">
            <input class="form-control" type="text" name="ets_blog_search" placeholder="{l s='Rechercher...' mod='ets_blog'}" value="{$search|escape:'html':'UTF-8'}" />
            <input class="button" type="submit" value="{l s='Search' mod='ets_blog'}" />
            <span class="icon_search"></span>
        </form>
    </div>
</div>
