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
{include file="common/header-comm.tpl"}
{/strip}

{if $currentJournal && $currentJournal->getSetting('onlineIssn')}
	{assign var=issn value=$currentJournal->getSetting('onlineIssn')}
{elseif $currentJournal && $currentJournal->getSetting('printIssn')}
	{assign var=issn value=$currentJournal->getSetting('printIssn')}
{/if}
{if $printIssn} {else if $onlineIssn}
<p id="issnOverview">ISSN: {$currentJournal->getSetting('printIssn')} (Print), {$currentJournal->getSetting('onlineIssn')} (Online)</p>
{/if}

{if $currentJournal->getLocalizedSetting('history') != ''}
<div id="journal-history-link">
	<span class="icon-container info">
		This journal was previously published under other titles
        <a href="{url page="about" op="history" anchor=""}">(view Journal {translate key="about.history"})
        </a>
    </span>
</div>
{/if}

{if $journalDescription}
	<div id="journalDescription">{$journalDescription}</div>
{/if}

<a id="browseVolumeIssues" class="all btn btn-primary btn-monster" href="{url page="issue" op="archive"}">Browse All Volumes &amp; Issues</a>

{call_hook name="Templates::journal"}

<div id="articlesHome"><h2 class="articlesHome">{translate key="article.articles"}</h2>

<div class="tocArticleTitleAuthors">
	<table class="tocArticle">
		<tr>
	{foreach name=sections from=$publishedArticles item=section key=sectionId}
	{foreach from=$section.articles item=article}
	<td class="tocArticleTitleAuthors{if $showCoverPage} showCoverImage{/if} articleListHome">
	    <ul id="articleInfoList" class="tocMenuArticle">
	        <li>
	            {if $section.title}<h7 class="tocSectionTitle">{$section.title|escape}</h7>{/if}
	        </li>
	        <li>
	            <h7>{$article->getDatePublished()|date_format:"%e %B %Y"}</h7>
	        </li>
	    </ul>
		<div class="tocTitle">
			{if !$hasAccess || $hasAbstract}
				<a href="{url page="article" op="view" path=$article->getBestArticleId($currentJournal)}">{$article->getLocalizedTitle()|strip_unsafe_html}</a>
			{else}
				{$article->getLocalizedTitle()|strip_unsafe_html}
			{/if}
		</div>
		<div class="tocAuthors">
			{if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
			{assign var=authors value=$article->getAuthors()}
			{foreach from=$authors item=author name=authors key=i}
			{assign var=authorCount value=$authors|@count}
			{$author->getFullName()|escape}{if $i==$authorCount-2} and {elseif $i<$authorCount-1}, {/if}{/foreach}
			{else}
				&nbsp;
			{/if}
		</div>
	</td>
		</tr>
	{/foreach}{* articles *}
	{/foreach}{* sections *}
	</table>
</div>

</div>

</div>
</div>

<div id="main-item" class="main-contents" role="main">
    
{if $additionalHomeContent}
<div id="additionalHomeContent" class="b-main-contents">{$additionalHomeContent}</div>
{/if}

{if $enableAnnouncementsHomepage}
	{* Display announcements *}
	<div id="announcementsHome" class="b-main-contents">
		<h3><a href="{url page="announcement"}">{translate key="announcement.announcementsHome"}</a></h3>
		{include file="announcement/list.tpl"}
	</div>
{/if}

<div id="PopularArticles" class="b-main-contents">
	<h2 class="articlesHome">{translate key="plugins.blocks.popularArticles.displayName"}</h2>
	{foreach from=$popularArticles item=popularArticle}
		<a href="{url page="article" op="view" path=$popularArticle->getArticleId()}" title="{$popularArticle->getArticleTitle()|escape}">{$popularArticle->getArticleTitle()|truncate:40:"..."|escape}</a>
	{/foreach}
</div>


{include file="common/footer-common.tpl"}

