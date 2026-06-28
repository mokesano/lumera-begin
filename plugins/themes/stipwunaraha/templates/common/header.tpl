{**
 * header.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2000-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site header.
 *}
{strip}
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
{if $pageCrumbTitle}
	{translate|assign:"pageCrumbTitleTranslated" key=$pageCrumbTitle}
{elseif !$pageCrumbTitleTranslated}
	{assign var="pageCrumbTitleTranslated" value=$pageTitleTranslated}
{/if}
{/strip}<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="--font-family-sans:Europa; --font-family-serif:Noto Serif;" lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
    <head>
        <title>{$pageTitleTranslated} - {$currentJournal->getLocalizedTitle()|strip_tags|escape} | Stipwunaraha</title>
        
        <meta name="description" content="{$metaSearchDescription|escape}" />
        <meta name="keywords" content="{$metaSearchKeywords|escape}" />
        <meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />

	{$metaCustomHeaders}
	
	{if $displayFavicon}<link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />{/if}
	<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/pkp.css" type="text/css" />
	<!-- <link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/common.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" />-->
	<link rel="stylesheet" href="{$baseUrl}/styles/compiled.css" type="text/css" /> 

	<!-- Base Jquery -->
	{if $allowCDN}<script type="text/javascript" src="//www.google.com/jsapi"></script>
		<script type="text/javascript">{literal}
			<!--
			// Provide a local fallback if the CDN cannot be reached
			if (typeof google == 'undefined') {
				document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));
				document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js' type='text/javascript'%3E%3C/script%3E"));
			} else {
				google.load("jquery", "{/literal}{$smarty.const.CDN_JQUERY_VERSION}{literal}");
				google.load("jqueryui", "{/literal}{$smarty.const.CDN_JQUERY_UI_VERSION}{literal}");
			}
			// -->
		{/literal}</script>
	{else}
		<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/jquery.min.js"></script>
		<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js"></script>
	{/if}

	{call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
	{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
	<!-- {if $leftSidebarCode || $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/sidebar.css" type="text/css" />{/if}
	{if $leftSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/leftSidebar.css" type="text/css" />{/if}
	{if $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/rightSidebar.css" type="text/css" />{/if}
	{if $leftSidebarCode && $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/bothSidebars.css" type="text/css" /> {/if}-->

	<!-- Default global locale keys for JavaScript -->
	{include file="common/jsLocaleKeys.tpl" }

	<!-- Compiled scripts -->
	{if $useMinifiedJavaScript}
		<script type="text/javascript" src="{$baseUrl}/js/pkp.min.js"></script>
	{else}
		{include file="common/minifiedScripts.tpl"}
	{/if}

	<!-- Form validation -->
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/validate/jquery.validate.js"></script>
	<script type="text/javascript">
		<!--
		// initialise plugins
		{literal}
		$(function(){
			jqueryValidatorI18n("{/literal}{$baseUrl}{literal}", "{/literal}{$currentLocale}{literal}"); // include the appropriate validation localization
			{/literal}{if $validateId}{literal}
				$("form[name={/literal}{$validateId}{literal}]").validate({
					errorClass: "error",
					highlight: function(element, errorClass) {
						$(element).parent().parent().addClass(errorClass);
					},
					unhighlight: function(element, errorClass) {
						$(element).parent().parent().removeClass(errorClass);
					}
				});
			{/literal}{/if}{literal}
			$(".tagit").live('click', function() {
				$(this).find('input').focus();
			});
		});
		// -->
		{/literal}
	</script>

	{if $hasSystemNotifications}
		{url|assign:fetchNotificationUrl page='notification' op='fetchNotification' escape=false}
		<script type="text/javascript">
			$(function(){ldelim}
				$.get('{$fetchNotificationUrl}', null,
					function(data){ldelim}
						var notifications = data.content;
						var i, l;
						if (notifications && notifications.general) {ldelim}
							$.each(notifications.general, function(notificationLevel, notificationList) {ldelim}
								$.each(notificationList, function(notificationId, notification) {ldelim}
									$.pnotify(notification);
								{rdelim});
							{rdelim});
						{rdelim}
				{rdelim}, 'json');
			{rdelim});
		</script>
	{/if}{* hasSystemNotifications *}

	{foreach from=$stylesheets name="testUrl" item=cssUrl}
		{if $cssUrl == "$baseUrl/styles/ojs.css"}
			<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
		{/if}
	{/foreach}

	{include file="common/head.tpl"}

	{foreach from=$stylesheets name="testUrl" item=cssUrl}
		{if $cssUrl != "$baseUrl/styles/ojs.css"}
			<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
		{/if}
	{/foreach}

	{$additionalHeadData}
</head>

<body id="COSIRE">
<a id="skip-to-content" href="#main">Skip to Main Content</a>
{include file="common/navbar.tpl"}
    <div class="c-journal-header__identity c-journal-header__identity--default"></div>

<div class="journal-page">
{include file="common/journal-identity.tpl"}
    <nav class="journal-navigation">
    	<div class="row">
    		<ul class="column">
    			<li class="journal-navigation-header"><a><b>Navigation</b>
    				<svg width="32" height="32" viewBox="0 0 32 32" class="journal-navigation-arrow-icon-size16"><path fill="inherit" fill-rule="evenodd" d="M28 11.5c0-0.38-0.142-0.76-0.432-1.052-0.58-0.59-1.528-0.598-2.118-0.016l-9.492 10.166-9.404-10.162c-0.588-0.584-1.538-0.58-2.118 0.008-0.588 0.59-0.578 1.54 0.008 2.122l10.104 10.86c0.776 0.772 2.028 0.774 2.808 0.006l10.196-10.862c0.298-0.294 0.448-0.682 0.448-1.070z"></path>
    				</svg></a>
    			</li>
    			<li class="  "><a href="{url page="$currentJournal"}">Overview</a></li>
    			<li class="  "><a href="{url page="about" op="editorialTeam"}" >{translate key="navigation.about"}</a></li>
    			{if $currentJournal && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
    			<li class="  "><a href="{url page="issue" op="current"}">Issues &amp; Articles</a></li>
    			{/if}
    			<li class="menu-item--current  menu-item--current menu-item--current-parent"><a href="{url page="about" op="submissions"}">Submissions</a></li>
    		</ul>
		</div>
    </nav>

</div>

<div id="body" class="journal-content" role="main">

<div class="live-area-wrapper">
	<div class="row">
		<div class="sidebar">
			<div id="menu" class="column medium-2">
			    <ul class="c-sidemenu c-bar--menu c-nav c-nav--stacked c-collapse-at-lt-md">
  					<li class="journal-navigation-header" style="display: none;">Header</li>

  					{if $currentJournal->getLocalizedSetting('focusScopeDesc') != ''}<li class="c-sidemenu c-bar--menu"><a href="{url page="about" op="editorialPolicies" anchor="focusAndScope"}"><span class="c-flex c-flex--align-baseline">Aims &amp; Scope</span></a></li>{/if}

			        <li id="linkEditorialPolicies" class="c-sidemenu c-bar--menu"><a href="{url page="about" op="editorialPolicies" anchor="sectionPolicies"}"><span class="c-flex c-flex--align-baseline">{translate key="about.sectionPolicies"}</span></a></li>

  					{if $currentJournal->getLocalizedSetting('authorGuidelines') != ''}<li class="c-sidemenu c-bar--menu"><a href="{url page="about" anchor="authorGuidelines"}"><span class="c-flex c-flex--align-baseline">{translate key="about.authorGuidelines"}</span></a></li>{/if}

  					<li class="c-sidemenu c-bar--menu"><a href="{url page="information" op="authors"}"><span class="c-flex c-flex--align-baseline">{translate key="navigation.infoForAuthors"}</span></a></li>
  					
  					{foreach from=$navMenuItems item=navItem key=navItemKey}
  					{if $navItem.url != '' && $navItem.name != ''}
  					<li class="c-sidemenu c-bar--menu"><a href="{if $navItem.isAbsolute}{$navItem.url|escape}{else}{$baseUrl}{$navItem.url|escape}{/if}"><span class="c-flex c-flex--align-baseline">{if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}</span></a></li>{/if}
  					{/foreach}

  					{foreach key=key from=$customAboutItems item=customAboutItem}{if $customAboutItem.title!=''}
  					<li class="c-sidemenu c-bar--menu"><a href="{url page="about" op="editorialPolicies" anchor=custom-$key}"><span class="c-flex c-flex--align-baseline">{$customAboutItem.title|escape}</span></a></li>{/if}
  					{/foreach}

  					{if $currentJournal->getLocalizedSetting('copyrightNotice') != ''}<li class="c-sidemenu c-bar--menu"><a href="{url page="about" anchor="copyrightNotice"}"><span class="c-flex c-flex--align-baseline">{translate key="about.copyrightNotice"}</span></a></li>{/if}

  					{call_hook name="Templates::About::Index::Submissions"}
  					
  					{call_hook name="Templates::About::Index::Policies"}

			        {if $currentJournal->getLocalizedSetting('reviewPolicy') != ''}<li id="linkReviewPolicy" class="c-sidemenu c-bar--menu"><a href="{url page="about" op="editorialPolicies" anchor="peerReviewProcess"}"><span class="c-flex c-flex--align-baseline">{translate key="about.peerReviewProcess"}</span></a></li>{/if}

			        {if $currentJournal->getLocalizedSetting('pubFreqPolicy') != ''}<li id="linkPubFreqPolicy" class="c-sidemenu c-bar--menu"><a href="{url page="about" op="editorialPolicies" anchor="publicationFrequency"}"><span class="c-flex c-flex--align-baseline">{translate key="about.publicationFrequency"}</span></a></li>{/if}

			        {if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_OPEN && $currentJournal->getLocalizedSetting('openAccessPolicy') != ''}<li id="linkOpenAccessPolicy" class="c-sidemenu c-bar--menu"><a href="{url page="about" op="editorialPolicies" anchor="openAccessPolicy"}"><span class="c-flex c-flex--align-baseline">{translate key="about.openAccessPolicy"}</span></a></li>{/if}

			        {if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $currentJournal->getSetting('enableAuthorSelfArchive')}<li id="enabledAuthorSelfArchive" class="c-sidemenu c-bar--menu"><a href="{url page="about" op="editorialPolicies" anchor="authorSelfArchivePolicy"}"><span class="c-flex c-flex--align-baseline">{translate key="about.authorSelfArchive"}</span></a></li>{/if}

			        {if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $currentJournal->getSetting('enableDelayedOpenAccess')}<li id="enabledDelayedOpenAccess" class="c-sidemenu c-bar--menu"><a href="{url page="about" op="editorialPolicies" anchor="delayedOpenAccessPolicy"}"><span class="c-flex c-flex--align-baseline">{translate key="about.delayedOpenAccess"}</span></a></li>{/if}

			        {foreach key=key from=$currentJournal->getLocalizedSetting('customAboutItems') item=customAboutItem}
			        {if !empty($customAboutItem.title)}
			            <li class="c-sidemenu c-bar--menu"><a href="{url page="about" op="editorialPolicies" anchor="{custom-$key}"><span class="c-flex c-flex--align-baseline">{$customAboutItem.title|escape}</span></a></li>
			         {/if}
			         {/foreach}

	  				<li class="c-sidemenu c-bar--menu"><a href="{url page="information" op="readers"}"><span class="c-flex c-flex--align-baseline">{translate key="navigation.infoForReaders"}</span></a></li>
  					
  					<li class="c-sidemenu c-bar--menu"><a href="{url page="information" op="librarians"}"><span class="c-flex c-flex--align-baseline">{translate key="navigation.infoForLibrarians"}</span></a></li>

  					{if $currentJournal->getLocalizedSetting('privacyStatement') != ''}<li class="c-sidemenu c-bar--menu"><a href="{url page="about" anchor="privacyStatement"}"><span class="c-flex c-flex--align-baseline">{translate key="about.privacyStatement"}</span></a></li>{/if}

  					{if $currentJournal->getSetting('journalPaymentsEnabled') && ($currentJournal->getSetting('submissionFeeEnabled') || $currentJournal->getSetting('fastTrackFeeEnabled') || $currentJournal->getSetting('publicationFeeEnabled'))}<li class="c-sidemenu c-bar--menu"><a href="{url page="about" anchor="authorFees"}"><span class="c-flex c-flex--align-baseline">{translate key="about.authorFees"}</span></a></li>{/if}

			        {if $donationEnabled}<li id="linkJournalContact" class="c-sidemenu c-bar--menu"><a href="{url page="donations"}"><span class="c-flex c-flex--align-baseline">{translate key="payment.type.donation"}</span></a></li>{/if}
  					
  					{if not (empty($journalSettings.mailingAddress) && empty($journalSettings.contactName) && empty($journalSettings.contactAffiliation) && empty($journalSettings.contactMailingAddress) && empty($journalSettings.contactPhone) && empty($journalSettings.contactFax) && empty($journalSettings.contactEmail) && empty($journalSettings.supportName) && empty($journalSettings.supportPhone) && empty($journalSettings.supportEmail))}
  					<li class="c-sidemenu c-bar--menu"><a href="{url page="about" op="contact"}"><span class="c-flex c-flex--align-baseline">Contacts</span></a></li>{/if}
			     </ul>
			</div>
		
			<aside class="column medium-3">
				<section class="box">
					<section><h4 class="headline-524909129">Want to publish with us? Submit your Manuscript online.</h4></section>
					<a href="{url page="author" op="submit"}" target="_blank" data-track="click" class="button-base-2906877647">
						<span class="button-label-1281676810">Submit paper</span>
						<svg width="16" height="16" viewBox="0 0 16 16" class="button-icon-1969128361"><path fill="inherit" fill-rule="evenodd" d="M13.161 12.387c.428 0 .774.347.774.774v1.033c0 .996-.81 1.806-1.806 1.806H1.677A1.68 1.68 0 0 1 0 14.323V3.87c0-.996.81-1.806 1.806-1.806H2.84a.774.774 0 0 1 0 1.548H1.806a.258.258 0 0 0-.258.258v10.452a.13.13 0 0 0 .13.129h10.451a.258.258 0 0 0 .258-.258V13.16c0-.427.347-.774.774-.774zM14.323 0A1.68 1.68 0 0 1 16 1.677V8a.774.774 0 0 1-1.548 0V2.644l-9.002 9a.768.768 0 0 1-.547.227.773.773 0 0 1-.547-1.321l9-9.002H8A.774.774 0 0 1 8 0h6.323z"></path></svg>
					</a>
				</section>
			</aside>
		</div>

<div class="column medium-7" role="main">

<h2 class="main-heading">{$pageTitleTranslated}</h2>

{if $pageSubtitle && !$pageSubtitleTranslated}{translate|assign:"pageSubtitleTranslated" key=$pageSubtitle}{/if}
{if $pageSubtitleTranslated}
	<h3 class="sub-heading">{$pageSubtitleTranslated}</h3>
{/if}

<div id="content" >

