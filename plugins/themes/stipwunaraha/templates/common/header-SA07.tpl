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
<html class="js" xmlns="http://www.w3.org/1999/xhtml" style="--font-family-sans:Europa; --font-family-serif:Noto Serif;" lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
<head>
	<title>{$pageTitleTranslated} - {$currentJournal->getLocalizedTitle()|strip_tags|escape} | Stipwunaraha</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<meta name="description" content="{$metaSearchDescription|escape}" />
	<meta name="keywords" content="{$metaSearchKeywords|escape}" />

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

<body id="COSIRE">
<a id="skip-to-content" href="#main">Skip to Main Content</a>
{include file="common/navbar.tpl"}

<div id="content" class="search-result-page search-page">

<form id="sub-search" class="sub-search sub-search--has-flavour sub-search--eserem">
<div class="row layout-2">
<div class="controls col-aside columns small-12 large-3">	

	<div class="sub-search__filtering">
	<div class="refinement-controls"><a class="refine" href="#refine">Refine Search</a></div>
	<div class="refine-search"><h2>Refine Search</h2></div>
	<div id="facet-type" class="facet facet--refinable"><div class="facet-header"><h3>Content Type</h3></div>
		<ol>
        	<li class="facet-sub-false"><a class="facet-link facet-link-type__book" href="/gp/search?dnc=true&amp;facet-type=type__book&amp;query=" title="Filter by Content Type" onmousedown="wt.sendinfo({linkId: 'book', customClickParameter : { 5 : 'type'}});">
        		<span class="facet-percentage" style="width: 95.12%;"></span>
        		<span class="facet-title">Book</span>
        		<span class="facet-amount">33,695</span></a></li>
        	<li class="facet-sub-false"><a class="facet-link facet-link-type__series" href="/gp/search?dnc=true&amp;facet-type=type__series&amp;query=" title="Filter by Content Type" onmousedown="wt.sendinfo({linkId: 'series', customClickParameter : { 5 : 'type'}});">
        		<span class="facet-percentage" style="width: 2.54%;"></span>
        		<span class="facet-title">Series</span>
        		<span class="facet-amount">901</span></a></li>
        	<li class="facet-sub-false"><a class="facet-link facet-link-type__cms" href="/gp/search?dnc=true&amp;facet-type=type__cms&amp;query=" title="Filter by Content Type" onmousedown="wt.sendinfo({linkId: 'content', customClickParameter : { 5 : 'type'}});">
        		<span class="facet-percentage" style="width: 2.17%;"></span>
        		<span class="facet-title">Web Pages</span>
        		<span class="facet-amount">769</span></a></li>
        	<li class="facet-sub-false"><a class="facet-link facet-link-type__journal" href="/gp/search?dnc=true&amp;facet-type=type__journal&amp;query=" title="Filter by Content Type" onmousedown="wt.sendinfo({linkId: 'journal', customClickParameter : { 5 : 'type'}});">
        		<span class="facet-percentage" style="width: 0.17%;"></span>
        		<span class="facet-title">Journal</span>
        		<span class="facet-amount">59</span></a></li>
        </ol>
    </div>

    <div id="facet-subj" class="facet facet--extendable facet--refinable">
        <div class="facet-header"><h3>Topics</h3></div>
        <ol>
        	<li class="facet-sub-false"><a class="facet-link facet-link-subj__912000" href="/gp/search?dnc=true&amp;facet-subj=subj__912000&amp;query=" title="Filter by Topics" onmousedown="wt.sendinfo({linkId: '912000', customClickParameter : { 5 : 'subj'}});"><span class="facet-percentage" style="width: 5.55%;"></span>
        		<span class="facet-title">International Relations</span><span class="facet-amount">1,967</span></a></li>
        	<li class="facet-sub-false"><a class="facet-link facet-link-subj__911000" href="/gp/search?dnc=true&amp;facet-subj=subj__911000&amp;query=" title="Filter by Topics" onmousedown="wt.sendinfo({linkId: '911000', customClickParameter : { 5 : 'subj'}});"><span class="facet-percentage" style="width: 4.12%;"></span>
        		<span class="facet-title">Political Science</span><span class="facet-amount">1,458</span></a></li>
        	<li class="facet-sub-false"><a class="facet-link facet-link-subj__X35000" href="/gp/search?dnc=true&amp;facet-subj=subj__X35000&amp;query=" title="Filter by Topics" onmousedown="wt.sendinfo({linkId: 'X35000', customClickParameter : { 5 : 'subj'}});"><span class="facet-percentage" style="width: 3.10%;"></span>
        		<span class="facet-title">Gender Studies</span><span class="facet-amount">1,099</span></a></li>
        	<li class="facet-sub-false"><a class="facet-link facet-link-subj__833000" href="/gp/search?dnc=true&amp;facet-subj=subj__833000&amp;query=" title="Filter by Topics" onmousedown="wt.sendinfo({linkId: '833000', customClickParameter : { 5 : 'subj'}});"><span class="facet-percentage" style="width: 2.88%;"></span>
        		<span class="facet-title">British and Irish Literature</span><span class="facet-amount">1,020</span></a></li>
        	<li class="facet-sub-false"><a class="facet-link facet-link-subj__822000" href="/gp/search?dnc=true&amp;facet-subj=subj__822000&amp;query=" title="Filter by Topics" onmousedown="wt.sendinfo({linkId: '822000', customClickParameter : { 5 : 'subj'}});"><span class="facet-percentage" style="width: 2.80%;"></span>
        		<span class="facet-title">Twentieth-Century Literature</span><span class="facet-amount">991</span></a></li>
        </ol>
    </div>

    <div id="facet-pdate" class="facet facet--refinable">
        <div class="facet-header"><h3>Release Date</h3></div>
        <ol>
        	<li class="facet-sub-false"><a class="facet-link facet-link-pdate__older" href="/gp/search?dnc=true&amp;facet-pdate=pdate__older&amp;query=" title="Filter by Publication Date" onmousedown="wt.sendinfo({linkId: 'older', customClickParameter : { 5 : 'pdate'}});"><span class="facet-percentage" style="width: 86.22%;"></span><span class="facet-title">Older</span><span class="facet-amount">30,541</span></a></li>
        	<li class="facet-sub-false"><a class="facet-link facet-link-pdate__sixmonths" href="/gp/search?dnc=true&amp;facet-pdate=pdate__sixmonths&amp;query=" title="Filter by Publication Date" onmousedown="wt.sendinfo({linkId: 'sixmonths', customClickParameter : { 5 : 'pdate'}});"><span class="facet-percentage" style="width: 5.09%;"></span><span class="facet-title">Last 6 Months</span><span class="facet-amount">1,803</span></a></li>
        	<li class="facet-sub-false"><a class="facet-link facet-link-pdate__upcoming" href="/gp/search?dnc=true&amp;facet-pdate=pdate__upcoming&amp;query=" title="Filter by Publication Date" onmousedown="wt.sendinfo({linkId: 'upcoming', customClickParameter : { 5 : 'pdate'}});"><span class="facet-percentage" style="width: 3.90%;"></span><span class="facet-title">Upcoming</span><span class="facet-amount">1,381</span></a>
                </li>
            <li class="facet-sub-false"><a class="facet-link facet-link-pdate__threemonths" href="/gp/search?dnc=true&amp;facet-pdate=pdate__threemonths&amp;query=" title="Filter by Publication Date" onmousedown="wt.sendinfo({linkId: 'threemonths', customClickParameter : { 5 : 'pdate'}});"><span class="facet-percentage" style="width: 3.00%;"></span><span class="facet-title">Last 3 Months</span><span class="facet-amount">1,061</span></a></li>
            <li class="facet-sub-false"><a class="facet-link facet-link-pdate__onemonth" href="/gp/search?dnc=true&amp;facet-pdate=pdate__onemonth&amp;query=" title="Filter by Publication Date" onmousedown="wt.sendinfo({linkId: 'onemonth', customClickParameter : { 5 : 'pdate'}});"><span class="facet-percentage" style="width: 1.00%;"></span><span class="facet-title">Previous Month</span><span class="facet-amount">354</span></a></li>
        </ol>
    </div>

    <div id="facet-lan" class="facet facet--refinable"><div class="facet-header"><h3>Language</h3></div>
        <ol>
        	<li class="facet-sub-false"><a class="facet-link facet-link-lan__en" href="/gp/search?dnc=true&amp;facet-lan=lan__en&amp;query=" title="Filter by Language" onmousedown="wt.sendinfo({linkId: 'en', customClickParameter : { 5 : 'lan'}});"><span class="facet-percentage" style="width: 97.83%;"></span><span class="facet-title">English</span><span class="facet-amount">34,655</span></a></li>
        </ol>
    </div>
</div>

{if $leftSidebarCode || $rightSidebarCode}
	<div id="sidebar" class="sub-search--srm">
		{if $leftSidebarCode}
		{if $rightSidebarCode}
			<div id="leftSidebar">
				<!-- {$leftSidebarCode} -->
				{$rightSidebarCode}
			</div>
		{/if}
		{/if}
	</div>
{/if}

</div>

<div id="main-contents" class="col-main columns small-12 large-9" role="main" >

