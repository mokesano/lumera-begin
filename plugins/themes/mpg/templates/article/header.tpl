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
	
	<!-- PlumX -->
{if $currentJournal->getSetting('onlineIssn')}{assign var="issn" value=$currentJournal->getSetting('onlineIssn')}
{elseif $currentJournal->getSetting('printIssn')}{assign var="issn" value=$currentJournal->getSetting('printIssn')}
{elseif $currentJournal->getSetting('issn')}{assign var="issn" value=$currentJournal->getSetting('issn')}
{/if}
{if $issn}
	<meta name="citation_issn" content="{$issn|strip_tags|escape}"/>
{/if}	
	<meta name="citation_journal_title" content="{$currentJournal->getLocalizedTitle()|strip_tags|escape}"/>
	<meta name="citation_publisher" content="Stipwunaraha Publishing & Media LLC"/>	
	{if $article->getAbstract(null)}{foreach from=$article->getAbstract(null) key=metaLocale item=metaValue}
	<meta name="description" xml:lang="{$metaLocale|String_substr:0:2|escape}" content="{$metaValue|strip_tags|escape}"/>
	{/foreach}{/if}
	{if $article->getLocalizedSubject()}
		<meta name="keywords" content="{$article->getLocalizedSubject()|escape}" />{/if}
	<meta name="robots" content="INDEX,FOLLOW,NOARCHIVE,NOODP,NOYDIR">
	
	<!-- Favicon -->
	{if $displayFavicon}<link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />{/if}
	
	<!-- Citation Index -->
	{include file="article/googlescholar.tpl"}
	{include file="article/dublincore.tpl"}
	
	<!-- Viewport -->
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1" />
	{include file="common/head.tpl"}
	
	{call_hook name="Templates::Article::Header::Metadata"}
	
    <!-- stylesheet -->
	<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/pkp.css" type="text/css" />
<!-- 	<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/common.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" /> -->
	<link rel="stylesheet" href="{$baseUrl}/styles/compiled.css" type="text/css" />
<!-- 	<link rel="stylesheet" href="{$baseUrl}/styles/articleView.css" type="text/css" /> -->
	{if $journalRt && $journalRt->getEnabled()}
		<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/rtEmbedded.css" type="text/css" />
	{/if}
	<link rel="stylesheet" href="{$baseUrl}/styles/pdfView.css" type="text/css" />

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

	{foreach from=$stylesheets name="testUrl" item=cssUrl}
		{if $cssUrl != "$baseUrl/styles/ojs.css"}
			<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
		{/if}
	{/foreach}

	{$additionalHeadData}
</head>

<body id="COSIRE" class="article">
    
<div id="container">
{include file="common/navbar.tpl"}

<div id="header" style="display: none;">
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

<div id="navbarMenu" class="c-navbar" role="navigation" style="display: none;">
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

<div class="c-journal-header__identity c-journal-header__identity--default" style="display: none;"></div>

<div id="body" class="articleView">

{if $leftSidebarCode || $rightSidebarCode}
	<div id="sidebar">
		{if $leftSidebarCode}
			<div id="leftSidebar">
			    <ul class="c-sidemenu c-bar--menu c-nav c-nav--stacked c-collapse-at-lt-md">
			        <li id="linkaAbstract" class="c-sidemenu c-bar--menu"><a href="#articleAbstract">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.abstract"}</span></a></li>
			        <li id="linkDetail" class="c-sidemenu c-bar--menu"><a href="#detailArticle">
			            <span class="c-flex c-flex--align-baseline">Full Text</span></a></li>
			        <li id="linkDeclaration" class="c-sidemenu c-bar--menu"><a href="#Declaration">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.declaration"}</span></a></li>
			        <li id="linkReferences" class="c-sidemenu c-bar--menu"><a href="#References">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.references"}</span></a></li>
			        </ul>
			</div>
		{/if}
		{if $rightSidebarCode}
			<div id="rightSidebar" class="c-article--view c-article--view-m">
			    
			    <div id="articleMetrics" class="articleAbstract-PDF">
			        
			        <span id="articleMetrics" class="block" style="text-align: center;">Abstract Views</span>
			        <span class="title-number" style="display: block;font-size: 42px;line-height: 42px;margin: 0;padding: 0;color: #d54449;color: #d54449;text-align: center;">{$article->getViews()}</span>
			        <span class="title-text" style='font-size: 13px;text-transform: uppercase;color: #444;font-weight: 700;display: block;margin-top: 0;margin-bottom: 6px;color: #020202;text-align: center;'>total views</span>
			        <span class="__dimensions_badge_embed__" data-doi="{$articleDOI|escape}" data-style="small_rectangle" style="text-align: center;margin-bottom: 1.2em;margin-top: .69em;"></span><script async src="https://badge.dimensions.ai/badge.js" charset="utf-8"></script>
			        </div>
			     
			     <div class="p-separator">   
			     
			     <div class="_largeButton c-button--secondary">
			         <a target="_blank" href="{url page="rt" op="captureCite" path=$articleId|to_array:$galleyId}">Export citation</a>
			         </div>
			     <div class="_largeButton c-button--secondary">
			         <a href="javascript:document.getElementsByTagName('body')[0].appendChild(document.createElement('script')).setAttribute('src','https://www.mendeley.com/minified/bookmarklet.js');">Save to Mendeley</a>
			         </div>
			     </div>
			     
			     <div class="p-separator articleInfo">
			        <div class="articleInfo">
			            <h3 class="p-section-title">Metrics</h3>
			            <ul class="p-section-title__item">
			                <li class="p-section-title__item">Article accesses: {$article->getViews()} times</li>
			                <li class="p-section-title__item">Altmetric Attention</li>
			                </ul>
                        </div>
			         
			        {if $pubId}
			        <script type="text/javascript" src="https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js"></script><div data-badge-popover="left" data-badge-type="bar" data-doi="{$articleDOI|escape}" class="altmetric-embed" target="_blank" >Altmetric Attention</div>
			        {else}
			        <div data-badge-popover="left" data-badge-type="bar" data-doi="" class="altmetric-embed" target="_blank">Altmetric Attention</div>
			        {/if}
			        </div>
                
                <div class="p-separator articleInfo">
			        <h3 class="p-section-title">See Article Update</h3>
			        <!-- Start Crossmark Snippet v2.0 -->
			        <script src="https://crossmark-cdn.crossref.org/widget/v2.0/widget.js"></script>
			        <a data-target="crossmark"><img src="https://crossmark-cdn.crossref.org/widget/v2.0/logos/CROSSMARK_Color_horizontal.svg" width="150" /></a>
			        <!-- End Crossmark Snippet -->
			        </div>
			        
                <div class="p-separator articleInfo">
			        <h3 class="p-section-title">Share This Article</h3>
			        <!-- Go to www.addthis.com/dashboard to customize your tools -->
			        <div class="addthis_inline_share_toolbox">&nbsp;</div>
			        </div>
			    
			    
			    <div class="p-separator articleInfo">
			        <p style="text-align: left; margin: 0;"><span class="blockTitle">Citing articles<br /></span></p>
			        <div id="citingArticle" class="citingArticle">{call_hook name="citedby"}</div>
			        </div>
			        
			     <div class="block" id="plumAnalyticsWidget">
					{if $blockTitle}<span class="blockTitle">{$blockTitle}</span>{/if}
					{if $htmlPrefix}{$htmlPrefix}{/if}
					<!-- Plum Analytics -->
					<script type="text/javascript" src="//cdn.plu.mx/widget-summary.js"></script><a href="https://plu.mx/plum/a/?doi={$articleDOI|escape}" class="plumx-summary plum-sciencedirect-theme" {if $hideWhenEmpty}data-hide-when-empty="{$hideWhenEmpty|escape}" {/if}{if $hidePrint}data-hide-print="{$hidePrint|escape}" {/if}{if $orientation}data-orientation="{$orientation|escape}" {/if}{if $popup}data-popup="{$popup|escape}" {/if}{if $border}data-border="{$border|escape}"{/if}{if $width}data-width="{$width|escape}"{/if}></a>
					<!-- /Plum Analytics -->
					{if $htmlSuffix}{$htmlSuffix}{/if}
				</div>
				
			</div>
		{/if}
	</div>
{/if}

<div id="main">

<div id="content">

