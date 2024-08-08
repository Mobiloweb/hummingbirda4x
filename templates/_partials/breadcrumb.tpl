{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
 {$componentName = 'breadcrumb'}

<nav data-depth="{$breadcrumb.count}" class="{$componentName}__wrapper mb-0 bg-light" aria-label="{$componentName}">
  <div class="container-fluid">
    <ol class="{$componentName} fs-6">
      {block name='breadcrumb'}
        {foreach from=$breadcrumb.links item=path name=breadcrumb}
          {block name='breadcrumb_item'}
            <li class="{$componentName}-item">
              {if not $smarty.foreach.breadcrumb.last}
                <a href="{$path.url}" class="{$componentName}-link"><span>{$path.title}</span></a>
              {else}
                <span>{$path.title}</span>
              {/if}
            </li>
          {/block}
        {/foreach}
      {/block}
    </ol>
  </div>
</nav>
