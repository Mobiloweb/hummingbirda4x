{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
<div id="js-product-list-header">
    {if $listing.pagination.items_shown_from == 1}
        <div class="block-category d-flex flex-column flex-md-row align-items-center">
            {if isset($category.image) && isset($category.image.bySize.default_md.sources.webp)}
              <div class="category-cover mb-4 d-none d-md-block col-md-4">
                <img src="{$category.image.bySize.default_md.sources.webp}"
                     alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}"
                     fetchpriority="high"
                     class="img-fluid"
                     width="{$category.image.bySize.default_md.width}"
                     height="{$category.image.bySize.default_md.height}">
              </div>
            {/if}

            {if $category.description}
              <div id="category-description" class="rich-text mb-4">{$category.description nofilter}</div>
            {/if}
        </div>
    {/if}

    {if isset($subcategories) && $subcategories|@count> 0}
      {include file='catalog/_partials/subcategories.tpl' subcategories=$subcategories}
    {/if}
</div>
