{**
 * templates/issue/issue.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Issue
 *
 *}
{foreach name=sections from=$publishedArticles item=section key=sectionId}

<table class="tocArticle art-byIssue">
{foreach from=$section.articles item=article}
	{assign var=articlePath value=$article->getBestArticleId($currentJournal)}
	{assign var=articleId value=$article->getId()}

	{if $article->getLocalizedFileName() && $article->getLocalizedShowCoverPage() && !$article->getHideCoverPageToc($locale)}
		{assign var=showCoverPage value=true}
	{else}
		{assign var=showCoverPage value=false}
	{/if}

	{if $article->getLocalizedAbstract() == ""}
		{assign var=hasAbstract value=0}
	{else}
		{assign var=hasAbstract value=1}
	{/if}

	{if (!$subscriptionRequired || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || $subscribedUser || $subscribedDomain || ($subscriptionExpiryPartial && $articleExpiryPartial.$articleId))}
		{assign var=hasAccess value=1}
	{else}
		{assign var=hasAccess value=0}
	{/if}


<tr valign="top" class="TOC">
	<td class="tocArticleCoverImage{if $showCoverPage} showCoverImage{/if}">
		{if $showCoverPage}
			<div id="tocCoverImage" class="tocCoverImage">
				{if !$hasAccess || $hasAbstract}<a href="{url page="article" op="view" path=$articlePath}" class="file">{/if}
				<img src="{$coverPagePath|escape}{$article->getFileName($locale)|escape}"{if $article->getCoverPageAltText($locale) != ''} alt="{$article->getCoverPageAltText($locale)|escape}"{else} alt="{translate key="article.coverPage.altText"}"{/if}/>
				{if !$hasAccess || $hasAbstract}</a>{/if}
			</div>
		{/if}
	</td>

	{call_hook name="Templates::Issue::Issue::ArticleCoverImage"}

	<td class="tocArticleTitleAuthors{if $showCoverPage} showCoverImage{/if}">
	    <ul id="articleInfoList" class="tocMenuArticle">
	        <li class="li-last">{if $section.title}<h7 class="tocSectionTitle">{$section.title|escape}</h7>{/if} | <h7>{$article->getDatePublished()|date_format:"%e %B %Y"}</h7></li>

	        <li ></li>

	        <div class="ArtType">Open Access</div>
	    </ul>

		<div class="tocTitle">
			{if !$hasAccess || $hasAbstract}
				<a href="{url page="article" op="view" path=$articlePath}">{$article->getLocalizedTitle()|strip_unsafe_html|nl2br}</a>
			{else}
				{$article->getLocalizedTitle()|strip_unsafe_html|nl2br}
			{/if}
		</div>

		{if $article->getLocalizedAbstract()}
		<div id="Abs01" class="abstract">{$article->getLocalizedAbstract()|truncate:200:"..."|strip_unsafe_html|nl2br}</div>
		{/if}
		
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
            {assign var=count value=$count+1} <a href="{url page="search" op="authors" path="view" firstName=$authorFirstName middleName=$authorMiddleName lastName=$authorLastName affiliation=$authorAffiliation country=$authorCountry}" class="authorName" title="Go to profile: {if $fullname}{$fullname|escape}{/if}">{if $fullname}{$fullname|escape}</a>{else}{/if}{if $i==$authorCount-2}, and {elseif $i<$authorCount-1}, {/if}
        {/foreach}
		</div>

		<div class="tocArticleGalleysPages{if $showCoverPage} showCoverImage{/if}">
			<ul id="author-article-InfoList" class="tocMenuArticle ul-list">

				<li class="tocMenuArticle pubDOI">
					{if $hasAccess || ($subscriptionRequired && $showGalleyLinks)}
					{foreach from=$article->getGalleys() item=galley name=galleyList}<a title="{$article->getLocalizedTitle()|strip_unsafe_html}" href="{url page="article" op="download" path=$articlePath|to_array:$galley->getBestGalleyId($currentJournal)}" {if $galley->getRemoteURL()}target="_blank" {/if}class="file">Download {$galley->getGalleyLabel()|escape} <span class="fileSize">({$galley->getNiceFileSize()})</span></a>
					{if $subscriptionRequired && $showGalleyLinks && $restrictOnlyPdf}
					{if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || !$galley->isPdfGalley()}<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_open_medium.gif" alt="{translate key="article.accessLogoOpen.altText"}" />{else}<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />{/if}{/if}
					{/foreach}
					{if $subscriptionRequired && $showGalleyLinks && !$restrictOnlyPdf}
					{if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN}<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_open_medium.gif" alt="{translate key="article.accessLogoOpen.altText"}" />{else}<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />{/if}{/if}
					{/if}
				</li>
				
				<li class="tocMenuArticle pubDOI"><a title="{$article->getLocalizedTitle()|strip_unsafe_html}" href="{url page="article" op="view" path=$articlePath}">{if $article->getLocalizedAbstract()}View Article{else}{translate key="article.details"}{/if}</a></li>

				<li class="tocMenuArticle li-list pubDOI">{assign var="doi" value=$article->getStoredPubId('doi')}
                    {if $article->getPubId('doi')}<a href="http://doi.org/{$article->getPubId('doi')|escape}"><span class="fileDOI">DOI:</span> {$article->getPubId('doi')}</a>{/if}</li>
                    
				<div class="tocPages">Pages: {$article->getPages()|escape}</div>
			</ul>
		</div>
	</td>

</tr>

{call_hook name="Templates::Issue::Issue::Article"}
{/foreach}
</table>

{if !$smarty.foreach.sections.last}
<div class="separator"></div>
{/if}
{/foreach}

