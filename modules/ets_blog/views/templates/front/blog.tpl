{extends file="page.tpl"}
{block name="content"}
    <h1 class="blog-title">Le blog spécialisé accessoires pour SUV, 4x4 et utilitaires !</h1>
    <div id="left-column">
        <div class="ets_blog_sidebar">
            {$blog_left_sidebar nofilter}
        </div>
        <div id="content-wrapper">
            {$blog_content nofilter}
        </div>
    </div>
{/block}