{**
 * templates/article/footer.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article View -- Footer component.
 *}

{if $sharingEnabled}
<!-- start AddThis -->

            <!-- Go to www.addthis.com/dashboard to customize your tools --> <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5b1b8c88d8801350"></script> 

<!-- end AddThis -->
{/if}

</div><!-- content -->
</div><!-- main -->
</div><!-- body -->

{strip}
{if $currentJournal && $currentJournal->getSetting('onlineIssn')}
    {assign var=issn value=$currentJournal->getSetting('onlineIssn')}
{elseif $currentJournal && $currentJournal->getSetting('printIssn')}
    {assign var=issn value=$currentJournal->getSetting('printIssn')}
{/if}

{if $displayCreativeCommons}
    {translate key="common.ccLicense"}
{/if}
<footer>
<div id="footer">

<!--{if $currentJournal->getLocalizedTitle()}    
<div id="c-journal-footer">
    <div id="c-journal-footer__inner" class="row rew">
        <div id="c-journal-footer__summary">
            <div id="c-journal-footer-logo">    
            <h4 class="c-journal-footer__title-text">{$currentJournal->getLocalizedTitle()|strip_tags|escape}</h4>
            {if $issn}
            <p class="c-journal-footer__issn">ISSN: {$issn}</p>
            {/if}
            </div></div>
        <div id="c-journal-footer__contact">
            <h7 class="c-journal-footer__contact-title">Contact us</h7>
            <ul class="c-journal-footer__contact-list" style="list-style:none;padding-left:0">
                <li class="c-journal-footer__contact-item">Submission enquiries: <a href="{url page="login"}" target="_blank">Access here and click Contact Us</a></li>
                <li class="c-journal-footer__contact-item">General enquiries: <a href="mailto:admin@stipwunaraha.ac.id">admin@stipwunaraha.ac.id</a></li>
                </ul>
            </div>
        </div>
    </div>
{/if}-->

<div class="section">
<div id="ctx-publisher-footer">
    <div id="c-publisher-footer" class="row rewel">
        <div class="u-container">
            <div class="c-flex c-flex--wrap c-flex--space-between">
                <div class="c-flex" aria-label="Publisher footer links">
                    <ul class="c-list-group c-list-group--sm u-margin-right-lg u-margin-bottom-md">
                        <li class="c-list-group__item">
                            <a class="u-text-inherit" href="https://scofci.stipwunaraha.ac.id/">Read more on blogs</a>
                            </li>
                        <li class="c-list-group__item">
                            <a class="u-text-inherit" href="/index.php/ISLE/pages/view/Indexing">Abtracting & Indexing</a>
                            </li>
                        <li class="c-list-group__item">
                            <a class="u-text-inherit" href="/index.php/ISLE/pages/view/Editorial%20Process">Editorial Process</a>
                            </li>
                        <li class="c-list-group__item">
                            <a class="u-text-inherit" href="/index.php/ISLE/pages/view/Author%28s%29%20Fees">Author(s) Fees</a>
                            </li>
                    </ul>
                    <ul class="c-list-group c-list-group--sm u-margin-right-lg u-margin-bottom-md">
                        <li class="c-list-group__item">
                            <a class="u-text-inherit" href="/index.php/ISLE/pages/view/Guide%20for%20Registration">Registration Guide</a>
                            </li>
                        <li class="c-list-group__item">
                            <a class="u-text-inherit" href="/index.php/ISLE/pages/view/Publication%20Ethics">Publication Ethics</a>
                            </li>
                        <li class="c-list-group__item">
                            <a class="u-text-inherit" href="/index.php/ISLE/about/editorialPolicies#custom-0">Plagiarisme Check</a>
                            </li>
                        <li class="c-list-group__item">
                            <a class="u-text-inherit" href="/index.php/ISLE/pages/view/Authorship%20Guidelines">Authorship Guidelines</a>
                            </li>
                    </ul>
                    <ul class="c-list-group c-list-group--sm u-margin-right-lg u-margin-bottom-md">
                        <li class="c-list-group__item">
                            <a class="u-text-inherit" href="/index.php/ISLE/pages/view/Contact">Contact us</a>
                            </li>
                        <li class="c-list-group__item">
                            <a class="u-text-inherit" href="https://scholar.google.co.id/citations?user=sxSxyCQAAAAJ&hl=id&authuser=6">Google Scholar</a>
                            </li>
                        <li class="c-list-group__item">
                            <a class="u-text-inherit" href="/index.php/ISLE/pages/view/faq">FAQ</a>
                            </li>    
                    </ul>
                </div>
            </div>
            <div class="u-margin-bottom-lg">
                <h7 id="social-menu" class="u-text-sm u-reset-margin u-text-normal">Follow COSIRE</h7>
                <ul class="c-flex u-reset-list" data-test="footer-social-links" style="list-style:none;padding-left:0">
                    <li class="u-margin-top-xs u-margin-right-xs">
                        <a href="https://twitter.com/SRMKen" class="u-text-inherit" data-track="click" data-track-action="Click Twitter link" data-track-category="Publisher footer" target="_blank">
                            <span class="u-visually-hidden">COSIRE Twitter page</span>
                            <svg class="c-icon" width="24" height="24" aria-hidden="true"><use xlink:href="#icon-twitter-bordered"><symbol id="icon-twitter-bordered" viewBox="463.812 263.868 32 32"><path d="M486.416 276.191a5.622 5.622 0 0 1-1.554.429 2.718 2.718 0 0 0 1.19-1.502 5.456 5.456 0 0 1-1.72.657 2.71 2.71 0 0 0-1.979-.854 2.711 2.711 0 0 0-2.642 3.326 7.681 7.681 0 0 1-5.586-2.831 2.714 2.714 0 0 0 .839 3.618 2.748 2.748 0 0 1-1.227-.339v.031a2.71 2.71 0 0 0 2.174 2.656 2.735 2.735 0 0 1-1.229.049 2.726 2.726 0 0 0 2.531 1.883 5.442 5.442 0 0 1-4.01 1.123 7.672 7.672 0 0 0 4.155 1.215c4.983 0 7.71-4.129 7.71-7.711 0-.115-.004-.232-.006-.351a5.41 5.41 0 0 0 1.354-1.399z"></path><path d="M479.812 263.868c-8.837 0-16 7.163-16 16s7.163 16 16 16 16-7.163 16-16-7.163-16-16-16zm0 30c-7.732 0-14-6.269-14-14s6.268-14 14-14 14 6.269 14 14-6.267 14-14 14z"></path></symbol></use>
                                </svg></a>
                        </li>
                    <li class="u-margin-top-xs u-margin-right-xs">
                        <a href="https://web.facebook.com/akuatikisle" class="u-text-inherit" data-track="click" data-track-action="Click Facebook link" data-track-category="Publisher footer" target="_blank">
                            <span class="u-visually-hidden">COSIRE Facebook page</span>
                            <svg class="c-icon" width="24" height="24" aria-hidden="true"><use xlink:href="#icon-facebook-bordered"><symbol id="icon-facebook-bordered" viewBox="463.812 263.868 32 32"><path d="M479.812 263.868c-8.837 0-16 7.163-16 16s7.163 16 16 16 16-7.163 16-16-7.163-16-16-16zm0 30c-7.732 0-14-6.269-14-14s6.268-14 14-14 14 6.269 14 14-6.267 14-14 14z"></path><path d="M483.025 280.48l.32-2.477h-2.453v-1.582c0-.715.199-1.207 1.227-1.207h1.311v-2.213a17.753 17.753 0 0 0-1.907-.098c-1.894 0-3.186 1.154-3.186 3.271V278h-2.142v2.477h2.142v6.354h2.557v-6.354l2.131.003z"></path></symbol></use>
                                </svg></a>
                        </li>
                    <li class="u-margin-top-xs u-margin-right-xs">
                        <a href="https://plus.google.com/118311605258011949503" class="u-text-inherit" data-track="click" data-track-action="Click Google Plus link" data-track-category="Publisher footer" target="_blank">
                            <span class="u-visually-hidden">COSIRE Google Plus page</span>
                            <svg class="c-icon" width="24" height="24" aria-hidden="true"><use xlink:href="#icon-gplus-bordered"><symbol id="icon-gplus-bordered" viewBox="463.812 263.868 32 32"><path d="M479.812 263.868c-8.838 0-16 7.163-16 16s7.162 16 16 16c8.837 0 16-7.163 16-16s-7.163-16-16-16zm0 30c-7.732 0-14-6.269-14-14s6.268-14 14-14c7.731 0 14 6.269 14 14s-6.267 14-14 14z"></path><path d="M480.5 273.117c.123.076.26.185.416.334.146.152.289.343.432.562.135.211.258.459.359.746.086.286.129.619.129 1.004-.012.7-.164 1.262-.465 1.683a5.374 5.374 0 0 1-.461.562c-.186.176-.375.35-.58.527a2.65 2.65 0 0 0-.322.41.908.908 0 0 0-.176.553c0 .205.059.375.18.508.102.129.199.238.299.336l.662.545a6.48 6.48 0 0 1 1.086 1.119c.293.415.445.955.459 1.625 0 .949-.42 1.789-1.256 2.521-.869.76-2.123 1.15-3.762 1.177-1.373-.015-2.4-.308-3.074-.879-.682-.534-1.023-1.172-1.023-1.917 0-.359.111-.766.336-1.211.215-.443.602-.837 1.172-1.174a6.126 6.126 0 0 1 1.998-.725 15.415 15.415 0 0 1 1.723-.173 3.996 3.996 0 0 1-.377-.596 1.347 1.347 0 0 1-.193-.74c0-.174.023-.317.074-.433a8.83 8.83 0 0 1 .121-.338 5.973 5.973 0 0 1-.633.035c-1.043-.012-1.838-.339-2.381-.979-.574-.603-.861-1.3-.861-2.097 0-.961.404-1.832 1.217-2.616.559-.46 1.135-.757 1.736-.898a8.494 8.494 0 0 1 1.67-.182h3.916l-1.209.704h-1.207v.005l-.005.002zm.754 11.276c0-.498-.162-.932-.484-1.302-.346-.348-.881-.778-1.609-1.29a4.045 4.045 0 0 0-.439-.02c-.102-.016-.354 0-.768.039a8.141 8.141 0 0 0-1.244.275c-.1.036-.24.096-.42.17a2.713 2.713 0 0 0-.553.355 1.985 1.985 0 0 0-.459.592c-.145.25-.215.551-.215.901 0 .687.311 1.253.932 1.698.596.444 1.404.68 2.432.688.928-.014 1.629-.217 2.117-.612.476-.385.71-.886.71-1.494zm-2.729-5.743a1.843 1.843 0 0 0 1.289-.556c.164-.249.271-.506.318-.767a7.32 7.32 0 0 0 .041-.659c0-.772-.195-1.552-.594-2.336a2.611 2.611 0 0 0-.73-.921 1.894 1.894 0 0 0-1.064-.352 1.723 1.723 0 0 0-1.324.64c-.299.437-.438.92-.428 1.457 0 .709.209 1.444.623 2.211.201.356.459.659.775.912.323.248.686.371 1.094.371zm9.698.077h-2.055v-2.056h-.996v2.056h-2.053v.998h2.053v2.052h.996v-2.052h2.055z"></path></symbol></use>
                                </svg></a>
                        </li>
                    <li class="u-margin-top-xs u-margin-right-xs">
                        <a href="https://www.instagram.com/akuatikisle" class="u-text-inherit" data-track="click" data-track-action="Click Instagram link" data-track-category="Publisher footer" target="_blank">
                            <span class="u-visually-hidden">COSIRE Instagram</span> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 2c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm4.615 6h-9.23c-.766 0-1.385.62-1.385 1.384v9.23c0 .766.619 1.386 1.385 1.386h9.23c.766 0 1.385-.62 1.385-1.385v-9.23c0-.765-.619-1.385-1.385-1.385zm-4.615 3.693c1.274 0 2.309 1.032 2.309 2.307s-1.035 2.307-2.309 2.307-2.307-1.033-2.307-2.307 1.033-2.307 2.307-2.307zm4.5 6.346c0 .255-.207.461-.461.461h-8.078c-.254 0-.461-.207-.461-.461v-5.039h.949c-.045.158-.078.32-.102.486-.023.168-.038.339-.038.514 0 2.04 1.652 3.693 3.691 3.693s3.691-1.653 3.691-3.693c0-.174-.015-.346-.039-.514-.023-.166-.058-.328-.102-.486h.95v5.039zm0-6.991c0 .255-.207.462-.461.462h-1.088c-.256 0-.461-.208-.461-.462v-1.087c0-.255.205-.461.461-.461h1.088c.254 0 .461.207.461.461v1.087z"/></svg></a>
                        </li>
                </ul>
            </div>
            <p id="u-reset-margin" class="u-reset-margin">By using this website, you agree to our <a class="u-text-inherit" href="/index.php/ISLE/pages/view/Terms%20and%20Conditions">Terms and Conditions</a>, <a class="u-text-inherit" href="/index.php/ISLE/pages/view/Privacy%20Statement">Privacy statement</a> and <a class="u-text-inherit" href="/index.php/ISLE/pages/view/Cookies">Cookies</a> policy. <span class="footer-section">{$pageFooter}</span></p>         
        </div>
    </div>
</div>
</div>

{call_hook name="Templates::Common::Footer::PageFooter"}

<div id="pageFooter">
    <div id="standardFooter" class="row rew">
        <div class="legal" role="contentinfo">
            <div class="parent_logo">
                <img src="//www.media.stipwunaraha.ac.id/static/SRM_logo_dark.svg" alt="Sangia Group Logo" width="auto" height="17px">
            </div>
            <span>Copyright © 2019 <a href="http://www.stipwunaraha.ac.id">Stipwunaraha Research Media</a> unless otherwise stated. Part of <a href="http://www.sangia.org">Sangia Group</a>.</span>
            <p id="diagnostic-info" class="footer-section" style="display: none;">
                <span id="diagnostic-login-status">Not logged in</span>
                <span class="diagnostic-business-partners">Unaffiliated</span>
                <span id="diagnostic-ip">114.125.164.64</span>
            </p>   
        </div>            
    </div>
</div>

<script type="text/javascript" src="{$baseUrl}/plugins/themes/eserem-classical/js/menu.js"></script>
<script type='text/javascript' src='https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js'></script>
{/strip}

<script type="text/javascript">
{literal}
  window.twttr = (function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0],
    t = window.twttr || {};
  if (d.getElementById(id)) return t;
  js = d.createElement(s);
  js.id = id;
  js.src = "https://platform.twitter.com/widgets.js";
  fjs.parentNode.insertBefore(js, fjs);
 
  t._e = [];
  t.ready = function(f) {
    t._e.push(f);
  };
 
  return t;
}(document, "script", "twitter-wjs"));
 {/literal}
</script>

{if $defineTermsContextId}
<script type="text/javascript">
{literal}
<!--
    // Open "Define Terms" context when double-clicking any text
    function openSearchTermWindow(url) {
        var term;
        if (window.getSelection) {
            term = window.getSelection();
        } else if (document.getSelection) {
            term = document.getSelection();
        } else if(document.selection && document.selection.createRange && document.selection.type.toLowerCase() == 'text') {
            var range = document.selection.createRange();
            term = range.text;
        }
        if (term != ""){
            if (url.indexOf('?') > -1) openRTWindowWithToolbar(url + '&defineTerm=' + term);
            else openRTWindowWithToolbar(url + '?defineTerm=' + term);
        }
    }

    if(document.captureEvents) {
        document.captureEvents(Event.DBLCLICK);
    }

    // Make sure to only open the reading tools when double clicking within the galley  
    if (document.getElementById('inlinePdfResizer')) {
        context = document.getElementById('inlinePdfResizer');  
    }
    else if (document.getElementById('content')) {
        context = document.getElementById('content');   
    }
    else {
        context = document;
    }

    context.ondblclick = new Function("openSearchTermWindow('{/literal}{url page="rt" op="context" path=$articleId|to_array:$galleyId:$defineTermsContextId escape=false}{literal}')");
// -->
{/literal}
</script>
{/if}

{get_debug_info}
{if $enableDebugStats}{include file=$pqpTemplate}{/if}

</div> <!-- container -->
</div>
</footer>
</body>
</html>
