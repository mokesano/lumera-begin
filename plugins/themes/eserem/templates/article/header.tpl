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

	<link rel="stylesheet" href="{$baseUrl}/lib/sep/styles/sep.css" type="text/css" />
<!-- 	<link rel="stylesheet" href="{$baseUrl}/lib/sep/styles/common.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" /> -->
	<link rel="stylesheet" href="{$baseUrl}/styles/compiled.css" type="text/css" />
<!-- 	<link rel="stylesheet" href="{$baseUrl}/styles/articleView.css" type="text/css" /> -->
	{if $journalRt && $journalRt->getEnabled()}
		<link rel="stylesheet" href="{$baseUrl}/lib/sep/styles/rtEmbedded.css" type="text/css" />
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
			document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/sep/js/lib/jquery/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));
			document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/sep/js/lib/jquery/plugins/jqueryUi.min.js' type='text/javascript'%3E%3C/script%3E"));
		} else {
			google.load("jquery", "{/literal}{$smarty.const.CDN_JQUERY_VERSION}{literal}");
			google.load("jqueryui", "{/literal}{$smarty.const.CDN_JQUERY_UI_VERSION}{literal}");
		}
	{/literal}</script>
	{else}
	<script type="text/javascript" src="{$baseUrl}/lib/sep/js/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="{$baseUrl}/lib/sep/js/lib/jquery/plugins/jqueryUi.min.js"></script>
	{/if}

	<!-- Compiled scripts -->
	{if $useMinifiedJavaScript}
		<script type="text/javascript" src="{$baseUrl}/js/sep.min.js"></script>
	{else}
		{include file="common/minifiedScripts.tpl"}
	{/if}

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
<body id="COSIRE-{$pageTitle|replace:'.':'-'}" class="article">

<div id="container">
{include file="common/navbar.tpl"}
<div id="header" class="articleHeader">
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

<div id="navbarMenu" class="c-navbar c-Article--menu" role="navigation">
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

<div id="body articleView" class="articleView">

{if $leftSidebarCode || $rightSidebarCode}
	<div id="sidebar">
		{if $leftSidebarCode}
			<div id="leftSidebar">
				<div id="Table0fContents"><span class="article-span">Table of Contents</span></div>
				<ul class="c-sidemenu c-bar--menu c-nav c-nav--stacked c-collapse-at-lt-md">
			        <li id="linkaAbstract" class="c-sidemenu c-bar--menu"><a href="#articleAbstract">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.abstract"}</span></a></li>
			        {if $galleys}{$galleys|escape}
			        <li id="linkDetail" class="c-sidemenu c-bar--menu"><a href="#detailArticle">
			            <span class="c-flex c-flex--align-baseline">Full Text</span></a></li>{/if}
			        <li id="linkDeclaration" class="c-sidemenu c-bar--menu"><a href="#Declaration">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.declaration"}</span></a></li>
			        <li id="linkReferences" class="c-sidemenu c-bar--menu"><a href="#References">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.references"}</span></a></li>
			        </ul>
			</div>
		{/if}
		{if $rightSidebarCode}
			<div id="rightSidebar" class="c-article--view c-article--view-m">
			     <div class="p-separator">
			     	{if $pdfDownloadLinkContainer}
			     	<div class="_largeButton c-button--primary">
			     	<a href="{url op="download" path=$articleId|to_array:$galley->getBestGalleyId($currentJournal)}">Download PDF</a>
			     	</div>
			     	{/if}
			        <div class="_largeButton c-button--primary">
			        	<a href="#">Download PDF</a>
			        </div>
			     <div class="_largeButton c-button--secondary">
			         <a href="#">Export citation</a>
			         </div>
			     </div>
			     
			     <div class="p-separator articleInfo">
			        <div class="articleInfo">
			            <h3 class="p-section-title">Metrics</h3>
			            <ul class="p-section-title__item">
			                <li class="p-section-title__item">Article accesses: {$article->getViews()} times</li>
			                <li class="p-section-title__item">Altmetric Attention scoce: {if $pubId}{$articleDOI|escape}{else}{/if}</li>
			                </ul>
                        </div>
			         
			        {if $pubId}
			        <script type="text/javascript" src="https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js"></script><div data-badge-popover="bottom" data-badge-type="bar" data-doi="{$articleDOI|escape}" class="altmetric-embed" target="_blank" >Altmetric badge</div>
			        {else}
			        <script type="text/javascript" src="https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js"></script><div data-badge-popover="bottom" data-badge-type="bar" data-doi="" class="altmetric-embed" target="_blank">Altmetric badge</div>
			        {/if}

			        <span class="__dimensions_badge_embed__" data-doi="{$articleDOI|escape}" data-style="small_rectangle" style="text-align: left;margin-top: .69em;"></span><script async src="https://badge.dimensions.ai/badge.js" charset="utf-8"></script>

			        </div>
                
                <div class="p-separator articleInfo">
			        <h3 class="p-section-title">See Article Update</h3>
			        <!-- Start Crossmark Snippet v2.0 -->
			        <script src="https://crossmark-cdn.crossref.org/widget/v2.0/widget.js"></script><a data-target="crossmark"><img src="https://crossmark-cdn.crossref.org/widget/v2.0/logos/CROSSMARK_Color_horizontal.svg" width="150" /></a>
			        <!-- End Crossmark Snippet -->
			        </div>
			        
                <div class="p-separator articleInfo">
			        <h3 class="p-section-title">Share This Article</h3>
			        <!-- Go to www.addthis.com/dashboard to customize your tools -->
			        <div class="addthis_inline_share_toolbox">&nbsp;</div>
			        
			    </div>
			    
			    <div class="p-separator">
			    	<div class="js-shown">
			    		<h3 class="p-section-title">Share this article</h3>
			    		<ul data-test="social-media-share-buttons" class="c-social-links">
			    			<li class="c-social-links__item">
			    				<button id="shareOnTwitter" class="js-btnShareOnTwitter" data-track="click" data-track-category="Article Page" data-track-action="Share Twitter" data-track-label="{$articleDOI|escape}">
			    					<span class="u-visually-hidden">Share on Twitter</span>
			    					<svg class="c-icon c-social-links__icon" width="24" height="24" aria-hidden="true"><use xlink:href="#icon-twitter"><symbol id="icon-twitter" viewBox="0 0 24 24"><circle fill="#26A7DF" cx="12" cy="12" r="12"></circle><path fill="#FFF" d="M5.903 6.768s2.176 2.883 5.953 3.082c0 0-.51-1.702 1.058-3.004 1.568-1.305 3.508-.2 3.879.292 0 0 1.104-.172 1.875-.691 0 0-.252.995-1.18 1.594 0 0 1.086-.146 1.596-.439 0 0-.533.853-1.447 1.503 0 0 .381 3.595-2.709 6.57-3.09 2.971-8.176 2.352-10.012.797 0 0 2.495.277 4.249-1.219 0 0-2.074-.037-2.671-1.973 0 0 1.036.08 1.215-.119 0 0-2.232-.539-2.254-2.873 0 0 .68.339 1.297.359 0-.001-2.153-1.557-.849-3.879z"></path></symbol></use>
			    					</svg>
			    				</button>
			    			</li>
			    			<li class="c-social-links__item">
			    				<button id="shareOnFacebook" class="js-btnShareOnFacebook" data-track="click" data-track-category="Article Page" data-track-action="Share Facebook" data-track-label="{$articleDOI|escape}">
			    					<span class="u-visually-hidden">Share on Facebook</span>
			    					<svg class="c-icon c-social-links__icon" width="24" height="24" aria-hidden="true"><use xlink:href="#icon-facebook"><symbol id="icon-facebook" viewBox="0 0 24 24"><circle fill="#4D67A4" cx="12" cy="12" r="12"></circle><path fill="#FFF" d="M8.396 10.143h2.137V8.165s-.092-1.292.892-2.274c.979-.979 2.298-.887 4.177-.724v2.21h-1.387s-.586-.013-.861.303c-.271.315-.24.764-.24.875v1.588h2.41l-.311 2.458h-2.116v6.336h-2.56v-6.345H8.396v-2.449z"></path></symbol></use>
			    					</svg>
			    				</button>
			    			</li>
			    			<li class="c-social-links__item">
			    				<button id="shareOnLinkedIn" class="js-btnShareOnLinkedIn" data-track="click" data-track-category="Article Page" data-track-action="Share LinkedIn" data-track-label="{$articleDOI|escape}">
			    					<span class="u-visually-hidden">Share on LinkedIn</span>
			    					<svg class="c-icon c-social-links__icon" width="24" height="24" aria-hidden="true"><use xlink:href="#icon-linkedin"><symbol id="icon-linkedin" viewBox="0 0 24 24"><circle fill="#0178B5" cx="12" cy="12" r="12"></circle><g fill="#FFF"><circle cx="8.022" cy="8.043" r="1.256"></circle><path d="M6.929 10.246h2.17v6.967h-2.17zm3.533 6.967h2.157v-3.594s-.078-1.627 1.219-1.627c1.301 0 1.211 1.231 1.211 1.635v3.586h2.183v-3.775s.129-2.745-1.472-3.191c-1.605-.445-2.661.071-3.219.985v-.985h-2.079v6.966z"></path></g></symbol></use>
			    					</svg>
			    				</button>
			    			</li>
			    			<li class="c-social-links__item">
			    				<button id="shareOnWeibo" class="js-btnShareOnWeibo" data-track="click" data-track-category="Article Page" data-track-action="Share Weibo" data-track-label="{$articleDOI|escape}">
			    					<span class="u-visually-hidden">Share on Weibo</span>
			    					<svg class="c-icon c-social-links__icon" width="24" height="24" aria-hidden="true">
			    						<use xlink:href="#icon-weibo"><symbol id="icon-weibo" viewBox="4 4 24 24"><circle fill="#C8E8F9" cx="16" cy="16" r="12"></circle><path fill="#FFF" d="M9.098 18.194c0 1.981 2.574 3.593 5.757 3.593 3.178 0 5.756-1.611 5.756-3.593 0-1.989-2.578-3.601-5.756-3.601-3.183.001-5.757 1.612-5.757 3.601"></path><path fill="#DF0A21" d="M14.991 21.496c-2.817.278-5.244-.996-5.428-2.85-.183-1.855 1.95-3.586 4.767-3.862 2.813-.278 5.243.996 5.428 2.849.18 1.855-1.957 3.584-4.767 3.863m5.628-6.155c-.24-.067-.404-.116-.279-.432.27-.688.299-1.278.004-1.699-.551-.791-2.062-.748-3.789-.022 0-.001-.548.241-.406-.191.266-.859.224-1.577-.191-1.993-.937-.942-3.437.037-5.577 2.18-1.602 1.61-2.533 3.317-2.533 4.789 0 2.817 3.606 4.533 7.13 4.533 4.626 0 7.701-2.696 7.701-4.834.001-1.292-1.085-2.027-2.06-2.331"></path><path fill="#F4992C" d="M23.689 10.182a4.492 4.492 0 0 0-4.283-1.39.651.651 0 1 0 .269 1.275 3.2 3.2 0 0 1 3.045.99 3.224 3.224 0 0 1 .672 3.138.647.647 0 0 0 .418.823.647.647 0 0 0 .816-.421v-.003a4.51 4.51 0 0 0-.937-4.412"></path><path fill="#F4992C" d="M21.973 11.736a2.183 2.183 0 0 0-2.086-.679.56.56 0 0 0-.428.667.554.554 0 0 0 .662.43v.001c.361-.075.754.034 1.018.33.266.299.34.698.227 1.054a.563.563 0 0 0 .359.706.563.563 0 0 0 .709-.362 2.2 2.2 0 0 0-.461-2.147"></path><path fill="#13110C" d="M15.143 18.139c-.1.17-.315.251-.483.179-.168-.07-.222-.255-.128-.42.097-.167.311-.248.479-.182.165.062.228.252.132.423m-.896 1.155c-.271.434-.854.625-1.295.425-.433-.195-.561-.707-.285-1.128.269-.426.832-.609 1.265-.427.443.183.58.688.315 1.13m1.024-3.084c-1.34-.351-2.852.32-3.434 1.506-.597 1.206-.021 2.546 1.33 2.984 1.402.453 3.055-.243 3.629-1.543.569-1.275-.142-2.587-1.525-2.947"></path></symbol></use>
			    					</svg>
			    				</button>
			    			</li>
			    			
			    			<li class="c-social-links__item">
			    				<button id="shareOnReddit" class="js-btnShareOnReddit" data-track="click" data-track-category="Article Page" data-track-action="Share Reddit" data-track-label="{$articleDOI|escape}">
			    					<span class="u-visually-hidden">Share on Reddit</span>
			    					<svg class="c-icon c-social-links__icon" width="24" height="24" aria-hidden="true">
			    						<use xlink:href="#icon-reddit"><symbol id="icon-reddit" viewBox="0 0 24 24"><circle fill="#BCBCBC" cx="12" cy="12" r="12"></circle><path fill="#FFF" d="M4.661 9.741c.941 0 1.703.761 1.703 1.704 0 .938-.762 1.705-1.703 1.705s-1.704-.767-1.704-1.705c0-.943.763-1.704 1.704-1.704zm13.844 0a1.704 1.704 0 1 1 .001 3.409 1.704 1.704 0 0 1-.001-3.409z"></path><path fill="#FFF" d="M11.736 8.732c4.285 0 7.762 2.283 7.762 5.104 0 2.812-3.477 5.1-7.762 5.1-4.288 0-7.762-2.285-7.762-5.1.001-2.82 3.474-5.104 7.762-5.104z"></path><path fill="#010101" d="M11.736 19.262c-4.461 0-8.088-2.437-8.088-5.426 0-2.994 3.626-5.431 8.088-5.431 4.457 0 8.087 2.437 8.087 5.431 0 2.989-3.63 5.426-8.087 5.426zm0-10.205c-4.104 0-7.438 2.145-7.438 4.779 0 2.633 3.334 4.773 7.438 4.773 4.098 0 7.437-2.142 7.437-4.773 0-2.636-3.339-4.779-7.437-4.779z"></path><circle fill="#FFF" cx="18.014" cy="5.765" r="1.385"></circle><path fill="#010101" d="M18.014 7.456a1.694 1.694 0 0 1-1.695-1.691c0-.934.764-1.694 1.695-1.694s1.693.762 1.693 1.694c0 .934-.762 1.691-1.693 1.691zm0-2.734c-.574 0-1.043.469-1.043 1.043s.469 1.041 1.043 1.041a1.042 1.042 0 0 0 0-2.084zM3.818 13.275a2.068 2.068 0 0 1-1.068-1.811 2.074 2.074 0 0 1 3.538-1.466l-.458.462a1.412 1.412 0 0 0-1.007-.42 1.424 1.424 0 0 0-.688 2.669l-.317.566zm15.866 0l-.316-.566a1.43 1.43 0 0 0 .73-1.245c0-.784-.635-1.424-1.42-1.424-.381 0-.736.149-1.008.42l-.459-.462a2.074 2.074 0 1 1 2.473 3.277z"></path><path fill="#F04B23" d="M9.165 11.604c.704 0 1.272.564 1.272 1.27a1.273 1.273 0 1 1-1.272-1.27zm5.321 0a1.274 1.274 0 1 1-1.275 1.27c0-.704.57-1.27 1.275-1.27z"></path><path fill="#010101" d="M11.79 8.915a.327.327 0 0 1-.307-.44l1.472-4.181 3.616.862c.177.044.283.22.238.395a.32.32 0 0 1-.391.239l-3.045-.729-1.275 3.632a.334.334 0 0 1-.308.222zm-.069 8.376c-2.076 0-2.908-.939-2.943-.982a.332.332 0 0 1 .035-.461.334.334 0 0 1 .459.033c.019.021.713.758 2.449.758 1.766 0 2.539-.763 2.549-.767a.324.324 0 1 1 .469.446c-.04.043-.954.973-3.018.973z"></path></symbol></use>
			    					</svg>
			    				</button>
			    			</li>
			    		</ul>
			    	</div>
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

				{$rightSidebarCode}

			</div>
		{/if}
	</div>
{/if}

<div id="main" class="articleMain">

<div id="content" class="articleContent">

