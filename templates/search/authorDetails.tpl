{**
 * templates/search/authorDetails.tpl
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Index of published articles by author.
 *
 *}
{strip}
{assign var="pageTitle" value="search.authorDetails"}
{include file="common/header.tpl"}
{/strip}
<div id="authorDetails" class="details">
<header class="c-anchored-heading"><h3>{$lastName|escape}, {$firstName|escape}{if $middleName} {$middleName|escape}{/if}</h3><a class="c-anchored-heading__helper" href="#main">Back to top</a>
    </header>

<div class="authorDesc">{if $affiliation} {$affiliation|escape}{/if}{if $country}, {$country|escape}{/if}</div>

<div id="article__list">
    <h3 class="articleAuthor">{translate key="article.articles"} <span class="authorDetails"><em>by</em> {$firstName|escape|truncate:1:"."} {if $middleName} {$middleName|escape}{/if} {$lastName|escape}</span></h3>
</div>

<div id="results">
	<table class="tocArticle">
	    <tr><td id="articleInfoList" class="Info art-byAuthor">
			{foreach from=$publishedArticles item=article}
			{assign var=issueId value=$article->getIssueId()}
			{assign var=issue value=$issues[$issueId]}
			{assign var=issueUnavailable value=$issuesUnavailable.$issueId}
			{assign var=sectionId value=$article->getSectionId()}
			{assign var=journalId value=$article->getJournalId()}
			{assign var=journal value=$journals[$journalId]}
			{assign var=section value=$sections[$sectionId]}
			{if $issue->getPublished() && $section && $journal}
			<div id="articleList" class="Info">
				<ul id="articleInfoList" class="tocMenuArticle">
					<li id="articleInfoList" class="tocMenuArticle"><h7>{$section->getLocalizedTitle()|escape}</h7></li>
					<div class="ArtType">Open Access</div>
				</ul>
			<div class="tocTitle"><a title="Permanent link for {$article->getLocalizedTitle()|strip_unsafe_html}" href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}" target="_blank">{$article->getLocalizedTitle()|strip_unsafe_html}</a></div>

			{if $article->getLocalizedAbstract()}
			<div class="abstract authorDetails">{$article->getLocalizedAbstract()|truncate:200:"..."|strip_unsafe_html|nl2br}</div>

			<div class="tocAuthors">
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
					{assign var=count value=$count+1} <a href="{url page="search" op="authors" path="view" firstName=$authorFirstName middleName=$authorMiddleName lastName=$authorLastName affiliation=$authorAffiliation country=$authorCountry}" target="_blank" class="authorName" title="View {if $fullname}{$fullname|escape}{/if} profile" aria-label="{if $fullname}{$fullname|escape}{/if}">{if $fullname}{$fullname|escape}</a>{else}{/if}{if $i==$authorCount-2}, and {elseif $i<$authorCount-1}, {/if}
				{/foreach}
				In <a title="Go to {$journal->getLocalizedTitle()|escape}" target="_blank" href="{url journal=$journal->getPath()}"><em>{$journal->getLocalizedTitle()|escape}</a>&nbsp;({$article->getDatePublished()|date_format:'%Y'})</em>
			</div>
			{/if}

			<ul class="tocMenuArticle">
				<li class="infoPubJournal">{if !$currentJournal}In <a title="Go to {$journal->getLocalizedTitle()|escape}" target="_blank" href="{url journal=$journal->getPath()}"><em>{$journal->getLocalizedTitle()|escape}</em></a> &nbsp;&nbsp;{$article->getDatePublished()|date_format:'%Y'} Vol. {$issue->getVolume()|strip_tags|escape} No. {$issue->getNumber()|escape}{/if}</li></ul>
			<ul class="tocMenuArticle">
				<li class="infoPubDate">Published: {$article->getDatePublished()|date_format:"%e %B %Y"}</li>
				<li class="tocMenuArticle li-list pubDOI">{assign var="doi" value=$article->getStoredPubId('doi')}
                    {if $article->getPubId('doi')}<a title="Permanent link CrossRef for {$article->getLocalizedTitle()|strip_unsafe_html}" href="http://doi.org/{$article->getPubId('doi')|escape}" target="_blank"><span class="fileDOI">DOI:</span>{$article->getPubId('doi')}</a>{/if}</li></ul>

			<ul id="author-article-InfoList" class="tocMenuArticle ul-list">
			    
			    {if (!$issueUnavailable || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN)}
			    {foreach from=$article->getGalleys() item=galley name=galleyList}
				<li class="tocMenuArticle li-list pubDOI"><a title="Click for download '{$article->getLocalizedTitle()|strip_unsafe_html}'" href="{url journal=$journal->getPath() page="article" op="download" path=$article->getBestArticleId()|to_array:$galley->getBestGalleyId($journal)}" target="_blank" class="file">Download {$galley->getGalleyLabel()|escape} <span class="fileSize">({$galley->getNiceFileSize()}) {$galley->getViews()} views</span></a>
					</li>{/foreach}{/if}{/if}
				
				<li class="tocMenuArticle li-list pubDOI"><a title="Go to view '{$article->getLocalizedTitle()|strip_unsafe_html}'" href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}" target="_blank" class="file">{if $article->getLocalizedAbstract()}View Article{else}View {translate key="article.details"}{/if} <span class="fileView">{$article->getViews()} views</span></a></li>
				
				<div class="tocPages">Pages: {$article->getPages()|escape}</div>
			</ul>

		</div>
	{/foreach}</td></tr></table>

</div>

<br />

</div>
{include file="common/footer.tpl"}

