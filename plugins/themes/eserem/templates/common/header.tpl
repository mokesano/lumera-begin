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
        <title>{$pageTitleTranslated} - {$currentJournal->getLocalizedTitle()|strip_tags|escape}</title>
        
        <meta name="description" content="{$metaSearchDescription|escape}" />
        <meta name="keywords" content="{$metaSearchKeywords|escape}" />
        <meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />

	{$metaCustomHeaders}
	
	{if $displayFavicon}<link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />{/if}
	<link rel="stylesheet" href="{$baseUrl}/lib/sep/styles/sep.css" type="text/css" />
	<!-- <link rel="stylesheet" href="{$baseUrl}/lib/sep/styles/common.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" />-->
	<link rel="stylesheet" href="{$baseUrl}/styles/compiled.css" type="text/css" /> 

	<!-- Base Jquery -->
	{if $allowCDN}<script type="text/javascript" src="//www.google.com/jsapi"></script>
		<script type="text/javascript">{literal}
			<!--
			// Provide a local fallback if the CDN cannot be reached
			if (typeof google == 'undefined') {
				document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/sep/js/lib/jquery/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));
				document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/sep/js/lib/jquery/plugins/jqueryUi.min.js' type='text/javascript'%3E%3C/script%3E"));
			} else {
				google.load("jquery", "{/literal}{$smarty.const.CDN_JQUERY_VERSION}{literal}");
				google.load("jqueryui", "{/literal}{$smarty.const.CDN_JQUERY_UI_VERSION}{literal}");
			}
			// -->
		{/literal}</script>
	{else}
		<script type="text/javascript" src="{$baseUrl}/lib/sep/js/lib/jquery/jquery.min.js"></script>
		<script type="text/javascript" src="{$baseUrl}/lib/sep/js/lib/jquery/plugins/jqueryUi.min.js"></script>
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
		<script type="text/javascript" src="{$baseUrl}/js/sep.min.js"></script>
	{else}
		{include file="common/minifiedScripts.tpl"}
	{/if}

	<!-- Form validation -->
	<script type="text/javascript" src="{$baseUrl}/lib/sep/js/lib/jquery/plugins/validate/jquery.validate.js"></script>
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
		{if $cssUrl == "$baseUrl/styles/cla.css"}
			<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
		{/if}
	{/foreach}

	{include file="common/head.tpl"}

	{foreach from=$stylesheets name="testUrl" item=cssUrl}
		{if $cssUrl != "$baseUrl/styles/cla.css"}
			<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
		{/if}
	{/foreach}

	{$additionalHeadData}
</head>

<body id="COSIRE-{$pageTitle|replace:'.':'-'}">
<a id="skip-to-content" href="#main">Skip to Main Content</a>
{include file="common/navbar.tpl"}

<div id="container">
    <div id="header" role="banner">
        <div id="headerTitle">
        <h1>
        {if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
        <figure>
        	<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
        </figure>
        {/if}
        <a title="Go to {$currentJournal->getLocalizedTitle()|strip_tags|escape}" href="{url page="$currentJournal"}">
        {if $displayPageHeaderTitle && is_array($displayPageHeaderTitle)}
        <figure>
        	<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" {if $displayPageHeaderTitleAltText != ''}alt="{$displayPageHeaderTitleAltText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} />
        </figure>

        {elseif $displayPageHeaderTitle}
        	{$displayPageHeaderTitle}
        {elseif $alternatePageHeader}
        	{$alternatePageHeader}
        {elseif $siteTitle}
        	{$siteTitle}
        {else}
        	{$applicationName}
        {/if}

        </a>
        </h1>

        </div>
    </div>
    
    <div id="navbarMenu" class="c-navbar" role="navigation">
	<ul class="menu" style="font-size: 1.125em;">
		<li id="home"><a href="{url page="$currentJournal"}" style="color: black;">{translate key="navigation.home"}</a></li>
		<li id="about"><a href="{url page="about" op="editorialPolicies"}" style="color: black;">{translate key="navigation.about"}</a></li>
		{if $currentJournal && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
		<li id="archives"><a href="{url page="issue" op="archive"}" style="color: black;">{translate key="navigation.categories.browse"}</a></li>
		{/if}
		<li id="submission"><a href="{url page="about" op="siteMap"}" style="color: black;">Submission Guidelines</a></li>
	</ul>
    </div>
    
    <div class="c-journal-header__identity c-journal-header__identity--default"></div>

{include file="common/breadcrumbs.tpl"}

<div id="body" role="main">

{if $leftSidebarCode || $rightSidebarCode}
	<div id="sidebar">
			<div id="leftSidebar" class="slide" role="complementary">
			    <ul class="c-sidemenu c-bar--menu c-nav c-nav--stacked c-collapse-at-lt-md">{if $currentJournal->getLocalizedSetting('focusScopeDesc') != ''}
			        <li id="linkJournalContact" class="c-sidemenu c-bar--menu"><a href="{url page="about" op="contact" anchor=""}">
			            <span class="c-flex c-flex--align-baseline">{translate key="about.journalContact"}</span></a></li>{/if}
			        <li id="linkEditorialBoard" class="c-sidemenu c-bar--menu"><a href="{url page="about" op="editorialTeam" anchor=""}">
			            <span class="c-flex c-flex--align-baseline">{translate key="about.editorialTeam"}</span></a></li>
			        <li id="linkReviewer" class="c-sidemenu c-bar--menu"><a href="{url page="about" op="displayMembership" path="$user->getId()"}">
			            <span class="c-flex c-flex--align-baseline">{translate key="about.displayMemberships"}</span></a></li>
			     </ul>
			</div>
		{if $rightSidebarCode}
			<div id="rightSidebar" class="slide" role="complementary">
				{$rightSidebarCode}
			</div>
		{/if}
	</div>
{/if}

<div id="main" class="" role="main">

<h2>{$pageTitleTranslated}</h2>

{if $pageSubtitle && !$pageSubtitleTranslated}{translate|assign:"pageSubtitleTranslated" key=$pageSubtitle}{/if}
{if $pageSubtitleTranslated}
	<h3>{$pageSubtitleTranslated}</h3>
{/if}

<div id="content" >

