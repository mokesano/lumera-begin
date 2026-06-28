{**
 * templates/index/journal.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Journal index page.
 *
 *}
{strip}
{assign var="pageTitleTranslated" value=$siteTitle}
{include file="common/header-HOME.tpl"}
{/strip}

{if $currentJournal && $currentJournal->getSetting('onlineIssn')}
	{assign var=issn value=$currentJournal->getSetting('onlineIssn')}
{elseif $currentJournal && $currentJournal->getSetting('printIssn')}
	{assign var=issn value=$currentJournal->getSetting('printIssn')}
{/if}

{if $editors}
<div style="margin-bottom: 1em"><b>Editor-in-Chief:</b> <span>{$editor->getFullName()|escape}</span></div>{/if}
<!--<div style="margin-bottom: 1em"><b>Managing Editor:</b> <span>Anne Hoekman</span></div> -->

<div class="row">
	<div class="column medium-6">
		{if $printIssn} {else if $onlineIssn}
		<ul>
			{if $currentJournal->getSetting('printIssn')}
			<li style="list-style: none; margin-left: 0"><b>ISSN</b>: {$currentJournal->getSetting('printIssn')} (Print)</li>{/if}
			<li style="list-style: none; margin-left: 0"><b>ISSN</b>: {if $currentJournal->getSetting('onlineIssn')}{$currentJournal->getSetting('onlineIssn')} (Electronic){else}on proccess (Electronic){/if}</li>
			{if $currentJournal->getSetting('initials')}
			<li style="list-style: none; margin-left: 0"><b>Journal Initials</b>: {$currentJournal->getSetting('initials', $currentJournal->getPrimaryLocale())}</li>{/if}
			{if $currentJournal->getSetting('abbreviation')}
			<li style="list-style: none; margin-left: 0"><b>Journal Abbrev.</b>: <i>{$currentJournal->getSetting('abbreviation', $currentJournal->getPrimaryLocale())}</i></li>{/if}
		</ul>
		{/if}
	</div>

	{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
	<div class="column medium-6">
		Associated with:
		{if not ($currentJournal->getSetting('publisherInstitution') == '' && $currentJournal->getLocalizedSetting('publisherNote') == '' && $currentJournal->getLocalizedSetting('contributorNote') == '' && empty($journalSettings.contributors) && $currentJournal->getLocalizedSetting('sponsorNote') == '' && empty($journalSettings.sponsors))}<a href="{url page="about" op="journalSponsorship"}" class="society-link"><img class="society-logo" title="Associated Journal or Sponsorship" src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="auto" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} /></a>{/if}
	</div>
	{/if}

	<div class="column medium-12">
		<div id="journal-history-link">
		{if $currentJournal->getLocalizedSetting('history') != ''}
			<span class="icon-container info">
				This journal was previously published under other titles
				<a href="{url page="about" op="history" anchor=""}">(view Journal {translate key="about.history"})</a>
			</span>
		{/if}
		</div>

		{if $journalDescription}
		<div >{$journalDescription}</div>
		{/if}

		{if $additionalHomeContent}
		<div class="b-main-contents">{$additionalHomeContent}</div>
		{/if}
	</div>
</div>

</div>
</div>
</section>

<aside class="column medium-4">
	<section class="cta-aside-section">
		{if $currentJournal && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
		<section class="stipwunaraha-section">
			<h4 class="aside-headline-3350774344">Go to <strong>Stipwunaraha</strong> to see if you have access</h4>
			<a href="{url page="issue" op="archive"}" target="_blank" data-track="click" class="button-base-47711979">
				<span class="button-label-2770091062">Browse Volumes &amp; Issues</span>
				<svg width="16" height="16" viewBox="0 0 16 16" class="button-icon-1494494357"><path fill="inherit" fill-rule="evenodd" d="M13.161 12.387c.428 0 .774.347.774.774v1.033c0 .996-.81 1.806-1.806 1.806H1.677A1.68 1.68 0 0 1 0 14.323V3.87c0-.996.81-1.806 1.806-1.806H2.84a.774.774 0 0 1 0 1.548H1.806a.258.258 0 0 0-.258.258v10.452a.13.13 0 0 0 .13.129h10.451a.258.258 0 0 0 .258-.258V13.16c0-.427.347-.774.774-.774zM14.323 0A1.68 1.68 0 0 1 16 1.677V8a.774.774 0 0 1-1.548 0V2.644l-9.002 9a.768.768 0 0 1-.547.227.773.773 0 0 1-.547-1.321l9-9.002H8A.774.774 0 0 1 8 0h6.323z"></path></svg></a>

			<a id="browseVolumeIssues" class="button-base-47711979" href="{url page="search" op="titles"}" target="_blank" data-track="click">
				<span class="button-label-2770091062">Read All Articles</span>
				<svg width="16" height="16" viewBox="0 0 16 16" class="button-icon-1494494357"><path fill="inherit" fill-rule="evenodd" d="M13.161 12.387c.428 0 .774.347.774.774v1.033c0 .996-.81 1.806-1.806 1.806H1.677A1.68 1.68 0 0 1 0 14.323V3.87c0-.996.81-1.806 1.806-1.806H2.84a.774.774 0 0 1 0 1.548H1.806a.258.258 0 0 0-.258.258v10.452a.13.13 0 0 0 .13.129h10.451a.258.258 0 0 0 .258-.258V13.16c0-.427.347-.774.774-.774zM14.323 0A1.68 1.68 0 0 1 16 1.677V8a.774.774 0 0 1-1.548 0V2.644l-9.002 9a.768.768 0 0 1-.547.227.773.773 0 0 1-.547-1.321l9-9.002H8A.774.774 0 0 1 8 0h6.323z"></path></svg></a>

			<a id="browseVolumeIssues" class="button-base-47711979" href="{url page="search" op="authors"}" target="_blank" data-track="click">
				<span class="button-label-2770091062">Browse Authors</span>
				<svg width="16" height="16" viewBox="0 0 16 16" class="button-icon-1494494357"><path fill="inherit" fill-rule="evenodd" d="M13.161 12.387c.428 0 .774.347.774.774v1.033c0 .996-.81 1.806-1.806 1.806H1.677A1.68 1.68 0 0 1 0 14.323V3.87c0-.996.81-1.806 1.806-1.806H2.84a.774.774 0 0 1 0 1.548H1.806a.258.258 0 0 0-.258.258v10.452a.13.13 0 0 0 .13.129h10.451a.258.258 0 0 0 .258-.258V13.16c0-.427.347-.774.774-.774zM14.323 0A1.68 1.68 0 0 1 16 1.677V8a.774.774 0 0 1-1.548 0V2.644l-9.002 9a.768.768 0 0 1-.547.227.773.773 0 0 1-.547-1.321l9-9.002H8A.774.774 0 0 1 8 0h6.323z"></path></svg></a>	
		</section>
		{/if}

		{include file="common/payment.tpl"}		

		{if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION}
		<section class="sign-up-form box2-321956623"><div>
			<div id="alert-widget_body">
				<div class="sign-up">
					<h4>Updates for {$currentJournal->getLocalizedTitle()|strip_tags|escape}</h4>
					<p>Receive updates for all new issues published in {$currentJournal->getLocalizedTitle()|strip_tags|escape}.</p>
					<form method="post" action="/app-jp/gp/alerts" onsubmit="return subscribe();">
						<div><label for="sign-up-email">E-Mail Address*</label><input id="sign-up-email" name="email" type="email" required="required"></div>
						<div class="valid-email" id="sign-up-invaid-email"><p>Please enter valid email address</p></div>
						<div class="conflict" id="sign-up-already-subscribed"><p>You are already subscribed for this journal</p></div>
						<div class="error" id="sign-up-error"><p>Something went wrong. Please try again later</p></div>
						<button type="submit"><span>Sign up now</span><svg width="32" height="32" viewBox="0 0 32 32"><path fill="inherit" fill-rule="evenodd" d="M11.5 28c-0.38 0-0.76-0.142-1.052-0.432-0.59-0.58-0.598-1.528-0.016-2.118l10.166-9.492-10.162-9.404c-0.584-0.588-0.58-1.538 0.008-2.118 0.59-0.588 1.54-0.578 2.122 0.008l10.86 10.104c0.772 0.776 0.774 2.028 0.006 2.808l-10.862 10.196c-0.294 0.298-0.682 0.448-1.070 0.448z"></path></svg></button>
						<div class="success" id="sign-up-confirmation"><p>Thanks for signing up! Please check your email to confirm your subscription</p></div>
					</form>
				</div>
				<style>.conflict{display: none !important;}.error{display: none !important;}.success{display: none !important;}.valid-email {display: none !important;}.sign-up button {background-color: transparent;border: 1px solid #00768a;border-radius: 0;display: flex;justify-content: space-between;padding-bottom: 9px;padding-left: 11px;padding-right: 11px;padding-top: 9px;transition: all .2s;-webkit-font-smoothing: antialiased;width: 100%}.sign-up button span {color: #00768a;font-family: "Bliss Regular", "Gill Sans", Calibri, "Helvetica Neue", Arial, sans-serif;font-size: 16px;line-height: 22px;text-decoration: none;transition: all .2s}.sign-up button svg {align-self: center;display: inline-flex;fill: #00768a;height: 16px;transform-box: fill-box;transition: all .2s;width: 16px}.sign-up button:hover {background-color: #00768a}.sign-up button:hover span {color: #ecfafd}.sign-up button:hover svg {fill: #ecfafd}.sign-up h4 {color: #2b2b2b;font-family: "Bliss Bold", "Gill Sans", Calibri, "Helvetica Neue", Arial, sans-serif;font-size: 18px;font-weight: 400;line-height: 22px;transform: translateY(calc(-.1em - 2px))}.sign-up input[type=email] {font-size: 15px;padding: 8px;width: 100%}.sign-up #sign-up-already-subscribed, .sign-up #sign-up-invaid-email, .sign-up #sign-up-error {color: red}.sign-up button, .sign-up div, .sign-up h4, .sign-up input, .sign-up p {margin-bottom: calc(-.25em + 10px)}.sign-up #sign-up-confirmation {color: #00768a}</style>
			</div>
				<script>
					function subscribe(event) {
						const email = document.getElementById('sign-up-email').value;
						fetch('/app-jp/gp/alerts?bodyOnly', {
							method: 'POST',
							headers: {
							'Content-Type': 'application/json'
							},
							json: true,
							body: JSON.stringify({
								email: email,
								journalNo: 41267,
								journalTitle: encodeURIComponent("Journal of International Business Studies")
							})
						}).then(function (response) {
							response.text().then(function (text) {
								document.getElementById('alert-widget_body').innerHTML = text;
								window.dataLayer = window.dataLayer || [];
								window.dataLayer.push({
									'event': 'toc_widget_subscribed'
								});
							});
						})
						.catch(function (err) {
							console.error(err)
						});
						return false;
					}
				</script>
			</div>
		</section>
		{/if}{* $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION *}

		<!--{if $homepageImage}
		<section>
			<div class="cms-image-only-teaser" {if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION}style="display: none;"{/if}><img class="journal-cover imgLarge" src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" width="{$homepageImage.width|escape}" height="{$homepageImage.height|escape}" {if $homepageImageAltText != ''}alt="Cover {$homepageImageAltText|escape}"{else}alt="{translate key="common.journalHomepageImage.altText"}"{/if} />
			</div>
		</section>
		{/if}-->		

		<section>
			<h4 class="aside-headline-2920163469">Publish with us</h4>
			<a href="{url page="about" op="submissions" anchor="onlineSubmissions"}" target="_blank" data-track="click" class="button-base-159610158"><span class="button-label-2658192883">Submit paper</span><svg width="16" height="16" viewBox="0 0 16 16" class="button-icon-1925105232"><path fill="inherit" fill-rule="evenodd" d="M13.161 12.387c.428 0 .774.347.774.774v1.033c0 .996-.81 1.806-1.806 1.806H1.677A1.68 1.68 0 0 1 0 14.323V3.87c0-.996.81-1.806 1.806-1.806H2.84a.774.774 0 0 1 0 1.548H1.806a.258.258 0 0 0-.258.258v10.452a.13.13 0 0 0 .13.129h10.451a.258.258 0 0 0 .258-.258V13.16c0-.427.347-.774.774-.774zM14.323 0A1.68 1.68 0 0 1 16 1.677V8a.774.774 0 0 1-1.548 0V2.644l-9.002 9a.768.768 0 0 1-.547.227.773.773 0 0 1-.547-1.321l9-9.002H8A.774.774 0 0 1 8 0h6.323z"></path></svg></a>
		</section>

	</section>
</aside>
</div>
</div>

{call_hook name="Templates::Index::journal"}
{if $issue && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
{* Display the table of contents or cover page of the current issue. *}
<section class="live-area-wrapper">
  <div class="live-area">
  	<div class="row">
  		<div class="column medium-12 main-contents">
  			<h2 class="headline-1283242569 articlesHome">Latest issue</h2>
  		</div>
  	</div>

  	<div class="row">
  		{if $issue->getLocalizedFileName() && $issue->getShowCoverPage($locale) && !$issue->getHideCoverPageArchives($locale)}
		<div class="column medium-2 journal-cover">
			<noscript>
				<img class="journal-cover__image cover-lazy img-default" {if $issue->getCoverPageAltText($locale) != ''} title="Cover issue {$issue->getCoverPageAltText($locale)|escape}" {else} title="Cover issue {translate key="issue.coverPage.altText"}"{/if} src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $issue->getCoverPageAltText($locale) != ''} alt="{$issue->getCoverPageAltText($locale)|escape}"{else} alt="{translate key="issue.coverPage.altText"}"{/if} style="margin-top: 0" width="100%" />
					{else}
				<noscript>					
				<img class="journal-cover__image cover-lazy img-default" title="Cover issue default" src="//media.stipwunaraha.ac.id/img/img-default.jpg" alt="Cover issue" style="margin-top: 0" width="100%" /> {/if}
			</noscript>

			{if $issue->getLocalizedFileName() && $issue->getShowCoverPage($locale) && !$issue->getHideCoverPageArchives($locale)}
				<img class="journal-cover__image cover-lazy img-default" {if $issue->getCoverPageAltText($locale) != ''} title="Cover issue {$issue->getCoverPageAltText($locale)|escape}" {else} title="Cover issue {translate key="issue.coverPage.altText"}"{/if} src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $issue->getCoverPageAltText($locale) != ''} alt="{$issue->getCoverPageAltText($locale)|escape}"{else} alt="{translate key="issue.coverPage.altText"}"{/if} style="margin-top: 0" width="100%" />
					{else}
			<div class="column medium-2 journal-cover">
				<img class="journal-cover__image cover-lazy img-default" title="Cover issue default" src="//media.stipwunaraha.ac.id/img/img-default.jpg" alt="Cover issue default" style="margin-top: 0" width="153px" height="auto" />
		{/if}
		{call_hook name="Templates::Article::Article::ArticleCoverImage"}
</div>

	<section class="column medium-6">
		<h3 class="kicker headline-636847849">{translate key="issue.volume"} {$issue->getVolume()|escape}, {translate key="issue.number"} {$issue->getNumber()|escape}, {$issue->getDatePublished()|date_format:"%B %Y"}</h3>

		{if $issue->getLocalizedTitle($currentJournal)}
			<h3 class="issue-title headline-2545795530">{$issue->getLocalizedTitle($currentJournal)|escape}</h3>
		{/if}

		{include file="issue/issue.tpl"}
		<a href="{url page="issue" op="current"}" title="Browse Issue" style="width: 50%" class="button-base-2145177612"><span class="button-label-2586741800">Browse Issue</span><svg width="32" height="32" viewBox="0 0 32 32" class="button-icon-2388614187"><path fill="inherit" fill-rule="evenodd" d="M11.5 28c-0.38 0-0.76-0.142-1.052-0.432-0.59-0.58-0.598-1.528-0.016-2.118l10.166-9.492-10.162-9.404c-0.584-0.588-0.58-1.538 0.008-2.118 0.59-0.588 1.54-0.578 2.122 0.008l10.86 10.104c0.772 0.776 0.774 2.028 0.006 2.808l-10.862 10.196c-0.294 0.298-0.682 0.448-1.070 0.448z"></path></svg></a>
	
	</section>

	<div class="column medium-4">
		<aside>
			<div class="box">
				<section class="teaser"><h4 class="headline-424997076">Publish with us</h4>
					<div><p>Find out more about how to publish in this journal<br></p></div><a title="Submission" href="{url page="information" op="authors"}" class="button-base-3479930902"><span class="button-label-256261418">More Information</span><svg width="32" height="32" viewBox="0 0 32 32" class="button-icon-1913844361"><path fill="inherit" fill-rule="evenodd" d="M11.5 28c-0.38 0-0.76-0.142-1.052-0.432-0.59-0.58-0.598-1.528-0.016-2.118l10.166-9.492-10.162-9.404c-0.584-0.588-0.58-1.538 0.008-2.118 0.59-0.588 1.54-0.578 2.122 0.008l10.86 10.104c0.772 0.776 0.774 2.028 0.006 2.808l-10.862 10.196c-0.294 0.298-0.682 0.448-1.070 0.448z"></path></svg></a>
				</section>
				<div class="resize-sensor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; z-index: -1; visibility: hidden;"><div class="resize-sensor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;"><div style="position: absolute; left: 0px; top: 0px; transition: 0s; width: 100000px; height: 100000px;"></div></div><div class="resize-sensor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;"><div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div></div></div>
			</div>

			<section class="teaser-navigation" style="margin-top: 40px;">
				<h4 class="headline-3740845194">Issues &amp; Articles</h4>
				<nav class="journal-subnav">
					<div class="live">
						<ul class="ul">
							<li class="journal-navigation-header">Header</li>
							<li class="  "><a href="{url page="issue" op="current"}" title="Browse Latest Issue">Latest Issue</a></li>
							<li class="  "><a href="{url page="issue" op="archive"}" title="Browse Volume & Issue">Issue One/Two Now Online!</a></li>
						</ul>
					</div>
					<style type="text/css">.journal-subnav ul {list-style: none;}.journal-subnav li {font-family: "Bliss Regular", "Gill Sans", Calibri, "Helvetica Neue", Arial, sans-serif;font-size: 16px;line-height: 22px;margin-left: 0;}.journal-subnav a {color: #444;text-decoration: none;padding: 8px 0;display: block;}.journal-subnav a:hover {color: #00768a;}.journal-subnav .menu-item--current a {color: #00768a;font-family: "Bliss Bold", "Gill Sans", Calibri, "Helvetica Neue", Arial, sans-serif;}.teaser-navigation .journal-subnav {columns: 2;}.teaser-navigation .journal-subnav li {font-family: Verdana;font-size: 14px;line-height: 18px;break-inside: avoid;}.teaser-navigation .journal-subnav a {color: #00768a;padding: 6px 0;}.teaser-navigation .journal-subnav a:hover {text-decoration: underline;}.teaser-navigation > * + * {margin-top: 15px;}</style>
				</nav>
			</section>
		</aside>
	</div>
	</div>
</section>

<section class="live-area-wrapper">
  <div class="live-area">
  	<div class="row">
  		<div class="column medium-12 main-contents">
  			<h2 class="headline-1283242569">Publishing with us</h2>
  		</div>
  	</div>

  	<section class="row">
  		<section class="column {if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION}medium-8{else}{if $issue && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}medium-4{else}medium-8{/if}{/if} teaser-navigation">
  			<h4 class="headline-3332373131">For authors</h4>
  			<nav {if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION}class="journal-subnav journal-subnav--3"{else}{if $issue && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}class="journal-subnav"{else}class="journal-subnav journal-subnav--3"{/if}{/if}><div class="live">
  				<ul class="ul">
  					<li class="journal-navigation-header">Header</li>
  					{if $currentJournal->getLocalizedSetting('focusScopeDesc') != ''}
  					<li class=" "><a href="{url page="about" op="editorialPolicies" anchor="focusAndScope"}">Aims &amp; Scope</a></li>
  					{/if}

  					<li class=" "><a href="{url page="about" op="submissions"}">Submission</a></li>
  					
  					<li class=" "><a href="{url page="information" op="authors"}">{translate key="navigation.infoForAuthors"}</a></li>
  					
  					{foreach from=$navMenuItems item=navItem key=navItemKey}
  					{if $navItem.url != '' && $navItem.name != ''}
  					<li class=" "><a href="{if $navItem.isAbsolute}{$navItem.url|escape}{else}{$baseUrl}{$navItem.url|escape}{/if}">{if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}</a></li>{/if}
  					{/foreach}

  					{foreach key=key from=$customAboutItems item=customAboutItem}{if $customAboutItem.title!=''}
  					<li class=" "><a href="{url page="about" op="editorialPolicies" anchor="{custom-$key}"}">{$customAboutItem.title|escape}</a></li>{/if}
  					{/foreach}
  					
  					{call_hook name="Templates::About::Index::Policies"}

			        {if $currentJournal->getLocalizedSetting('focusScopeDesc') != ''}<li class=" "><a href="{url page="about" op="editorialPolicies" anchor="focusAndScope"}">{translate key="about.focusAndScope"}</a></li>{/if}

			        <li class=" "><a href="{url page="about" op="editorialPolicies" anchor="sectionPolicies"}">{translate key="about.sectionPolicies"}</a></li>

			        {if $currentJournal->getLocalizedSetting('reviewPolicy') != ''}<li class=" "><a href="{url page="about" op="editorialPolicies" anchor="peerReviewProcess"}">{translate key="about.peerReviewProcess"}</a></li>{/if}

			        {if $currentJournal->getLocalizedSetting('pubFreqPolicy') != ''}<li class=" "><a href="{url page="about" op="editorialPolicies" anchor="publicationFrequency"}">{translate key="about.publicationFrequency"}</a></li>{/if}

			        {if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_OPEN && $currentJournal->getLocalizedSetting('openAccessPolicy') != ''}<li class=" "><a href="{url page="about" op="editorialPolicies" anchor="openAccessPolicy"}">{translate key="about.openAccessPolicy"}</a></li>{/if}

			        {if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $currentJournal->getSetting('enableAuthorSelfArchive')}<li class=" "><a href="{url page="about" op="editorialPolicies" anchor="authorSelfArchivePolicy"}">{translate key="about.authorSelfArchive"}</a></li>{/if}

			        {if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $currentJournal->getSetting('enableDelayedOpenAccess')}<li class=" "><a href="{url page="about" op="editorialPolicies" anchor="delayedOpenAccessPolicy"}">{translate key="about.delayedOpenAccess"}</a></li>{/if}

			        {if $currentJournal->getSetting('enableLockss') && $currentJournal->getLocalizedSetting('lockssLicense') != ''}<li class=" "><a href="{url page="about" op="editorialPolicies" anchor="archiving"}">{translate key="about.archiving"}</a></li>{/if}

			        {foreach key=key from=$currentJournal->getLocalizedSetting('customAboutItems') item=customAboutItem}
			        {if !empty($customAboutItem.title)}
			            <li class=" "><a href="{url page="about" op="editorialPolicies" anchor="{custom-$key}"}">{$customAboutItem.title|escape}</a></li>
			         {/if}
			         {/foreach}  								        

	  				<li class=" "><a href="{url page="information" op="readers"}">{translate key="navigation.infoForReaders"}</a></li>
  					
  					<li class=" "><a href="{url page="information" op="librarians"}">{translate key="navigation.infoForLibrarians"}</a></li>
  					
  					{call_hook name="Templates::About::Index::Policies"}
  					<li class="  "><a href="{url page="about" op="contact"}">Contacts</a></li>
  				</ul>
  			</div>
  			<style type="text/css">.journal-subnav ul {list-style: none;}.journal-subnav li {font-family: "Bliss Regular", "Gill Sans", Calibri, "Helvetica Neue", Arial, sans-serif;font-size: 16px;line-height: 22px;margin-left: 0;}.journal-subnav a {color: #444;text-decoration: none;padding: 8px 0;display: block;}.journal-subnav a:hover {color: #00768a;}.journal-subnav .menu-item--current a {color: #00768a;font-family: "Bliss Bold", "Gill Sans", Calibri, "Helvetica Neue", Arial, sans-serif;}.teaser-navigation .journal-subnav {columns: 2;}.teaser-navigation .journal-subnav li {font-family: Verdana;font-size: 14px;line-height: 18px;break-inside: avoid;}.teaser-navigation .journal-subnav a {color: #00768a;padding: 6px 0;}.teaser-navigation .journal-subnav a:hover {text-decoration: underline;}.teaser-navigation > * + * {margin-top: 15px;}</style></nav>
  		</section>

  		{if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_OPEN && $currentJournal->getLocalizedSetting('openAccessPolicy') != ''}
  		<div class="column medium-4">
  			<div class="box">
  				<section class="teaser">
  					<h4 class="headline-3789142952">Publishing Open Access with us</h4>
  					<div><p>Learn how you can benefit from Open Access publishing</p></div>
  					<a title="Open Access &amp; Self Archiving" href="{url page="about" op="editorialPolicies" anchor="openAccessPolicy"}" class="button-base-3588540778"><span class="button-label-1262423735">Learn more</span><svg width="32" height="32" viewBox="0 0 32 32" class="button-icon-248642068"><path fill="inherit" fill-rule="evenodd" d="M11.5 28c-0.38 0-0.76-0.142-1.052-0.432-0.59-0.58-0.598-1.528-0.016-2.118l10.166-9.492-10.162-9.404c-0.584-0.588-0.58-1.538 0.008-2.118 0.59-0.588 1.54-0.578 2.122 0.008l10.86 10.104c0.772 0.776 0.774 2.028 0.006 2.808l-10.862 10.196c-0.294 0.298-0.682 0.448-1.070 0.448z"></path></svg></a>
  				</section>
  			</div>
  		</div>
  		{/if}

  		<div class="column medium-4">
  			<div class="box">
  				<section class="teaser"><h4 class="headline-3789142952">Submission manuscript</h4>
  					<div><p>Find out more about how to submission and/or publish within this journal</p></div>
  					<a title="News and Announcements" href="{url page="about" op="submissions"}" class="button-base-3588540778"><span class="button-label-1262423735">More Information</span><svg width="32" height="32" viewBox="0 0 32 32" class="button-icon-248642068"><path fill="inherit" fill-rule="evenodd" d="M11.5 28c-0.38 0-0.76-0.142-1.052-0.432-0.59-0.58-0.598-1.528-0.016-2.118l10.166-9.492-10.162-9.404c-0.584-0.588-0.58-1.538 0.008-2.118 0.59-0.588 1.54-0.578 2.122 0.008l10.86 10.104c0.772 0.776 0.774 2.028 0.006 2.808l-10.862 10.196c-0.294 0.298-0.682 0.448-1.070 0.448z"></path></svg></a>
  				</section>
  			</div>
  		</div>
   </div>
</section>
{/if}

{if $enableAnnouncementsHomepage}
	{* Display announcements *}
<section class="live-area-wrapper">
  <div class="live-area">
  	<div class="row">
  		<div class="column medium-12 main-contents">
  			<h2 class="headline-1283242569">{translate key="announcement.announcementsHome"}</h2>
  		</div>
  	</div>

  	<section class="row" style="margin-top: 10px">
  		<section class="column medium-8">
<div class="announcements">
	{counter start=1 skip=1 assign="count"}
	{iterate from=announcements item=announcement}
	{if !$numAnnouncementsHomepage || $count <= $numAnnouncementsHomepage}

	<section class="announcement">
	{if $announcement->getTypeId()}
	<h3 class="headline-2545795530">{$announcement->getAnnouncementTypeName()|escape}: {$announcement->getLocalizedTitle()|escape}</h3>
	{else}
	<h3 class="headline-2545795530">{$announcement->getLocalizedTitle()|escape}</h3>
	{/if}
		
	<div class="description">{$announcement->getLocalizedDescriptionShort()|nl2br}</div>
	<br />
	<tbody>
		<tr class="details">
			<td class="posted">{translate key="announcement.posted"}: {$announcement->getDatePosted()|date_format:"%e %B %Y"}</td>
			<td class="more">&nbsp;</td>
			{if $announcement->getLocalizedDescription() != null}
				<td class="more"><a href="{url page="announcement" op="view" path=$announcement->getId()}" style="float: right;">{translate key="announcement.viewLink"}</a></td>
			{/if}
		</tr>
	</tbody>
	</section>
		{/if}
	{counter}
	{/iterate}
</div>
  		</section>

  		<div class="column medium-4">
  			<div class="box last">
  				<section class="teaser"><h4 class="headline-3789142952">Browse our latest news</h4>
  					<div><p>Stay up to date on events, announcements &amp; new releases</p></div>
  					<a title="News and Announcements" href="{url page="announcement"}" class="button-base-3588540778"><span class="button-label-1262423735">Browse now</span><svg width="32" height="32" viewBox="0 0 32 32" class="button-icon-248642068"><path fill="inherit" fill-rule="evenodd" d="M11.5 28c-0.38 0-0.76-0.142-1.052-0.432-0.59-0.58-0.598-1.528-0.016-2.118l10.166-9.492-10.162-9.404c-0.584-0.588-0.58-1.538 0.008-2.118 0.59-0.588 1.54-0.578 2.122 0.008l10.86 10.104c0.772 0.776 0.774 2.028 0.006 2.808l-10.862 10.196c-0.294 0.298-0.682 0.448-1.070 0.448z"></path></svg></a>
  				</section>
  			</div>
  		</div>
	   </div>
	  </section>
	</div>
</section>
{/if}

	</div>
</section>


<section class="live-area-wrapper {if $issue && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}{else}{if $enableAnnouncementsHomepage}{else}cms-highlight{/if}{/if}">
<div class="live-area">
<div class="row">
	<div class="columns small-12 ">
		<div class="cms-grid-collection"><h2 id="c6611792">Stay informed</h2>
		<div class="cms-collection-list">
			<ul class="small-block-grid-1 medium-block-grid-3">
				<li>
					<div id="id19" class=""><a class="cms-teaser-text" href="{url page="about" op="editorialTeam"}" style="text-decoration: none;" target="_blank"><div class="cms-teaser-box cms-teaser-box-with-icon cms-teaser-box-titled-icon" data-mh="mh-id3" style="height: 74px;"><div class="article-meta"></div><div class="cms-font-icon">N</div><h3>Contact an Editor</h3></div></a></div></li>
				<li>
					<div id="id1a" class=""><a class="cms-teaser-text" href="https://twitter.com/{$currentJournal->getSetting('initials', $currentJournal->getPrimaryLocale())}" style="text-decoration: none;" target="_blank"><div class="cms-teaser-box cms-teaser-box-with-icon cms-teaser-box-titled-icon" data-mh="mh-id3" style="height: 74px;"><div class="article-meta"></div><div class="cms-font-icon">1</div><h3>Follow @{$currentJournal->getSetting('initials', $currentJournal->getPrimaryLocale())}</h3></div></a></div></li>
				<li>
					<div id="id1b" class=""><a class="cms-teaser-text" href="https://twitter.com/Stipwunaraha_" style="text-decoration: none;" target="_blank"><div class="cms-teaser-box cms-teaser-box-with-icon cms-teaser-box-titled-icon" data-mh="mh-id3" style="height: 74px;"><div class="article-meta"></div><div class="cms-font-icon">1</div><h3>Follow @Stipwunaraha</h3></div></a></div></li>
			</ul>
		</div>
		</div>
	</div>
</div>
</div>
</section>



{include file="common/footer.tpl"}

