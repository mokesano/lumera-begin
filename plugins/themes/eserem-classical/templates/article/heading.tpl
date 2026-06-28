{**
 * templates/article/head.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article View -- Head component.
 *
 *}
<a id="skip-to-content" href="#COSIRE">Skip to Main Content</a>
<div>
<style type="text/css">
.lm-masthead > :first-of-type > .lm-column, .lm-masthead > :first-child > .lm-column {padding-bottom: 3.2%;padding-top: 2.8%;}
</style>
<div class="lm-masthead Wrapper-4206806225" role="banner">
<div class="lm-live-area">
	<div class="lm-column">
		<h1 class="lm-brand"><a rel="home" href="/"><img src="//www.media.stipwunaraha.ac.id/static/stipwunaraha_logo_dark.svg" alt="Stipwunaraha Research Media"></a></h1>
		<ul class="navMenu nav-left" role="navigation">
			{if $siteCategoriesEnabled}
			<li id="categories"><a href="{url journal="index" page="index"}">{translate key="navigation.otherJournals"}</a></li>
			{/if}{* $categoriesEnabled *}
			<li id="getPublished"><a href="{url page="about" op="submissions" anchor="onlineSubmissions"}">{translate key="common.published"}</a></li>
			<li id="aboutCOSIRE"><a href="https://scofci.stipwunaraha.ac.id/organisasi/">{translate key="common.cosire"}</a></li>
	    </ul>
		<nav class="lm-additional-nav">
        <ul >
            {if $isUserLoggedIn}
            {if $hasOtherJournals}
			<li id="userJournal"><a href="{url journal="$currentJournal" page="user"}">My Journals</a></li>
			    {/if}
			<li id="userProfile"><a href="{url page="user" op="profile"}">My Profile</a></li>
			<li id="userHome"><a href="{url page="user"}">User Home</a></li>
			<li id="userLogOut"><a href="{url page="login" op="signOut"}">Log Out</a></li>
			{if $userSession->getSessionVar('signedInAs')}
			    <li id="userLogOutUser"><a href="{url page="login" op="signOutAsUser"}">Log Out as User</a></li>
		    	{/if}
    		{else}
			<li id="userlogin"><a href="{url page="login"}">{translate key="navigation.login"}</a></li>
			{if !$hideRegisterLink}
			<li id="userRegister"><a href="{url page="user" op="register"}" >{translate key="navigation.register"}</a></li>
			    {/if}
    		{/if}{* $isUserLoggedIn *}
		</ul>
		</nav>
<form class="lm-site-search" method="GET" id="search-bar" action="{url page="search" op="search"}">
			<div class="ms-search-field">
		<input type="text" id="query" name="query" value="" placeholder="Search" class="lm-search-term">
	</div>
		<button type="submit" value="Search" class="uk-button uk-button-primary btn-search"><svg class="lm-icon-search" viewBox="0 0 32 32"><path fill="inherit" d="M31.1 26.9l-8.8-8.8c1.1-1.8 1.7-3.9 1.7-6.1 0-6.6-5.4-12-12-12s-12 5.4-12 12 5.4 12 12 12c2.2 0 4.3-0.6 6.1-1.7l8.8 8.8c0.6 0.6 1.4 0.9 2.1 0.9s1.5-0.3 2.1-0.9c1.2-1.2 1.2-3.1 0-4.2zM3 12c0-5 4-9 9-9s9 4 9 9c0 5-4 9-9 9s-9-4-9-9z"></path></svg></button>
</form>		
</div> 
</div> <!-- End navbar -->
</div>

</div>

<div class="medium-bar">
<div class="sticky-outer-wrapper" style="">
	<div class="sticky-inner-wrapper" style="position: relative; z-index: 1; transform: translate3d(0px, 0px, 0px);">
		<div class="Toolbar" role="region" aria-label="download options and search" id="screen-reader-main-content">
			<div class="toolbar-container">
				<div class="u-show-from-lg col-lg-6">&nbsp;</div>
				<div class="buttons text-s pull-left pad-left">
					<button class="button show-toc-button button-anchor u-hide-from-lg u-margin-s-right" type="button"><svg focusable="false" viewBox="0 0 104 128" width="19.5" height="24" class="icon icon-list"><path d="m2e1 95a9 9 0 0 1 -9 9 9 9 0 0 1 -9 -9 9 9 0 0 1 9 -9 9 9 0 0 1 9 9zm0-3e1a9 9 0 0 1 -9 9 9 9 0 0 1 -9 -9 9 9 0 0 1 9 -9 9 9 0 0 1 9 9zm0-3e1a9 9 0 0 1 -9 9 9 9 0 0 1 -9 -9 9 9 0 0 1 9 -9 9 9 0 0 1 9 9zm14 55h68v1e1h-68zm0-3e1h68v1e1h-68zm0-3e1h68v1e1h-68z"></path></svg><span class="button-text"><span>Outline</span></span>
					</button>
					<div class="PdfDownloadButton">
						<div class="popover check-access-popover" id="check-access-popover">
							<div id="popover-trigger-check-access-popover">
								<button class="button button-anchor u-padding-0-left" role="button" aria-expanded="false" aria-haspopup="true" type="submit"><svg focusable="false" viewBox="0 0 32 32" width="24" height="24" class="icon icon-pdf-multicolor pdf-icon"><path d="M7 .362h17.875l6.763 6.1V31.64H6.948V16z" stroke="#000" stroke-width=".703" fill="#fff"></path><path d="M.167 2.592H22.39V9.72H.166z" stroke="#aaa" stroke-width=".315" fill="#da0000"></path><path fill="#fff9f9" d="M5.97 3.638h1.62c1.053 0 1.483.677 1.488 1.564.008.96-.6 1.564-1.492 1.564h-.644v1.66h-.977V3.64m.977.897v1.34h.542c.27 0 .596-.068.596-.673-.002-.6-.32-.667-.596-.667h-.542m3.8.036v2.92h.35c.933 0 1.223-.448 1.228-1.462.008-1.06-.316-1.45-1.23-1.45h-.347m-.977-.94h1.03c1.68 0 2.523.586 2.534 2.39.01 1.688-.607 2.4-2.534 2.4h-1.03V3.64m4.305 0h2.63v.934h-1.657v.894H16.6V6.4h-1.56v2.026h-.97V3.638"></path><path d="M19.462 13.46c.348 4.274-6.59 16.72-8.508 15.792-1.82-.85 1.53-3.317 2.92-4.366-2.864.894-5.394 3.252-3.837 3.93 2.113.895 7.048-9.25 9.41-15.394zM14.32 24.874c4.767-1.526 14.735-2.974 15.152-1.407.824-3.157-13.72-.37-15.153 1.407zm5.28-5.043c2.31 3.237 9.816 7.498 9.788 3.82-.306 2.046-6.66-1.097-8.925-4.164-4.087-5.534-2.39-8.772-1.682-8.732.917.047 1.074 1.307.67 2.442-.173-1.406-.58-2.44-1.224-2.415-1.835.067-1.905 4.46 1.37 9.065z" fill="#f91d0a"></path></svg><span class="button-text"><span class="pdf-download-label u-show-inline-from-lg">Get Access</span><span class="pdf-download-label-short u-hide-from-lg">Get Access</span></span>
								</button>
							</div>
						</div>
					</div>
					<div class="Social" id="social">
						<div class="popover social-popover" id="social-popover" aria-label="Share article on social media">
							<div id="popover-trigger-social-popover">
								<button class="button button-anchor" role="button" aria-expanded="false" aria-haspopup="true" type="button"><span class="button-text">Share</span>
								</button>
							</div>
						</div>
					</div>
					<div class="ExportCitation" id="export-citation">
						<div class="popover export-citation-popover" id="export-citation-popover" aria-label="Export or save citation">
							<div id="popover-trigger-export-citation-popover">
								<button class="button button-anchor" role="button" aria-expanded="false" aria-haspopup="true" type="button"><span class="button-text">Export</span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="quick-search-container pull-right pad-right u-show-from-md">
					<form id="quick-search" class="QuickSearch u-margin-xs-right" action="/search/advanced#submit" method="get">
						<input type="search" class="query" aria-label="Search ScienceDirect" name="qs" placeholder="Search ScienceDirect">
						<button class="button button-primary" type="submit" aria-label="Submit search"><span class="button-text"><svg focusable="false" viewBox="0 0 100 128" height="20" width="18.75" class="icon icon-search"><path d="m19.22 76.91c-5.84-5.84-9.05-13.6-9.05-21.85s3.21-16.01 9.05-21.85c5.84-5.83 13.59-9.05 21.85-9.05 8.25 0 16.01 3.22 21.84 9.05 5.84 5.84 9.05 13.6 9.05 21.85s-3.21 16.01-9.05 21.85c-5.83 5.83-13.59 9.05-21.84 9.05-8.26 0-16.01-3.22-21.85-9.05zm80.33 29.6l-26.32-26.32c5.61-7.15 8.68-15.9 8.68-25.13 0-10.91-4.25-21.17-11.96-28.88-7.72-7.71-17.97-11.96-28.88-11.96s-21.17 4.25-28.88 11.96c-7.72 7.71-11.97 17.97-11.97 28.88s4.25 21.17 11.97 28.88c7.71 7.71 17.97 11.96 28.88 11.96 9.23 0 17.98-3.07 25.13-8.68l26.32 26.32 7.03-7.03"></path></svg></span>
						</button><a class="advanced-search-link" href="/search/advanced#submit">Advanced</a>
						<input type="hidden" name="origin" value="article">
						<input type="hidden" name="zone" value="qSearch">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="c-journal-header__identity c-journal-header__identity--default"></div>
</div>

<div class="journal-page">
	<div id="article" class="Article" role="main">
<div class="live-area-wrapper">
	<div class="row rew">
	<div class="sidebar">
		<div class="column medium-min-3">
			<div class="p-separator">
				<div id="Table0fContents" class="leftSidebar"><span class="article-span u-font-sans">Table of Contents</span></div>
				<ul class="c-sidemenu c-bar--menu c-nav c-nav--stacked c-collapse-at-lt-md u-font-sans">
			        <li id="linkaAbstract" class="c-sidemenu c-bar--menu"><a href="#articleAbstract">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.abstract"}</span></a></li>
			        {if $galleys}<li id="linkDetail" class="c-sidemenu c-bar--menu"><a href="#detailArticle">
			            <span class="c-flex c-flex--align-baseline">Full Text</span></a></li>{/if}
			        <li id="linkDeclaration" class="c-sidemenu c-bar--menu"><a href="#Declaration">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.declaration"}</span></a></li>
			        <li id="linkReferences" class="c-sidemenu c-bar--menu"><a href="#References">
			            <span class="c-flex c-flex--align-baseline">{translate key="article.references"}</span></a></li>
			    </ul>
			</div>
    	</div>

		<aside class="column medium-3">
			<div class="c-article--view c-article--view-m">
				
				{include file="plugins/blocks/popularArticles/templates/block.tpl"}

				{if $issue->getLocalizedTitle($currentJournal)}{if $issue->getVolume()}
				<section class="SpecialIssueArticles" id="special-issue-articles">
					<div class="p-separator part-of-issue u-padding-s-bottom">
						<h2 class="part-of-issue-text u-h4 special-issue--value u-font-sans">Part of special issue:</h2>
						<div>
							<div class="special-issue">
								{if $currentJournal}<a class="part-of-issue-title file special-issue" href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}"><p class="u-font-sans title-issue">{$issue->getLocalizedTitle($currentJournal)|escape}</p></a>{/if}
								{if $issue->getLocalizedDescription()}<div class="part-of-issue-editors u-font-sans"><span>{$issue->getLocalizedDescription()|strip_unsafe_html|nl2br}</span></div>{/if}
							</div> 
						</div>
						{if $issueGalleys}
						{if (!$subscriptionRequired || $issue->getAccessStatus() == $smarty.const.ISSUE_ACCESS_OPEN || $subscribedUser || $subscribedDomain || ($subscriptionExpiryPartial && $issueExpiryPartial))}
							{assign var=hasAccess value=1}
						{else}
							{assign var=hasAccess value=0}
						{/if}
						{if $hasAccess || ($subscriptionRequired && $showGalleyLinks)}
						<button class="button-alternative DownloadFullIssue button-alternative-primary" type="button" id="download-full-issue"><svg focusable="false" viewBox="0 0 54 128" width="32" height="32" class="icon icon-navigate-right"><path d="m1 99l38-38-38-38 7-7 45 45-45 45z"></path></svg><span class="button-alternative-text u-font-sans">Download full issue</span></button>{/if}
						{/if}
					</div>
				</section>
				{/if}{/if}
			     <div class="p-separator u-interface">
			     	{if $galleys}
			     	{if $galley->isPdfGalley()}
			     	<div class="_largeButton c-button--secondary">
			     		<a target="_blank" title="Download this article in PDF format" href="{url page="article" op="view" path=$article->getBestArticleId($currentJournal)|to_array:$galley->getBestGalleyId($currentJournal)}" class="file" {if $galley->getRemoteURL()}target="_blank"{else}target="_blank"{/if}>Download PDF fulltext</a>
			         </div>
			         {/if}{/if}
			     	<div class="_largeButton c-button--secondary">
			     		<a target="_blank" href="{url page="rt" op="captureCite" path=$articleId|to_array:$galleyId}">Export citation</a>
			         </div>
			         <div class="_largeButton c-button--secondary">
			         	<a href="javascript:document.getElementsByTagName('body')[0].appendChild(document.createElement('script')).setAttribute('src','https://www.mendeley.com/minified/bookmarklet.js');">Save to Mendeley</a>
			         </div>
			     </div>

			     {if (!$subscriptionRequired || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || $subscribedUser || $subscribedDomain || ($subscriptionExpiryPartial && $articleExpiryPartial.$articleId))}
			     	{assign var=hasAccess value=1}
			     {else}
			     	{assign var=hasAccess value=0}
			     {/if}
			     <div class="p-separator articleInfo">
			        <div class="articleInfo">
			            <h3 class="p-section-title">Article Metrics</h3>
			            <ul class="p-section-title__item">
						    <li class="p-section-title__item citations"><a href="https://scholar.google.co.id/scholar_lookup?title={$article->getLocalizedTitle()|strip_unsafe_html}" target="_blank">
						    	<span class="p-section-item--name">Citations</span>
						    	<span class="p-section-item--value">not available</span></a></li>
			                <li class="p-section-title__item readers">
			                	<span class="p-section-item--name">Readers</span>
			                	<span class="p-section-item--value">{$article->getViews()}</span></li>
			                {if $article->getGalleys()}
			                {if $hasAccess || ($subscriptionRequired && $showGalleyLinks)}
			                {if $subscriptionRequired && $showGalleyLinks && $restrictOnlyPdf}
			                <li class="p-section-title__item download">
			                	<span class="p-section-item--name">Download</span>
			                	<span class="p-section-item--value">{$galley->getViews()}</span></li>{/if}{/if}{/if}
			                <br />
			                <li class="p-section-title__altmetric">Altmetric Attention score: {if $pubId}{$articleDOI|escape}{else}{/if}</li>
			                </ul>
                        </div>
			         
			        {if $pubId}
			        <script type="text/javascript" src="https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js"></script><div data-badge-popover="bottom" data-badge-type="bar" data-doi="{$articleDOI|escape}" class="altmetric-embed" target="_blank" >Altmetric badge</div>
			        {else}
			        <script type="text/javascript" src="https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js"></script><div data-badge-popover="bottom" data-badge-type="bar" data-doi="" class="altmetric-embed" target="_blank">Altmetric badge</div>
			        {/if}

			        <span class="__dimensions_badge_embed__" data-doi="{$articleDOI|escape}" data-style="small_rectangle" style="text-align: left;margin-top: .69em;"></span><script async src="https://badge.dimensions.ai/badge.js" charset="utf-8"></script>

			    </div>
                
                <div class="p-separator">
			        <h3 class="p-section-title">See Article Update</h3>
			        <!-- Start Crossmark Snippet v2.0 -->
			        <script src="https://crossmark-cdn.crossref.org/widget/v2.0/widget.js"></script><a data-target="crossmark"><img src="https://crossmark-cdn.crossref.org/widget/v2.0/logos/CROSSMARK_Color_horizontal.svg" width="150" /></a>
			        <!-- End Crossmark Snippet -->
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

				<div class="block" id="plumAnalyticsWidget">
					{if $blockTitle}<span class="blockTitle">{$blockTitle}</span>{/if}
					{if $htmlPrefix}{$htmlPrefix}{/if}
					<!-- Plum Analytics -->
					<script type="text/javascript" src="//cdn.plu.mx/widget-summary.js"></script><a href="https://plu.mx/plum/a/?doi={$articleDOI|escape}" class="plumx-summary plum-sciencedirect-theme" {if $hideWhenEmpty}data-hide-when-empty="{$hideWhenEmpty|escape}" {/if}{if $hidePrint}data-hide-print="{$hidePrint|escape}" {/if}{if $orientation}data-orientation="{$orientation|escape}" {/if}{if $popup}data-popup="{$popup|escape}" {/if}{if $border}data-border="{$border|escape}"{/if}{if $width}data-width="{$width|escape}"{/if}></a>
					<!-- /Plum Analytics -->
					{if $htmlSuffix}{$htmlSuffix}{/if}
				</div>

			</div>
		</aside>	

	</div>


<div class="column medium-plus-6" role="main">
<div id="content" class="articleContent">

