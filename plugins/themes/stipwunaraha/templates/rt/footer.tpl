{**
 * templates/rt/footer.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common footer for RT pages.
 *
 *}
<br />

{if !$omitCloseButton}
<input type="button" onclick="window.close()" value="{translate key="common.close"}" class="button defaultButton" />
{/if}

{call_hook name="Templates::Rt::Footer::PageFooter"}
</div>


</div><!-- body -->
</div><!-- container -->
</div>

<footer>
<div id="footer">

{strip}

<div id="footer-nav" class="section row">
<div id="footer-nav-misc">
    <div class="large-2 medium-4 columns" role="navigation">
        <h6>Explore SRM</h6>
        <ul >
            <li ><a href="https://blogs.stipwunaraha.ac.id/">Read more on blogs</a></li>
            <li ><a href="/index.php/ISLE/pages/view/Authorship%20Guidelines">Guide for Author</a></li>
            <li ><a title="Browse Journals" href="{$baseUrl}" target="_blank">View Journals</a></li>
            <li ><a title="View Journal by Subject" href="{$baseUrl}/index.php/index/search/categories" target="_blank">Journals Subjects</a></li>
            <li ><a title="View All Articles" href="{$baseUrl}/index.php/index/search/titles" target="_blank">All Articles</a></li>
            <li ><a title="View Authors Index" href="{$baseUrl}/index.php/index/search/authors" target="_blank">Authors Index</a></li>
            {if $currentJournal->getLocalizedSetting('privacyStatement') != ''}
            <li ><a href="{url page="about" anchor="privacyStatement"}">{translate key="about.privacyStatement"}</a></li>{/if}
        </ul>
    </div>            
 
    <div class="large-2 medium-4 columns" role="navigation">
        <h6>Information</h6>
        <ul >
            <li class=" "><a href="{url page="information" op="authors"}">{translate key="navigation.infoForAuthors"}</a></li>
            <li ><a href="/index.php/ISLE/pages/view/Guide%20for%20Registration">Registration Guide</a></li>
            <li ><a href="/index.php/ISLE/pages/view/Publication%20Ethics">Publication Ethics</a></li>
            <li ><a href="/index.php/ISLE/about/editorialPolicies#custom-0">Plagiarisme Check</a></li>
            <li class=" "><a href="{url page="information" op="readers"}">{translate key="navigation.infoForReaders"}</a></li>
            <li class=" "><a href="{url page="information" op="librarians"}">{translate key="navigation.infoForLibrarians"}</a></li>
            {if $currentJournal->getLocalizedSetting('copyrightNotice') != ''}
            <li ><a href="{url page="about" anchor="copyrightNotice"}">{translate key="about.copyrightNotice"}</a></li>{/if}
            {if $donationEnabled}<li ><a href="{url page="donations"}">{translate key="payment.type.donation"}</a></li>{/if}
        </ul>
    </div>

    <div class="large-2 medium-4 columns" role="navigation">
        <h6>Other sites and content</h6>
        <ul >
            <li ><a href="//www.science.sangia.org" target="_blank">Sciences Sangia</a></li>
            <li ><a href="//www.scofi.stipwunaraha.ac.id" target="_blank">SCOFCI Indonesia</a></li>
            <li ><a href="//scholar.google.co.id/citations?user=sxSxyCQAAAAJ&hl=id&authuser=6" target="_blank">Google Scholar</a></li>
            <li ><a href="{url page="about" op="contact"}">Contacts us</a></li>
            <li ><a href="/index.php/ISLE/pages/view/faq">FAQ</a></li>
        </ul>
    </div>


    <div class="large-4 medium-12 large-offset-2 columns" role="navi">
        <div class="about">
            <h3></h3>
            <p>Stipwunaraha Research Media publishes journals, monographs, and reference in print and online.</p>
            <p><a class="btn btn-link" href="//www.stipwunaraha.ac.id/gp/about-us">About Us</a></p>
        </div>
    </div>
    {call_hook name="Templates::Common::Footer::PageFooter"}
</div>
	
<div class="row">
    <div class="columns">
    <p id="u-reset-margin" class="u-reset-margin">By using this website, you agree to our <a class="u-text-inherit" href="/index.php/ISLE/pages/view/Terms%20and%20Conditions">Terms and Conditions</a>, <a href="{url page="about" anchor="privacyStatement"}">{translate key="about.privacyStatement"}</a> and <a class="u-text-inherit" href="/index.php/ISLE/pages/view/Cookies">Cookies</a> policy.</p></div>
</div>
</div>
</div>

<div id="footer-legal" class="row" role="contentinfo">
   <div class="large-12"> 
    <div class="legal" role="contentinfo">
    <span id="footer-copyright">
        <div class="parent_logo"><img src="//www.media.stipwunaraha.ac.id/static/SRM_logo_dark.svg" alt="Sangia Group Logo" width="auto" height="17px"></div>
        <span>© 2019 <a href="http://www.stipwunaraha.ac.id">Stipwunaraha Research Media</a> unless otherwise stated. Part of <a href="http://www.sangia.org">Sangia Group</a>.</span>
    </span>
    <div id="diagnostic-info"></div>
{/strip}
<script type="text/javascript" src="{$baseUrl}/plugins/themes/stipwunaraha/js/menu.js"></script>
    </div>
   </div>
</div>

{get_debug_info}
{if $enableDebugStats}{include file=$pqpTemplate}{/if}

</footer>
</div>
</body>
</html>
