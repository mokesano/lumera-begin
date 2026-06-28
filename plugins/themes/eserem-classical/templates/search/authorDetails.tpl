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
{assign var="pageTitle" value="navigation.search"}
{include file="common/header-search.tpl"}
<div class="header">
	<div id="toolbar">
		<div id="tools">
			<div>
				<a id="tool-rss" href="/search.rss?facet-creator=%22Academician+Bohum%C3%ADr+Rosick%C3%BD%22" aria-describedby="rss-tooltip">
					<img class="icon" src="//www.stipwunaraha.ac.id/static/images/classical/rss.png" alt="Subscribe">
					<span class="tooltip" id="rss-tooltip" role="tooltip">Subscribe to this page via RSS</span>
				</a>
				<a id="tool-download" href="/search/csv?facet-creator=%22Academician+Bohum%C3%ADr+Rosick%C3%BD%22">
					<img src="//www.stipwunaraha.ac.id/static/images/classical/download.png" alt="Download" aria-describedby="download-tooltip">
					<span class="tooltip" id="download-tooltip" role="tooltip">Download search results (CSV)</span>
				</a>
    		</div>
		</div>
	</div>
	<h1 id="number-of-search-results-and-search-terms">
		<strong>{$publishedArticles|@count}</strong> Result(s)
	</h1>
	<p class="facet-constraint-message"> within <a class="facet-link" href="/search"> {$firstName|escape} {if $middleName} {$middleName|escape}{/if} {$lastName|escape} <img class="remove-hover" src="//www.stipwunaraha.ac.id/static/images/classical/remove-hover.png" alt="Remove this filter"></a></p>
</div>

<div id="authorDetails" class="details">
	<div id="only-searching-within">
	{if $profileImage}
	<img id="ID-" class="cover avatar cosire-author" title="{$firstName|escape} {if $middleName} {$middleName|escape}{/if} {$lastName|escape}" src="{$sitePublicFilesDir}/{$profileImage.uploadName}" alt="P_{$firstName|escape} {if $middleName} {$middleName|escape}{/if} {$lastName|escape}" height="auto" width="150" />
		{else}	
		<img id="ID-" class="cover avatar cosire-author" title="{$firstName|escape} {if $middleName} {$middleName|escape}{/if} {$lastName|escape}" src="//media.stipwunaraha.ac.id/static/contactPersonM.png" alt="P_{$firstName|escape} {if $middleName} {$middleName|escape}{/if} {$lastName|escape}" height="auto" width="150" />
	{/if}
	<style type="text/css">.cosire-author {margin-top: 0;float: right;}</style>	
	<header class="c-anchored-heading"><h3>{$firstName|escape}{if $middleName} {$middleName|escape}{/if} {$lastName|escape}</h3><a class="c-anchored-heading__helper" href="#main"></a>
    </header>
    <div class="authorDesc">{if $affiliation} {$affiliation|escape}{/if}{if $country}, {$country|escape}{/if}</div>
	</div>
</div>
{/strip}

<div class="functions-bar functions-bar-top">
	<div id="sort-results" class="sorting">
		<span>Sort By</span>
		<a class="btn selected" href="{url page="search" op="search?query=$query}">Relevance</a>
		<a class="btn" href="{url page="search" op="search?query=$query&amp;sortOrder=newestFirst}">Newest First</a>
		<a class="btn" href="{url page="search" op="search?query=$query&amp;sortOrder=oldestFirst}">Oldest First</a>
	</div>
	<span class="side-r" colspan="2" align="right"></span>
</div>

<ol id="results-list" class="content-item-list">
{foreach from=$publishedArticles item=article}
		{assign var=issueId value=$article->getIssueId()}
		{assign var=issue value=$issues[$issueId]}
		{assign var=issueUnavailable value=$issuesUnavailable.$issueId}
		{assign var=sectionId value=$article->getSectionId()}
		{assign var=journalId value=$article->getJournalId()}
		{assign var=journal value=$journals[$journalId]}
		{assign var=section value=$sections[$sectionId]}
			{if $issue->getPublished() && $section && $journal}

    {if $article->getGalleys()}
    <li>
    	{if $section->getLocalizedTitle()|escape}
		<p class="content-type">{$section->getLocalizedTitle()|escape}</p>
		{else}
		<p class="content-type">{translate key="rt.metadata.sep.peerReviewed"}</p>
		{/if}

        <div class="lozenges">
            <div class="open-access">
                <span class="lozenge lozenge--style1">Open Access</span>
            </div>
        </div>

		<h2>
			<a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}">{$article->getLocalizedTitle()|strip_unsafe_html}</a>
		</h2>

        {if $article->getLocalizedAbstract()}
        <p class="snippet">{$article->getLocalizedAbstract()|truncate:170:"..."|strip_unsafe_html|nl2br}</p>
        {/if}

		<p class="meta">
            <span class="authors">
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
			</span>
           in <span class="enumeration"><a title="Go to {$journal->getLocalizedTitle()|escape}" target="_blank" href="{url journal=$journal->getPath()}"><em>{$currentJournal->getLocalizedTitle()|truncate:45:"..."|strip_tags|escape}</a></span> <span class="year" title="{$issue->getDatePublished()|date_format:'%B %Y'}">({$issue->getDatePublished()|date_format:'%Y'})</em></span>
        </p>			 

		<!--	<div id="value" class="info--article">
				<div class="infoPubJournal">In <a title="Go to {$journal->getLocalizedTitle()|escape}" target="_blank" href="{url journal=$journal->getPath()}">{$currentJournal->getLocalizedTitle()|strip_tags|escape}</a> (<em>{$article->getDatePublished()|date_format:'%B %Y'}</em>) Volume {$issue->getVolume()|strip_tags|escape}, Issue {$issue->getNumber()|escape}, {$article->getPages()|escape} pp</div>
				<div class="info--DOI">{assign var="doi" value=$article->getStoredPubId('doi')}
                    {if $article->getPubId('doi')}<a title="Permanent link for {$article->getLocalizedTitle()|strip_tags|escape}" href="http://doi.org/{$article->getPubId('doi')|escape}"><span class="fileDOI">DOI:</span> {$article->getPubId('doi')}</a>{/if} {if $article->getViews('doi')}<span class="fileHit" title="{$article->getViews('doi')} click">{$article->getViews('doi')}</span>{/if}</div>
				<div class="infoPubDate">Published: {$article->getDatePublished()|date_format:"%e %B %Y"}</div>
			</div> -->

		<div class="actions">
			{if (!$issueUnavailable || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN)}
			{foreach from=$article->getGalleys() item=galley name=galleyList}
			<span class="action">
				<a title="{$article->getLocalizedTitle()|strip_tags|escape}" href="{url journal=$journal->getPath() page="article" op="download" path=$article->getBestArticleId()|to_array:$galley->getBestGalleyId($journal)}" class="file">Download {$galley->getGalleyLabel()|escape} <span class="fileSize">({$galley->getNiceFileSize()})</span></a> <span class="fileView">{$galley->getViews()} views</span>
			</span>&nbsp;
			{/foreach}{/if}
			
			<span class="action">
				<a title="{$article->getLocalizedTitle()|strip_tags|escape}" target="_blank" href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}" class="file">{if $article->getLocalizedAbstract()}View Article{else}{translate key="article.details"}{/if}</a> <span class="fileView">{$article->getViews()} views</span>
			</span>
			<div class="tocPages"></div>
		</div>
	</li>
	{else}
    <li class="no-access">
        <p class="no-access-message">
            <img src="//www.stipwunaraha.ac.id/static/images/classical/lock.png" alt="PDF file No Access" title="PDF file No Access">
        </p>
    	{if $section->getLocalizedTitle()|escape}
		<p class="content-type">{$section->getLocalizedTitle()|escape}</p>
		{else}
		<p class="content-type">{translate key="rt.metadata.sep.peerReviewed"}</p>
		{/if}

        <div class="lozenges"></div>

		<h2>
			<a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}">{$article->getLocalizedTitle()|strip_unsafe_html}</a>
		</h2>

        {if $article->getLocalizedAbstract()}
        <p class="snippet">{$article->getLocalizedAbstract()|truncate:170:"..."|strip_unsafe_html|nl2br}</p>
        {/if}

		<p class="meta">
            <span class="authors">
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
			</span>
           in <span class="enumeration"><a title="Go to {$journal->getLocalizedTitle()|escape}" target="_blank" href="{url journal=$journal->getPath()}"><em>{$currentJournal->getLocalizedTitle()|truncate:45:"..."|strip_tags|escape}</a></span> <span class="year" title="{$issue->getDatePublished()|date_format:'%B %Y'}">({$issue->getDatePublished()|date_format:'%Y'})</em></span>
        </p>			 

		<!--	<div id="value" class="info--article">
				<div class="infoPubJournal">In <a title="Go to {$journal->getLocalizedTitle()|escape}" target="_blank" href="{url journal=$journal->getPath()}">{$currentJournal->getLocalizedTitle()|strip_tags|escape}</a> (<em>{$article->getDatePublished()|date_format:'%B %Y'}</em>) Volume {$issue->getVolume()|strip_tags|escape}, Issue {$issue->getNumber()|escape}, {$article->getPages()|escape} pp</div>
				<div class="info--DOI">{assign var="doi" value=$article->getStoredPubId('doi')}
                    {if $article->getPubId('doi')}<a title="Permanent link for {$article->getLocalizedTitle()|strip_tags|escape}" href="http://doi.org/{$article->getPubId('doi')|escape}"><span class="fileDOI">DOI:</span> {$article->getPubId('doi')}</a>{/if} {if $article->getViews('doi')}<span class="fileHit" title="{$article->getViews('doi')} click">{$article->getViews('doi')}</span>{/if}</div>
				<div class="infoPubDate">Published: {$article->getDatePublished()|date_format:"%e %B %Y"}</div>
			</div> -->

		<!-- <div class="actions">
			{if (!$issueUnavailable || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN)}
			{foreach from=$article->getGalleys() item=galley name=galleyList}
			<span class="action">
				<a title="{$article->getLocalizedTitle()|strip_tags|escape}" href="{url journal=$journal->getPath() page="article" op="download" path=$article->getBestArticleId()|to_array:$galley->getBestGalleyId($journal)}" class="file">Download {$galley->getGalleyLabel()|escape} <span class="fileSize">({$galley->getNiceFileSize()})</span> <span class="fileView">{$galley->getViews()} views</span></a>
			</span>&nbsp;
			{/foreach}{/if}
			
			<span class="action">
				<a title="{$article->getLocalizedTitle()|strip_tags|escape}" target="_blank" href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}" class="file">{if $article->getLocalizedAbstract()}View Article{else}{translate key="article.details"}{/if}</a> <span class="fileView">{$article->getViews()} views</span>
			</span>
			<div class="tocPages"></div>
		</div> -->
	</li>	
	{/if}

	{/if} 
{/foreach}
</ol>

<div class="functions-bar functions-bar-bottom">
	<div id="sort-results" class="sorting">
		<span class="authorDetails"><strong>{$publishedArticles|@count} article(s)</strong></span>
	</div>
	<span class="side-r" colspan="2" align="right"></span>
</div>

{include file="common/footer-home.tpl"}

