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
{if $affiliation} {$affiliation|escape}{/if}{if $country}, {$country|escape}{/if}
    <br />
<br />

<div id="article__list">
    <h3>{translate key="article.articles"}</h3>
</div>
<br />
<table class="tocArticle"><tbody><tr>
<td id="articleInfoList" class="Info">
{foreach from=$publishedArticles item=article}
	{assign var=issueId value=$article->getIssueId()}
	{assign var=issue value=$issues[$issueId]}
	{assign var=issueUnavailable value=$issuesUnavailable.$issueId}
	{assign var=sectionId value=$article->getSectionId()}
	{assign var=journalId value=$article->getJournalId()}
	{assign var=journal value=$journals[$journalId]}
	{assign var=section value=$sections[$sectionId]}
	{if $issue->getPublished() && $section && $journal}
	<div id="articleList">
	<ul id="articleInfoList" class="tocMenuArticle"><li id="articleInfoList" class="tocMenuArticle"><h7>{$section->getLocalizedTitle()|escape}</h7></li>
        </ul>
	<div class="tocTitle"><a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}">{$article->getLocalizedTitle()|strip_unsafe_html}</a></div>
	{if $article->getLocalizedAbstract()}
		<div class="abstract authorDetails">{$article->getLocalizedAbstract()|truncate:169:"..."|strip_unsafe_html|nl2br}</div>
		{/if}
	<ul id="author-article-InfoList" class="tocMenuArticle">
	    <li>Available online {$article->getDatePublished()|date_format:"%e %B %Y"}</li>
	    <li>{$issue->getIssueIdentification()|strip_unsafe_html|nl2br}</li></ul>
	<ul id="author-article-InfoList" class="tocMenuArticle">
	    <li class="tocMenuArticle pubDOI"><a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}" class="file">{if $article->getLocalizedAbstract()}{translate key="article.abstract"}{else}{translate key="article.details"}{/if}</a></li>
	    <li class="tocMenuArticle pubDOI">
		{if (!$issueUnavailable || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN)}
		{foreach from=$article->getGalleys() item=galley name=galleyList}<a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()|to_array:$galley->getBestGalleyId($journal)}" class="file">{$galley->getGalleyLabel()|escape}</a></li>
		{/foreach}
		{/if}
	{/if}</ul>
	</div>
{/foreach}</td></tr></tbody></table>

<br />

</div>
{include file="common/footer.tpl"}
