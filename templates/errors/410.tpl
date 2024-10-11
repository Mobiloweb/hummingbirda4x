{extends file='page.tpl'}

{block name='breadcrumb'}{/block}

{block name='container_class'}container container--limited-md text-center{/block}

{capture assign="errorContent"}
  <h1 class="dyn-title mb-4">Erreur 410 - Page supprimée</h1>
  <p>Désolé, la page que vous recherchez a été définitivement supprimée.</p>
  <p><a href="/" class="btn btn-primary" aria-label="Bouton de retour vers la page d'accueil" title="Revenir sur notre page d'accueil">Retour à l'accueil</a></p>
{/capture}

{block name='page_content_container'}
  {include file='errors/not-found.tpl' errorContent=$errorContent}
{/block}