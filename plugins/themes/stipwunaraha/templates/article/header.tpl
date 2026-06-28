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
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" >
<html  class="js svg" xmlns="http://www.w3.org/1999/xhtml" style="--font-family-sans:Europa; --font-family-serif:Noto Serif;" lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
<head>
	<title>{$article->getLocalizedTitle()|strip_tags|escape} | {$article->getFirstAuthor(true)|strip_tags|escape} | {$currentJournal->getLocalizedTitle()|strip_tags|escape} | Stipwunaraha</title>
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

	{if $journalRt && $journalRt->getEnabled()}
		<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/rtEmbedded.css" type="text/css" />
	{/if}

	{call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
	{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}

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

<!-- Begin for PDF Galley -->
{if $galley}
	{if $galley->isPdfGalley()}
<!-- Add Favicon -->
	<link rel="icon" type="img/ico" href="{$baseUrl}/favicon.ico" />	
	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/eserem-classical/css/stipwunaraha.PDF.css" type="text/css" />	
 	<link rel="stylesheet" href="{$baseUrl}/styles/articleView.css" type="text/css" />

	{elseif $galley->isHTMLGalley()}
<script type="text/javascript" src="{$baseUrl}/plugins/themes/eserem-classical/js/pdfobject.js"></script>
	{include file="article/head.tpl"}

<!-- MathJax -->
<script id="MathJax-script" src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js,{$baseUrl}/plugins/themes/eserem-classical/js/mathjax-MathJax-419b0a6/MathJax.js?config=TeX-MML-AM_CHTML"></script>
<!-- <script async src="https://cdn.jsdelivr.net/npm/mathjax@2.7.5/MathJax.js?config=TeX-MML-AM_CHTML"  integrity="sha256-nvJJv9wWKEm88qvoQl9ekL2J+k/RWIsaSScxxlsrv8k=" crossorigin="anonymous"></script>
<script type="text/javascript" async
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML">
</script>  -->
<script type="text/javascript" id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
<script type="text/javascript">
  MathJax.Hub.Configured()
</script>

	{/if}

{else}

	<link rel="stylesheet" href="{$baseUrl}/styles/compiled.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/eserem-classical/css/stipwunaraha.HTML.css" type="text/css" />		
<!-- Add theme style sheet -->
	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/eserem-classical/css/stipwunaraha.modern.css" type="text/css" />

	<!-- Default global locale keys for JavaScript -->
	{include file="common/jsLocaleKeys.tpl" }

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


<!-- Add View Port -->
	<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Add Favicon -->
	<link rel="icon" type="img/ico" href="{$baseUrl}/favicon.ico" />

<!-- Add fonts style sheet 
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
-->

<!-- Add theme style sheet -->
	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/eserem-classical/css/stipwunaraha.article.css" type="text/css" />

<!-- Common style sheet -->
	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/eserem/css/print.css" media="print" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/eserem-classical/css/summary.css" type="text/css" />

	{foreach from=$stylesheets name="testUrl" item=cssUrl}
		{if $cssUrl != "$baseUrl/styles/ojs.css"}
			<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
		{/if}
	{/foreach}

	{$additionalHeadData}
	
<!-- MathJax -->
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js,{$baseUrl}/plugins/themes/eserem-classical/js/mathjax-MathJax-419b0a6/MathJax.js?config=TeX-MML-AM_CHTML"></script>
<!-- <script async src="https://cdn.jsdelivr.net/npm/mathjax@2.7.5/MathJax.js?config=TeX-MML-AM_CHTML"  integrity="sha256-nvJJv9wWKEm88qvoQl9ekL2J+k/RWIsaSScxxlsrv8k=" crossorigin="anonymous"></script>
<script type="text/javascript" async
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML">
</script>  -->
<script type="text/javascript" id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
<script type="text/javascript">
  MathJax.Hub.Configured()
</script>

{/if} <!-- Finish for PDF Galley -->
</head>

<body id="COSIRE" class="article-view">
<div data-iso-key="_0">
{if $galley}
	{if $galley->isPdfGalley()}{/if}
	{if $galley->isHTMLGalley()}
		{include file="article/heading.tpl"}
	{/if}	
{else}
	{include file="article/heading.tpl"}
{/if}

