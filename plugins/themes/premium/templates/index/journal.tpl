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
	<div id="journalDescription">
		<h3>Description</h3>
	{$journalDescription}</div>
{/if}

<a id="browseVolumeIssues" class="all btn btn-primary btn-monster" href="{url page="issue" op="archive"}">Browse All Volumes &amp; Issues</a>

{call_hook name="Templates::journal"}

<div id="articlesHome"><h2 class="articlesHome">{translate key="article.articles"}</h2>
	<ul class="menu steplist">
		<li class="current" role="presentation"><a href="#tab-1">Recent</a></li>
		<li role="presentation"><a href="#tab-2">Most accessed</a></li>
	</ul>

	<div id="tab-1" class="tocArticleTitleAuthors c-tab-content is-active" role="tabpanel">
	<table class="tocArticle">
		<tr>
			{foreach name=sections from=$publishedArticles item=section key=sectionId}
			{foreach from=$section.articles item=article}
			<td class="tocArticleTitleAuthors{if $showCoverPage} showCoverImage{/if} articleListHome">
				<ul id="articleInfoList" class="tocMenuArticle">
					<li>{if $section.title}<h7 class="tocSectionTitle">{$section.title|escape}</h7> | {/if}<h7>{$article->getDatePublished()|date_format:"%e %B %Y"}</h7></li>
				</ul>
				<div class="tocTitle">
					{if !$hasAccess || $hasAbstract}
					<a href="{url page="article" op="view" path=$article->getBestArticleId($currentJournal)}">{$article->getLocalizedTitle()|strip_unsafe_html}</a>
					{else}
					{$article->getLocalizedTitle()|strip_unsafe_html}
					{/if}
				</div>
				<div class="Authors authorName-Home">
					{assign var=count value=0}
                        {assign var=authors value=$article->getAuthors()}
                        {foreach from=$authors item=author name=authors key=i}
                            {assign var=authorCount value=$authors|@count}
                            {assign var=fullname value=$author->getFullName()}
                            {assign var="pageTitle" value="search.authorIndex"}
                            {assign var=authorFirstName value=$author->getFirstName()}
                            {assign var=authorMiddleName value=$author->getMiddleName()}
                            {assign var=authorLastName value=$author->getLastName()}
                            {assign var=authorAffiliation value=$author->getLocalizedAffiliation()}
                            {assign var=authorCountry value=$author->getCountry()}
                            {assign var=authorName value="$authorLastName, $authorFirstName"}{if $authorMiddleName != ''}
                            {assign var=authorName value="$authorName $authorMiddleName"}{/if}
                            {assign var="contact" value=$author->getData('primaryContact')}
                            {assign var=count value=$count+1} <a href="{url page="search" op="authors" path="view" firstName=$authorFirstName middleName=$authorMiddleName lastName=$authorLastName affiliation=$authorAffiliation country=$authorCountry}" class="authorName-Home" title="View {if $fullname}{$fullname|escape}{/if} profile" aria-label="{if $fullname}{$fullname|escape}{/if}">{if $fullname}{$fullname|escape}</a>{else}{/if}{if $i==$authorCount-2}, and {elseif $i<$authorCount-1}, {/if}
                        {/foreach}
				</div>
			</td>
		</tr>
		{/foreach}{* articles *}
		{/foreach}{* sections *}
	</table>
	</div>

	<div id="tab-2" class="b-main-contents c-tab-content" role="tabpanel">
		{foreach from=$popularArticles item=popularArticle}
		<a href="{url page="article" op="view" path=$popularArticle->getArticleId()}" title="{$popularArticle->getArticleTitle()|strip_unsafe_html}">{$popularArticle->getArticleTitle()|strip_unsafe_html}</a>
		{/foreach}
	</div>

</div>

</div>
</div>

<div id="main-item" class="main-contents" role="main" tabindex="-1">
    
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


{include file="common/footer-common.tpl"}

