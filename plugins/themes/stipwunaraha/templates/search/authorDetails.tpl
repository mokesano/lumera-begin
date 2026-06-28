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
{include file="common/header-AUTH27.tpl"}
{/strip}

<h1 id="USER-ID0{$editors}">{$firstName|escape} {if $middleName} {$middleName|escape}{/if} {$lastName|escape}</h1>

<div class="overview">
	{if $profileImage}
	<img id="ID-" class="avatar cosire-author" title="{$firstName|escape} {if $middleName} {$middleName|escape}{/if} {$lastName|escape}" src="{$sitePublicFilesDir}/{$profileImage.uploadName}" alt="P_{$firstName|escape} {if $middleName} {$middleName|escape}{/if} {$lastName|escape}" height="auto" width="150" />
		{else}	
		<img id="ID-" class="avatar cosire-author" title="{$firstName|escape} {if $middleName} {$middleName|escape}{/if} {$lastName|escape}" src="//media.stipwunaraha.ac.id/static/contactPersonM.png" alt="P_{$firstName|escape} {if $middleName} {$middleName|escape}{/if} {$lastName|escape}" height="auto" width="150" />
	{/if}
	<style type="text/css">.cosire-author {margin-top: 0;float: right;}</style>

	<div class="medium-9 description">
		<p class="description--paragraph">
			<span>
				Author in {$currentJournal->getLocalizedTitle()|strip_tags|escape}
			</span>
			<br />
			<span>
				Stipwunaraha Research Media (SRM)
			</span>
			<br />
		</p>

		<br />
		{if $affiliation}
		<span>Current Affiliation:</span> <br /><span>{$affiliation|escape}{/if}{if $country}, {$country|escape}</span>
		{/if}

<div class="editor-bio person-detail"></div>

<div class="medium-12 article__list" style="float: right;">
    <h3 class="articleAuthor">{$publishedArticles|@count} {translate key="article.articles"}</h3>

<div id="results" class="article-by--author">
	{foreach from=$publishedArticles item=article}
		{assign var=issueId value=$article->getIssueId()}
		{assign var=issue value=$issues[$issueId]}
		{assign var=issueUnavailable value=$issuesUnavailable.$issueId}
		{assign var=sectionId value=$article->getSectionId()}
		{assign var=journalId value=$article->getJournalId()}
		{assign var=journal value=$journals[$journalId]}
		{assign var=section value=$sections[$sectionId]}

	{if $article->getGalleys()}

	<div id="articleList" >
		<ul id="articleInfoList" class="tocMenuArticle">
			{if $issue->getPublished() && $section && $journal}
			<li id="articleInfoList" class="tocMenuArticle"><h7>{$section->getLocalizedTitle()|escape}</h7></li>{/if}
			<div class="ArtType">Open Access</div>
		</ul>

		<div class="articleList--value">
			<div class="tocTitle"><a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}">{$article->getLocalizedTitle()|strip_unsafe_html}</a></div>

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

			{if $article->getLocalizedAbstract()}
			<div class="abstract authorDetails">{$article->getLocalizedAbstract()|truncate:200:"..."|strip_unsafe_html|nl2br}</div>
			{/if}

			<div id="value" class="info--article">
				<div class="infoPubJournal">In <a title="Go to {$journal->getLocalizedTitle()|escape}" target="_blank" href="{url journal=$journal->getPath()}">{$currentJournal->getLocalizedTitle()|strip_tags|escape}</a> (<em title="Published: {$article->getDatePublished()|date_format:"%e %B %Y"} - Volume {$issue->getVolume()|strip_tags|escape}, Issue {$issue->getNumber()|escape}, {$article->getPages()|escape} pp">{$article->getDatePublished()|date_format:'%B %Y'}</em>)</div>
				<div class="info--DOI">{assign var="doi" value=$article->getStoredPubId('doi')}
                    {if $article->getPubId('doi')}<a title="Permanent link for {$article->getLocalizedTitle()|strip_tags|escape}" href="http://doi.org/{$article->getPubId('doi')|escape}"><span class="fileDOI">DOI:</span> {$article->getPubId('doi')}</a>{/if} {if $article->getViews('doi')}<span class="fileHit" title="{$article->getViews('doi')} click">{$article->getViews('doi')}</span>{/if}</div>
				<div class="infoPubDate"></div>
			</div>
		</div>

		<ul id="author-article-InfoList" class="tocMenuArticle ul-list">
			{if (!$issueUnavailable || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN)}
			{foreach from=$article->getGalleys() item=galley name=galleyList}
			<li class="tocMenuArticle li-list pubDOI"><a title="{$article->getLocalizedTitle()|strip_tags|escape}" href="{url journal=$journal->getPath() page="article" op="download" path=$article->getBestArticleId()|to_array:$galley->getBestGalleyId($journal)}" class="file">Download {$galley->getGalleyLabel()|escape} <span class="fileSize">({$galley->getNiceFileSize()})</span> <span class="fileView">{$galley->getViews()} views</span></a></li>
			{/foreach}{/if}
		
			<li class="tocMenuArticle li-list pubDOI"><a title="{$article->getLocalizedTitle()|strip_tags|escape}" target="_blank" href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}" class="file">{if $article->getLocalizedAbstract()}View Article{else}{translate key="article.details"}{/if}</a> <span class="fileView">{$article->getViews()} views</span></li>
		
			<li class="tocMenuArticle li-list pubDOI"></li>
			<div class="tocPages"></div>
		</ul>
	</div>

{else}

	<div id="articleList" >
		<ul id="articleInfoList" class="tocMenuArticle">
			{if $issue->getPublished() && $section && $journal}
			<li id="articleInfoList" class="tocMenuArticle"><h7>{$section->getLocalizedTitle()|escape}</h7></li>{/if}
			<!-- <div class="ArtType">Open Access</div> -->
		</ul>

		<div class="articleList--value">
			<div class="tocTitle"><a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}">{$article->getLocalizedTitle()|strip_unsafe_html}</a></div>

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

			{if $article->getLocalizedAbstract()}
			<div class="abstract authorDetails">{$article->getLocalizedAbstract()|truncate:200:"..."|strip_unsafe_html|nl2br}</div>
			{/if}

			<div id="value" class="info--article">
				<div class="infoPubJournal">In <a title="Go to {$journal->getLocalizedTitle()|escape}" target="_blank" href="{url journal=$journal->getPath()}">{$currentJournal->getLocalizedTitle()|strip_tags|escape}</a> (<em title="Published: {$article->getDatePublished()|date_format:"%e %B %Y"} - Volume {$issue->getVolume()|strip_tags|escape}, Issue {$issue->getNumber()|escape}, {$article->getPages()|escape} pp">{$article->getDatePublished()|date_format:'%B %Y'}</em>)</div>
				<div class="info--DOI">{assign var="doi" value=$article->getStoredPubId('doi')}
                    {if $article->getPubId('doi')}<a title="Permanent link for {$article->getLocalizedTitle()|strip_tags|escape}" href="http://doi.org/{$article->getPubId('doi')|escape}"><span class="fileDOI">DOI:</span> {$article->getPubId('doi')}</a>{/if} {if $article->getViews('doi')}<span class="fileHit" title="{$article->getViews('doi')} click">{$article->getViews('doi')}</span>{/if}</div>
				<div class="infoPubDate"></div>
			</div>
		</div>

		<!-- <ul id="author-article-InfoList" class="tocMenuArticle ul-list">
			{if (!$issueUnavailable || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN)}
			{foreach from=$article->getGalleys() item=galley name=galleyList}
			<li class="tocMenuArticle li-list pubDOI"><a title="{$article->getLocalizedTitle()|strip_tags|escape}" href="{url journal=$journal->getPath() page="article" op="download" path=$article->getBestArticleId()|to_array:$galley->getBestGalleyId($journal)}" class="file">Download {$galley->getGalleyLabel()|escape} <span class="fileSize">({$galley->getNiceFileSize()})</span> <span class="fileView">{$galley->getViews()} views</span></a></li>
			{/foreach}{/if}
		
			<li class="tocMenuArticle li-list pubDOI"><a title="{$article->getLocalizedTitle()|strip_tags|escape}" target="_blank" href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}" class="file">{if $article->getLocalizedAbstract()}View Article{else}{translate key="article.details"}{/if}</a> <span class="fileView">{$article->getViews()} views</span></li>
		
			<li class="tocMenuArticle li-list pubDOI"></li>
			<div class="tocPages"></div>
		</ul> -->

	</div>
	{/if}

	{/foreach}
</div>
</div>

	</div>
</div>


{include file="common/footer.tpl"}
