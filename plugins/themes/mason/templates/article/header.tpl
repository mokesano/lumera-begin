{**
 * templates/article/header.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article View -- Header component.
 *}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="--font-family-sans:Europa; --font-family-serif:Noto Serif;" lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
<head>
	<title>{$article->getLocalizedTitle()|strip_tags|escape} | {$article->getFirstAuthor(true)|strip_tags|escape} | {$currentJournal->getLocalizedTitle()|strip_tags|escape}</title>
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<meta name="description" content="{$article->getLocalizedTitle()|strip_tags|escape}" />
	{if $article->getLocalizedSubject()}
		<meta name="keywords" content="{$article->getLocalizedSubject()|escape}" />
	{/if}

	{if $displayFavicon}<link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />{/if}

	{include file="article/dublincore.tpl"}
	{include file="article/googlescholar.tpl"}
	{call_hook name="Templates::Article::Header::Metadata"}

	<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/pkp.css" type="text/css" />
<!-- 	<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/common.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" /> -->
	<link rel="stylesheet" href="{$baseUrl}/styles/compiled.css" type="text/css" />
<!-- 	<link rel="stylesheet" href="{$baseUrl}/styles/articleView.css" type="text/css" /> -->
	{if $journalRt && $journalRt->getEnabled()}
		<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/rtEmbedded.css" type="text/css" />
	{/if}

	{call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
	{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
<!-- 	{if $leftSidebarCode || $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/sidebar.css" type="text/css" />{/if}
	{if $leftSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/leftSidebar.css" type="text/css" />{/if}
	{if $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/rightSidebar.css" type="text/css" />{/if}
	{if $leftSidebarCode && $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/bothSidebars.css" type="text/css" />{/if} -->

	<!-- Base Jquery -->
	{if $allowCDN}<script type="text/javascript" src="https://www.google.com/jsapi"></script>
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
<body id="COSIRE-{$pageTitle|replace:'.':'-'}" class="article">

<div id="container">
{include file="common/navbar.tpl"}
<div id="header">
    <div id="headerTitle">
        <h1>
            <figure>
            {if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
            <img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
            </figure>
            {/if}
            <a title="Go to {$currentJournal->getLocalizedTitle()|strip_tags|escape}" href="{url page="$currentJournal"}">
            {if $displayPageHeaderTitle && is_array($displayPageHeaderTitle)}
            <figure>
            <img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" {if $displayPageHeaderTitleAltText != ''}alt="{$displayPageHeaderTitleAltText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} />
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
		<li id="about"><a href="{url page="about"}" style="color: black;">{translate key="navigation.about"}</a></li>

		{if $currentJournal && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			
			<li id="archives"><a href="{url page="issue" op="archive"}" style="color: black;">{translate key="navigation.categories.browse"}</a></li>
		{/if}

		
		{call_hook name="Templates::Common::Header::Navbar::CurrentJournal"}

		{foreach from=$navMenuItems item=navItem key=navItemKey}
			{if $navItem.url != '' && $navItem.name != ''}
				<li class="navItem" id="navItem-{$navItemKey|escape}"><a href="{if $navItem.isAbsolute}{$navItem.url|escape}{else}{$baseUrl}{$navItem.url|escape}{/if}">{if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}</a></li>
			{/if}
		{/foreach}
	</ul>
</div>

<div class="c-journal-header__identity c-journal-header__identity--default"></div>

<div id="body">

{if $leftSidebarCode || $rightSidebarCode}
	<div id="sidebar">
		{if $leftSidebarCode}
			<div id="leftSidebar">
			    <ul class="c-sidemenu c-bar--menu c-nav c-nav--stacked c-collapse-at-lt-md">
			        <li id="linkaAbstract" class="c-sidemenu c-bar--menu"><a href="#articleAbstract">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.abstract"}</span></a></li>
			        <li id="linkIntroduction" class="c-sidemenu c-bar--menu"><a href="#Introduction">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.introduction"}</span></a></li>
			        <li id="linkMethods" class="c-sidemenu c-bar--menu"><a href="#Methods">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.Methods"}</span></a></li>
			        <li id="linkResults" class="c-sidemenu c-bar--menu"><a href="#Results">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.results"}</span></a></li>
			        <li id="linkDiscussion" class="c-sidemenu c-bar--menu"><a href="#Discussion">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.discussion"}</span></a></li>
			        <li id="linkConclusion" class="c-sidemenu c-bar--menu"><a href="#Conclusion">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.conclusion"}</span></a></li>
			        <li id="linkAcknowlegments" class="c-sidemenu c-bar--menu"><a href="#Acknowlegments">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.acknowlegments"}</span></a></li>
			        <li id="linkReferences" class="c-sidemenu c-bar--menu"><a href="#References">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.references"}</span></a></li>
			        <li id="linkDeclaration" class="c-sidemenu c-bar--menu"><a href="#Declaration">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.declaration"}</span></a></li>
			        </ul>
			</div>
		{/if}
		{if $rightSidebarCode}
			<div id="rightSidebar"><br />
			    <div id="articleMetrics" class="articleAbstract-PDF">
			        <span id="articleMetrics" class="block" style="text-align: center;">Abstract Metrics</span>
			        <span class="title-number" style="display: block;font-size: 42px;line-height: 42px;margin: 0;padding: 0;color: #d54449;color: #d54449;text-align: center;">{$article->getViews()}</span>
			        <span class="title-text" style='font-size: 13px;text-transform: uppercase;color: #444;font-weight: 700;display: block;margin-top: 0;margin-bottom: 6px;color: #020202;text-align: center;'>total views</span>
			        <span class="__dimensions_badge_embed__" data-doi="{$articleDOI|escape}" data-style="small_rectangle" style="text-align: center;margin-bottom: 1.2em;margin-top: .69em;"></span><script async src="https://badge.dimensions.ai/badge.js" charset="utf-8"></script>
			    </div>
			    <p style="text-align: left; margin: 0;"><span class="blockTitle">Share This Article<br /></span></p>
			    <!-- Go to www.addthis.com/dashboard to customize your tools -->
			    <div class="addthis_inline_share_toolbox">&nbsp;</div>
			    <p style="text-align: left; margin: 0;"><span class="blockTitle">Citing articles<br /></span></p>
			    <div id="citingArticle" class="citingArticle">
			    </div>
				{$rightSidebarCode}
			</div>
		{/if}
	</div>
{/if}

<div id="main">

<div id="content">

