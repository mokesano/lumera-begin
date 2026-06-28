{**
 * templates/search/authorDetails.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Index of published articles by author.
 *
 *}
{strip}
{assign var="pageTitle" value="search.authorDetails"}
{include file="common/header-people.tpl"}
{/strip}

<header class="c-anchored-heading"><h3>{$lastName|escape}, {$firstName|escape}{if $middleName} {$middleName|escape}{/if}</h3><a class="c-anchored-heading__helper" href="#main">Back to top</a>
    </header>

<div class="authorDesc">{if $affiliation} {$affiliation|escape}{/if}{if $country}, {$country|escape}{/if}</div>

<div id="article__list">
    <h3 class="articleAuthor">{translate key="article.articles"} <span class="authorDetails"><em>by</em> {$firstName|escape|truncate:1:"."} {if $middleName} {$middleName|escape}{/if} {$lastName|escape} - ({$search.authorDetails|@count} articles)</span></h3>
</div>

<div id="results">
	<table class="tocArticle"><tbody><tr>
		<td id="articleInfoList" class="Info art-byAuthor">
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

		<div class="articleList--value">
			<div class="tocTitle"><a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}">{$article->getLocalizedTitle()|strip_unsafe_html}</a></div>

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
					{assign var=count value=$count+1} <a href="{url page="search" op="authors" path="view" firstName=$authorFirstName middleName=$authorMiddleName lastName=$authorLastName affiliation=$authorAffiliation country=$authorCountry}" class="authorName" title="View {if $fullname}{$fullname|escape}{/if} profile" aria-label="{if $fullname}{$fullname|escape}{/if}">{if $fullname}{$fullname|escape}</a>{else}{/if}{if $i==$authorCount-2}, and {elseif $i<$authorCount-1}, {/if}
				{/foreach}
			</div>
			{/if}

			<div id="value" class="info--article">
				<div class="infoPubJournal">In <a title="Go to {$journal->getLocalizedTitle()|escape}" target="_blank" href="{url journal=$journal->getPath()}"><em>{$currentJournal->getLocalizedTitle()|strip_tags|escape}</em></a> {$article->getDatePublished()|date_format:'%Y'} {$issue->getVolume()|strip_tags|escape}({$issue->getNumber()|escape}):{$article->getPages()|escape}</div>
				<div class="info--DOI">{assign var="doi" value=$article->getStoredPubId('doi')}
                    {if $article->getPubId('doi')}<a href="http://dx.doi.org/{$article->getPubId('doi')|escape}"><span class="fileDOI">DOI:</span> {$article->getPubId('doi')}</a>{/if} <span class="fileView">{$doi->getHits}</span></div>
				<div class="infoPubDate">Published: {$article->getDatePublished()|date_format:"%e %B %Y"}</div>
			</div>
		</div>

			<ul id="author-article-InfoList" class="tocMenuArticle ul-list">
				{if (!$issueUnavailable || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN)}
					{foreach from=$article->getGalleys() item=galley name=galleyList}
				<li class="tocMenuArticle li-list pubDOI"><a title="{$article->getLocalizedTitle()|strip_unsafe_html}" href="{url journal=$journal->getPath() page="article" op="download" path=$article->getBestArticleId()|to_array:$galley->getBestGalleyId($journal)}" class="file">Download {$galley->getGalleyLabel()|escape} <span class="fileSize">({$galley->getNiceFileSize()})</span> <span class="fileView">{$galley->getViews()} views</span></a></li>
					{/foreach}{/if}{/if}
				<li class="tocMenuArticle li-list pubDOI"><a title="{$article->getLocalizedTitle()|strip_unsafe_html}" target="_blank" href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}" class="file">{if $article->getLocalizedAbstract()}View Article{else}{translate key="article.details"}{/if}</a> <span class="fileView">{$article->getViews()} views</span></li>

				<li class="tocMenuArticle li-list pubDOI"></li>

				<div class="tocPages"></div>
			</ul>

		</div>
	{/foreach}</td></tr></tbody></table>

</div>

<br />

</div>
{include file="common/footer.tpl"}
