<section id="content" class="page-content page-not-found">
  {block name='page_content'}
    {block name='error_content'}
      {$errorContent nofilter}
    {/block}

    {block name='hook_not_found'}
      {hook h='displayNotFound'}
    {/block}
  {/block}
</section>