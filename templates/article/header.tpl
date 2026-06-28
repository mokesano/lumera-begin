{**
 * templates/article/header.tpl
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article View -- Header component.
 *}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
<head>
	<title>{$article->getLocalizedTitle()|strip_tags|escape} | {$article->getFirstAuthor(true)|strip_tags|escape} | {$currentJournal->getLocalizedTitle()|strip_tags|escape}</title>
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<meta name="citation_title" content="{$article->getLocalizedTitle()|strip_unsafe_html|nl2br}">
	{assign var="doi" value=$article->getStoredPubId('doi')}
    {if $article->getPubId('doi')}
		<meta name="citation_doi" content="{$article->getPubId('doi')}">
	{/if}
	{if $article->getLocalizedSubject()}
		<meta name="keywords" content="{$article->getLocalizedSubject()|strip_unsafe_html|nl2br}" />
	{/if}
	<meta name="description" content="{$article->getLocalizedAbstract()|strip_unsafe_html|nl2br|truncate:170:"..."}" />
	<meta name="citation_publisher" content="Stipwunaraha Research Media - Eserem">

	{if $displayFavicon}
	<link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />
	{else}
	{/if}
	<link rel="icon" type="img/ico" href="{$baseUrl}/favicon.ico" />

	{include file="article/dublincore.tpl"}
	{include file="article/googlescholar.tpl"}
	{call_hook name="Templates::Article::Header::Metadata"}

	<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/common.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/articleView.css" type="text/css" />

<!--
	<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/pkp.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/compiled.css" type="text/css" />
	{if $journalRt && $journalRt->getEnabled()}
		<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/rtEmbedded.css" type="text/css" />
	{/if}

	{call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
	{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
	{if $leftSidebarCode || $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/sidebar.css" type="text/css" />{/if}
	{if $leftSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/leftSidebar.css" type="text/css" />{/if}
	{if $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/rightSidebar.css" type="text/css" />{/if}
	{if $leftSidebarCode && $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/bothSidebars.css" type="text/css" />{/if}

	{foreach from=$stylesheets item=cssUrl}
		<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
	{/foreach}
-->
	<link rel="stylesheet" href="{$baseUrl}/styles/article.css" type="text/css" />

	<!-- Base Jquery -->
	{if $allowCDN}<script type="text/javascript" src="//www.google.com/jsapi"></script>
	<script type="text/javascript">{literal}
		// Provide a local fallback if the CDN cannot be reached
		if (typeof google == 'undefined') {
			document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));
			document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js' type='text/javascript'%3E%3C/script%3E"));
		} else {
			google.load("jquery", "{/literal}{$smarty.const.CDN_JQUERY_VERSION}{literal}");
			google.load("jqueryui", "{/literal}{$smarty.const.CDN_JQUERY_UI_VERSION}{literal}");
		}
	{/literal}</script>
	{else}
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js"></script>
	{/if}

	<!-- Compiled scripts -->
	{if $useMinifiedJavaScript}
		<script type="text/javascript" src="{$baseUrl}/js/pkp.min.js"></script>
	{else}
		{include file="common/minifiedScripts.tpl"}
	{/if}

	{$additionalHeadData}
	
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-110581662-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-110581662-2');
</script>
	
</head>

<body id="journal" class="articleView">
{if $galley}
	{if $galley->isPdfGalley()}
	{elseif $galley->isHTMLGalley()}

<div id="container">

<header id="header">
	<noscript>
	<div class="nojs-banner u-interface">
		<p>This service is more advanced with JavaScript available, learn more at <a href="http://activatejavascript.org" target="_blank" rel="noopener">http://activatejavascript.org</a></p>
    </div>
	</noscript>
	<div id="leaderboard" class="leaderboard u-hide" data-component="SpringerLink.GoogleAds" data-namespace="leaderboard">
		<div class="leaderboard__wrapper">
			<p class="leaderboard__label">Advertisement</p>
			<button class="leaderboard__hide" title="Hide this advertisement" data-track="click" data-track-action="Hide advertisement" data-track-label="">Hide</button>
			<div id="doubleclick-leaderboard-ad" class="leaderboard__ad u-pt-24"></div>
		</div>
	</div>

<div id="navbar">
	
	<span class="logo-brand"><a id="logo" class="brand" href="{$baseUrl}"><img src="//stipwunaraha.ac.id/static/images/classical/logo_high_res.png" alt="Logo Stipwunaraha" title="Stipwunaraha for Research &amp; Development"></a></span>

	<ul class="menu">

		{if $siteCategoriesEnabled}
			<li id="categories"><a href="{url journal="index" page="search" op="categories"}">Explore Journals</a></li>
		{/if}{* $categoriesEnabled *}

		{if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			<li id="search"><a href="{url page="search"}">{translate key="navigation.search"} <svg width="12" height="12" viewBox="222 151 12 12" version="1.1" xmlns="http://www.w3.org/2000/svg" focusable="false" aria-hidden="true" role="presentation">
                    <path d="M227 159C228.7 159 230 157.7 230 156 230 154.3 228.7 153 227 153 225.3 153 224 154.3 224 156 224 157.7 225.3 159 227 159L227 159 227 159 227 159ZM230 160.1L231.1 159 233.9 161.7C234.2 162.1 234.2 162.6 233.9 162.9 233.6 163.2 233.1 163.2 232.7 162.9L230 160.1 230 160.1 230 160.1 230 160.1ZM227 161L227 161C224.2 161 222 158.8 222 156 222 153.2 224.2 151 227 151 229.8 151 232 153.2 232 156 232 158.8 229.8 161 227 161L227 161 227 161 227 161 227 161Z" stroke="none" fill-rule="evenodd"></path>
                </svg></a></li>
		{/if}

		<li id="about"><a href="{url page="about"}">{translate key="navigation.about"}</a></li>

		{if $isUserLoggedIn}
			<li id="userHome"><a href="{if $hasOtherJournals}{url journal="index" page="user"}{else}{url page="user"}{/if}">{translate key="navigation.userHome"}</a></li>
		{else}
			<li id="login"><a href="{url page="login"}">{translate key="navigation.login"}</a></li>
			{if !$hideRegisterLink}
				<li id="register"><a href="{url page="user" op="register"}">{translate key="navigation.register"}</a></li>
			{/if}
		<li id="about"><a href="{url page="about"}">{translate key="navigation.about"}</a></li>
		{/if}{* $isUserLoggedIn *}

	</ul>
</div>
</header>

<article id="body">

{if $leftSidebarCode || $rightSidebarCode}
	<div id="sidebar">
		{if $rightSidebarCode}
			<div id="rightSidebar">
				{$rightSidebarCode}
			</div>
		{/if}
	</div>
{/if}

<div id="main">

<div id="breadcrumb">
	<a href="{url page="index"}" target="_parent">{translate key="navigation.home"}</a> &gt;
	{if $issue}<a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}" target="_parent">{$issue->getIssueIdentification(false,true)|escape}</a> &gt;{/if}
	<a href="{url page="article" op="view" path=$articleId|to_array:$galleyId}" class="current" target="_parent">{$article->getFirstAuthor(true)|escape}</a>
</div>

<div id="content" class="c-page-layout c-page-layout--article">

	{/if}
{else}

<div id="container">

<header id="header">
	<noscript>
	<div class="nojs-banner u-interface">
		<p>This service is more advanced with JavaScript available, learn more at <a href="http://activatejavascript.org" target="_blank" rel="noopener">http://activatejavascript.org</a></p>
    </div>
	</noscript>
	<div id="leaderboard" class="leaderboard u-hide" data-component="SpringerLink.GoogleAds" data-namespace="leaderboard">
		<div class="leaderboard__wrapper">
			<p class="leaderboard__label">Advertisement</p>
			<button class="leaderboard__hide" title="Hide this advertisement" data-track="click" data-track-action="Hide advertisement" data-track-label="">Hide</button>
			<div id="doubleclick-leaderboard-ad" class="leaderboard__ad u-pt-24"></div>
		</div>
	</div>

<div id="navbar">
	
	<span class="logo-brand"><a id="logo" class="brand" href="{$baseUrl}"><img src="//stipwunaraha.ac.id/static/images/classical/logo_high_res.png" alt="Logo Stipwunaraha" title="Stipwunaraha for Research &amp; Development"></a></span>

	<ul class="menu">

		{if $siteCategoriesEnabled}
			<li id="categories"><a href="{url journal="index" page="search" op="categories"}">Explore Journals</a></li>
		{/if}{* $categoriesEnabled *}

		{if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			<li id="search"><a href="{url page="search"}">{translate key="navigation.search"} <svg width="12" height="12" viewBox="222 151 12 12" version="1.1" xmlns="http://www.w3.org/2000/svg" focusable="false" aria-hidden="true" role="presentation">
                    <path d="M227 159C228.7 159 230 157.7 230 156 230 154.3 228.7 153 227 153 225.3 153 224 154.3 224 156 224 157.7 225.3 159 227 159L227 159 227 159 227 159ZM230 160.1L231.1 159 233.9 161.7C234.2 162.1 234.2 162.6 233.9 162.9 233.6 163.2 233.1 163.2 232.7 162.9L230 160.1 230 160.1 230 160.1 230 160.1ZM227 161L227 161C224.2 161 222 158.8 222 156 222 153.2 224.2 151 227 151 229.8 151 232 153.2 232 156 232 158.8 229.8 161 227 161L227 161 227 161 227 161 227 161Z" stroke="none" fill-rule="evenodd"></path>
                </svg></a></li>
		{/if}

		<li id="about"><a href="{url page="about"}">{translate key="navigation.about"}</a></li>

		{if $isUserLoggedIn}
			<li id="userHome"><a href="{if $hasOtherJournals}{url journal="index" page="user"}{else}{url page="user"}{/if}">{translate key="navigation.userHome"}</a></li>
		{else}
			<li id="login"><a href="{url page="login"}">{translate key="navigation.login"}</a></li>
			{if !$hideRegisterLink}
				<li id="register"><a href="{url page="user" op="register"}">{translate key="navigation.register"}</a></li>
			{/if}
		<li id="about"><a href="{url page="about"}">{translate key="navigation.about"}</a></li>
		{/if}{* $isUserLoggedIn *}

	</ul>
</div>
</header>

<article id="body">

{if $leftSidebarCode || $rightSidebarCode}
	<div id="sidebar">
		{if $rightSidebarCode}
			<div id="rightSidebar">
				{$rightSidebarCode}
			</div>
		{/if}
	</div>
{/if}

<div id="main">

<div id="breadcrumb">
	<a href="{url page="index"}" target="_parent">{translate key="navigation.home"}</a> &gt;
	{if $issue}<a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}" target="_parent">{$issue->getIssueIdentification(false,true)|escape}</a> &gt;{/if}
	<a href="{url page="article" op="view" path=$articleId|to_array:$galleyId}" class="current" target="_parent">{$article->getFirstAuthor(true)|escape}</a>
</div>

<div id="content" class="c-page-layout c-page-layout--article">

{/if}