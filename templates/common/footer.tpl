{**
 * templates/common/footer.tpl
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site footer.
 *
 *}
{strip}
{if $pageFooter==''}
	{if $currentJournal && $currentJournal->getSetting('onlineIssn')}
		{assign var=issn value=$currentJournal->getSetting('onlineIssn')}
	{elseif $currentJournal && $currentJournal->getSetting('printIssn')}
		{assign var=issn value=$currentJournal->getSetting('printIssn')}
	{/if}
	{if $issn}
		{translate|assign:"issnText" key="journal.issn"}
		{assign var=pageFooter value="$issnText: $issn"}
	{/if}
{/if}

</div>

</div>
{if $pageFooter}
	<div id="footer-grant" class="footer-grant">
		{$pageFooter}
	</div>
{/if}

</div>

<div id="footer" class="common">
	<div id="footer-wunaraha" class="wunaraha" role="navigation">
		<span class="strapline">We brings your life with scientific documents at your fingertips</span>
	</div>

	<div id="footer-info" class="wunaraha">
		<div id="footer-nav-misc">
			<div id="footer-our-content" class="block" role="navigation">
				<h2>Our Content</h2>
				<ul>
					<li><a title="View Journals" href="{$baseUrl}">Journals</a></li>
					<li><a title="View Journal by Subject" href="https://ejournal.stipwunaraha.ac.id/index.php/index/search/categories">Category</a></li>
					<li><a title="View All Articles" href="https://ejournal.stipwunaraha.ac.id/index.php/index/search/titles">Articles</a></li>
					<li><a title="View Authors Index" href="https://ejournal.stipwunaraha.ac.id/index.php/index/search/authors">Author Index</a></li>
				</ul>
			</div>
			<div id="footer-other-sites" class="block" role="navigation">
				<h2>Other Sites</h2>
				<ul>
					<li><a title="Visit Stipwunaraha.com" href="#">Stipwunaraha.com</a></li>
					<li><a title="Visit Stipwunaraha Blogs" href="http://www.blog.stipwunaraha.ac.id/">Stipwunaraha Blogs</a></li>
					<li><a title="Visit COSIRE Indonesia" href="http://www.blog.stipwunaraha.ac.id/">COSIRE Indonesia</a></li>
					<li><a title="Visit Stipwunaraha" href="#">Research Media</a></li>
				</ul>
			</div>
			<div class="block" role="navigation">
				<h2>Help &amp; Contacts</h2>
				<ul>
					<li><a class="legal-information-link" title="Legal information" href="/termsandconditions">Legal information</a></li>
					<li><a class="privacy-statement-link" title="Privacy statement" href="/privacystatement">Privacy statement</a></li>
					<li><a class="contact-us-link" title="Contact us" href="/contactus">Contact Us</a></li>
				</ul>
			</div>
		</div>
		<a id="secret-team-link" title="View Team Page" href="/static/team.html" rel="nofollow"></a>
	</div>

	<div id="footer-legal">

		<div id="legal" role="contentinfo">
			<a target="_blank" rel="noreferrer noopener" href="//www.stipwunaraha.ac.id">
				<img src="{$baseUrl}/public/site/images/cosire-foother.svg" alt="Stipwunara Research Media (SRM)" width="auto" height="32">
			</a>
			<span id="footer-copyright">© 2017 <a href="https://scofci.stipwunaraha.ac.id">Coastal and Isles Research Indonesia</a> unless otherwise stated. Part of <a target="_blank" rel="noreferrer noopener" href="//www.stipwunaraha.ac.id">Stipwunaraha Research Media</a>.</span>
		</div>
		
	</div>
	
	<div id="footer-branding">
		<img src="{$baseUrl}/public/site/images/cosire-foother.svg" alt="COSIRE Indonesia Logo" width="auto" height="33px">
	</div>
	
	<div id="cosire-footer" class="commone">
	    <div id="standardFooter">
	        <img src="{$baseUrl}/public/site/images/cosire-foother.svg" alt="COSIRE Indonesia Logo" width="auto" height="33px">
	        <p id="footer-copyright">© 2017 <a href="https://scofci.stipwunaraha.ac.id">Coastal and Isles Research Indonesia</a> unless otherwise stated. Part of <a href="https://stipwunaraha.ac.id">Stipwunaraha Research Media</a>.</p></a>
	   </div>
	</div>
	
	<div id="google-analytics-account" style="display: none;">UA-110581662-2</div>
	
</div>

{/strip}
