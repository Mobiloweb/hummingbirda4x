{extends file='layouts/layout-both-columns.tpl'}

{block name="content_columns"}
  <div class="{block name="container_class"}container-fluid{/block}">
    <div class="row">
      {block name="left_column"}
        <div id="left-column" class="wrapper__left-column col-md-4 col-xl-3">
          {if $page.page_name == 'product'}
            {hook h='displayLeftColumnProduct'}
          {else}
            {hook h='displayLeftColumn'}
          {/if}
        </div>
      {/block}

      {block name="content_wrapper"}
        <div id="content-wrapper" class="wrapper__content col-md-8 col-xl-9">
          {hook h='displayContentWrapperTop'}
          {block name="content"}
            <p>Hello world! This is HTML5 Boilerplate.</p>
          {/block}
          {hook h='displayContentWrapperBottom'}
        </div>
      {/block}

      {block name='right_column'}{/block}
    </div>
  </div>
{/block}
