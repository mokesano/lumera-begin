{**
 * templates/search/titleIndex.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display published articles by title
 *
 *}
{strip}
{assign var=pageTitle value="search.titleIndex"}
{include file="common/header-search.tpl"}
{/strip}

<div id="descriptionTitle">
    <p>Thank you for your interest in <em>{$currentJournal->getLocalizedTitle()|strip_tags|escape}</em>. The journal has recently switched publishers to COSIRE Id, who will host all back content. If you notice any missing content, please reach out to <a href="mailto:admin@stipwunaraha.ac.id">us</a>.</p>
    </div><br />

<div id="searchArticle">
	<script type="text/javascript">
		$(function() {ldelim}
			// Attach the form handler.
			$('#searchForm').pkpHandler('$.pkp.pages.search.SearchFormHandler');
		{rdelim});
	</script>
	<form method="post" id="searchForm" action="{url op="search"}">
		<table class="data">
			<tr valign="top">
				<td class="label"><label for="query">{translate key="search.searchAllCategories"}</label></td>
				<td class="value">
					{capture assign="queryFilter"}{call_hook name="Templates::Search::SearchResults::FilterInput" filterName="query" filterValue=$query}{/capture}
					{if empty($queryFilter)}
						<input type="text" id="query" name="query" size="40" maxlength="255" value="{$query|escape}" class="textField" />
					{else}
						{$queryFilter}
					{/if}
					&nbsp;
					<input type="submit" value="{translate key="common.search"}" class="button defaultButton" />
				</td>
			</tr>
			{if $siteSearch}
				<tr valign="top">
					<td class="label"><label for="searchJournal">{translate key="search.withinJournal"}</label></td>
					<td class="value"><select name="searchJournal" id="searchJournal" class="selectMenu">{html_options options=$journalOptions selected=$searchJournal}</select></td>
				</tr>
			{/if}
			{if $hasActiveFilters}
				<tr valign="top">
					<td colspan="2" class="label"><h4>{translate key="search.activeFilters"}</h4></td>
				</tr>
				{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="authors" filterValue=$authors key="search.author"}
				{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="title" filterValue=$title key="article.title"}
				{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="abstract" filterValue=$abstract key="search.abstract"}
				{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="galleyFullText" filterValue=$galleyFullText key="search.fullText"}
				{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="suppFiles" filterValue=$suppFiles key="article.suppFiles"}
				{include file="search/searchFilter.tpl" displayIf="activeFilter" filterType="date" filterName="dateFrom" filterValue=$dateFrom startYear=$startYear endYear=$endYear key="search.dateFrom"}
				{include file="search/searchFilter.tpl" displayIf="activeFilter" filterType="date" filterName="dateTo" filterValue=$dateTo startYear=$startYear endYear=$endYear key="search.dateTo"}
				{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="discipline" filterValue=$discipline key="search.discipline"}
				{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="subject" filterValue=$subject key="search.subject"}
				{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="type" filterValue=$type key="search.typeMethodApproach"}
				{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="coverage" filterValue=$coverage key="search.coverage"}
				{include file="search/searchFilter.tpl" displayIf="activeFilter" filterName="indexTerms" filterValue=$indexTerms key="search.indexTermsLong"}
			{/if}
		</table>
	</form>

    {call_hook name="Templates::Search::SearchResults::PreResults"}

    </div>

<br />

{if $currentJournal}
	{assign var=numCols value=3}
{else}
	{assign var=numCols value=4}
{/if}

<div id="results">
    <table class="tocArticle">
        <tbody>
            <tr class="TOC" valign="top">
                {iterate from=results item=result}
                {assign var=publishedArticle value=$result.publishedArticle}
                {assign var=article value=$result.article}
                {assign var=issue value=$result.issue}
                {assign var=issueAvailable value=$result.issueAvailable}
                {assign var=journal value=$result.journal}
                {assign var=sectionId value=$article->getSectionId()}
                {assign var=section value=$sections[$sectionId]}
                {if $issue->getPublished() && $section && $journal}
                <td class="tocArticleTitleAuthors">
                    <ul id="articleInfoList" class="tocMenuArticle">
                        <li><h7 class="tocSectionTitle">Open Access</h7>{/if}
                        </li>
                        </ul>
                    <div class="tocTitle">
                        <a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}">{$article->getLocalizedTitle()|strip_unsafe_html}</a></div>
                    <div class="tocAuthors">
                            {foreach from=$article->getAuthors() item=author name=authorList}{$author->getFullName()|escape}{if !$smarty.foreach.authorList.last}, {/if}{/foreach}</div>
                    <ul id="articleInfoList" class="tocMenuArticle">
                        <li><h7 class="tocSectionTitle">{if $currentJournal} {$issue->getVolume()|strip_tags|escape}:{$issue->getNumber()|escape}</a>: {$article->getPages()|escape}{/if}</h7></li>
                        </ul>
                    <ul id="articleInfoList" class="tocMenuArticle">
                        <li><h7>Available online {$article->getDatePublished()|date_format:"%e %B %Y"}</h7></li>
                        </ul>
                    <ul id="articleInfoList" class="tocMenuArticle">
                        <li><a href="{url journal=$journal->getPath() page="article" op="view" path=$publishedArticle->getBestArticleId($journal)}" class="file">{if $article->getLocalizedAbstract()}{translate key="article.abstract"}{else}{translate key="article.details"}{/if}</a></li>
                        <li>{if $issueAvailable}
                        {foreach from=$publishedArticle->getGalleys() item=galley name=galleyList}<a href="{url journal=$journal->getPath() page="article" op="view" path=$publishedArticle->getBestArticleId($journal)|to_array:$galley->getBestGalleyId($journal)}" class="file">{$galley->getGalleyLabel()|escape}</a>
                        {/foreach}{/if}</li>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>
<br />
    <br />
    
    <div id="colspan-anchor">
        <table width="100%">
            <tbody>
                <tr valign="bottom">
                {/iterate}
                {if $results->wasEmpty()}
                    <td colspan="{$numCols|escape}" class="nodata">{translate key="search.noResults"}</td>
                    </tr>
                {else}
                <tr><td width="50%" {if !$currentJournal}colspan="2" {/if}align="left">{page_info iterator=$results}</td>
                    <td width="50%" colspan="2" align="right">{page_links anchor="results" iterator=$results name="search"}</td>
                    </tr>
                {/if}
                </tbody>
            </table>
        </div>
    </div>
</div>
	
{include file="common/footer.tpl"}

