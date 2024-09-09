{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}

 {extends file=$layout}

 {block name='content'}
   <div>
     {block name='page_header_container'}
       {block name='page_title'}
         <div class="page-header mt-3">
           <h1>{$smarty.block.child}</h1>
         </div>
       {/block}
 
       {block name='account_link'}
         <a id="backToAccountBtn" class="btn btn-white d-md-none mb-3" href="{$urls.pages.my_account}">{l s='Back to your account' d='Shop.Theme.Customeraccount'}</a>
       {/block}
     {/block}
 
     {block name='page_content_container'}
       <section id="content" class="page-content page-customer">
         {block name='page_content_top'}{/block}
 
         {block name='page_content'}<!-- Page content -->{/block}
       </section>
     {/block}
 
     {block name='javascript_backtoaccountbtn'}
       <script type="text/javascript">
         document.addEventListener('DOMContentLoaded', () => {
           const myAccountUrl = "/mon-compte";
           const { pathname } = window.location;
           const backToAccountBtn = document.getElementById('backToAccountBtn');
 
           if (backToAccountBtn && pathname === myAccountUrl) {
             backToAccountBtn.classList.add('hidden');
             backToAccountBtn.setAttribute('aria-hidden', 'true');
           }
         });
       </script>
     {/block}
   </div>
 {/block}
 