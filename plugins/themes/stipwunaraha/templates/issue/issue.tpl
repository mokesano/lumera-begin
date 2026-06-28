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

	{if $article->getGalleys()}

	<div class="issue">
	    <ul id="articleInfoList" class="tocMenuArticle u-font-serif">
    	    <li class="li-last">{if $section.title}<h7 class="tocSectionTitle">{$section.title|escape}</h7>{/if} | <h7>{$article->getDatePublished()|date_format:"%e %B %Y"}</h7></li>

	        <div class="ArtType">Open Access</div>
	    </ul>

		<h3 class="link tocTitle title-issue">
		{if !$hasAccess || $hasAbstract}
		{assign var="doi" value=$article->getStoredPubId('doi')}
	    {if $article->getPubId('doi')}
			<a href="{url page="article" op="view" path=$articlePath}" class="" title="{$article->getLocalizedTitle()|strip_tags|escape} | DOI: https://doi.org/{$article->getPubId('doi')}">{$article->getLocalizedTitle()|strip_unsafe_html|nl2br}</a>
		{else}
			<a href="{url page="article" op="view" path=$articlePath}" class="" title="{$article->getLocalizedTitle()|strip_unsafe_html|nl2br} | DOI: https://doi.org/{$article->getPubId('doi')}">{$article->getLocalizedTitle()|strip_unsafe_html|nl2br}</a>
		{/if}
		{/if}
		</h3>

		{if $article->getLocalizedAbstract()}
		<div id="Abs01" class="abstract abs-issue">{$article->getLocalizedAbstract()|truncate:200:"..."|strip_unsafe_html|nl2br}</div>
		{/if}
		
		<div class="tocAuthors authors-issue">
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

		{assign var="doi" value=$article->getStoredPubId('doi')}
	    {if $article->getPubId('doi')}
		<div class="tocMenuArticle li-list doi-issue"><a href="https://doi.org/{$article->getPubId('doi')|escape}"><span class="fileDOI">DOI:</span> https://doi.org/{$article->getPubId('doi')} <span title="{$article->getViews('doi')} click" class="fileHit">{$article->getViews('doi')}</span></a></div>
		{/if}

		<div class="tocArticleGalleysPages{if $showCoverPage} showCoverImage{/if}">
			<ul id="author-article-InfoList" class="tocMenuArticle ul-list">
			
				{if $hasAccess || ($subscriptionRequired && $showGalleyLinks)}
				{foreach from=$article->getGalleys() item=galley name=galleyList}
				<li class="tocMenuArticle pubDOI galley-issue">
				<a title="{$article->getLocalizedTitle()|strip_unsafe_html}" href="{url page="article" op="download" path=$articlePath|to_array:$galley->getBestGalleyId($currentJournal)}" {if $galley->getRemoteURL()}target="_blank" {/if}class="file">Download {$galley->getGalleyLabel()|escape} <span class="fileSize">({$galley->getNiceFileSize()})</span> <span class="fileView">{$galley->getViews()} views</span></a>

				{if $subscriptionRequired && $showGalleyLinks && $restrictOnlyPdf}
				{if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || !$galley->isPdfGalley()}<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_open_medium.gif" alt="{translate key="article.accessLogoOpen.altText"}" />{else}<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />{/if}{/if}
				{/foreach}
				
				{if $subscriptionRequired && $showGalleyLinks && !$restrictOnlyPdf}
				{if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN}<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_open_medium.gif" alt="{translate key="article.accessLogoOpen.altText"}" />{else}<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />{/if}{/if}
				</li>
				{/if}
				
				<li class="tocMenuArticle pubDOI link-issue"><a title="{$article->getLocalizedTitle()|strip_unsafe_html}" href="{url page="article" op="view" path=$articlePath}">{if $article->getLocalizedAbstract()}View Abstract{else}View {translate key="article.details"}{/if} <span class="fileView">{$article->getViews()} views</span></a></li>
                   
				<div class="tocPages page-issue">Pages: {$article->getPages()|escape}</div>
			</ul>
		</div>
	</div>

	{else}

	<div class="issue">
	    <ul id="articleInfoList" class="tocMenuArticle u-font-serif">
    	    <li class="li-last">{if $section.title}<h7 class="tocSectionTitle">{$section.title|escape}</h7>{/if} | <h7>{$article->getDatePublished()|date_format:"%e %B %Y"}</h7></li>

	        <!-- <div class="ArtType">Open Access</div> -->
	    </ul>

		<h3 class="link tocTitle title-issue">
		{if !$hasAccess || $hasAbstract}
		{assign var="doi" value=$article->getStoredPubId('doi')}
	    {if $article->getPubId('doi')}
			<a href="{url page="article" op="view" path=$articlePath}" class="" title="{$article->getLocalizedTitle()|strip_tags|escape} | DOI: https://doi.org/{$article->getPubId('doi')}">{$article->getLocalizedTitle()|strip_unsafe_html|nl2br}</a>
		{else}
			<a href="{url page="article" op="view" path=$articlePath}" class="" title="{$article->getLocalizedTitle()|strip_unsafe_html|nl2br} | DOI: https://doi.org/{$article->getPubId('doi')}">{$article->getLocalizedTitle()|strip_unsafe_html|nl2br}</a>
		{/if}
		{/if}
		</h3>

		{if $article->getLocalizedAbstract()}
		<div id="Abs01" class="abstract abs-issue">{$article->getLocalizedAbstract()|truncate:200:"..."|strip_unsafe_html|nl2br}</div>
		{/if}
		
		<div class="tocAuthors authors-issue">
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

		<div class="tocPages page-issue">Pages: {$article->getPages()|escape}</div>

		{assign var="doi" value=$article->getStoredPubId('doi')}
	    {if $article->getPubId('doi')}
		<div class="tocMenuArticle li-list doi-issue"><a href="https://doi.org/{$article->getPubId('doi')|escape}"><span class="fileDOI">DOI:</span> https://doi.org/{$article->getPubId('doi')} <span title="{$article->getViews('doi')} click" class="fileHit">{$article->getViews('doi')}</span></a></div>
		{/if}

		<!-- <div class="tocArticleGalleysPages{if $showCoverPage} showCoverImage{/if}">
			<ul id="author-article-InfoList" class="tocMenuArticle ul-list">
			
				{if $hasAccess || ($subscriptionRequired && $showGalleyLinks)}
				{foreach from=$article->getGalleys() item=galley name=galleyList}
				<li class="tocMenuArticle pubDOI galley-issue">
				<a title="{$article->getLocalizedTitle()|strip_unsafe_html}" href="{url page="article" op="download" path=$articlePath|to_array:$galley->getBestGalleyId($currentJournal)}" {if $galley->getRemoteURL()}target="_blank" {/if}class="file">Download {$galley->getGalleyLabel()|escape} <span class="fileSize">({$galley->getNiceFileSize()})</span> <span class="fileView">{$galley->getViews()} views</span></a>
				{if $subscriptionRequired && $showGalleyLinks && $restrictOnlyPdf}
				{if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || !$galley->isPdfGalley()}<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_open_medium.gif" alt="{translate key="article.accessLogoOpen.altText"}" />{else}<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />{/if}{/if}
				{/foreach}
				{if $subscriptionRequired && $showGalleyLinks && !$restrictOnlyPdf}
				{if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN}<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_open_medium.gif" alt="{translate key="article.accessLogoOpen.altText"}" />{else}<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />{/if}{/if}
				</li>
				{/if}
				
				<li class="tocMenuArticle pubDOI link-issue"><a title="{$article->getLocalizedTitle()|strip_unsafe_html}" href="{url page="article" op="view" path=$articlePath}">{if $article->getLocalizedAbstract()}View Abstract{else}View {translate key="article.details"}{/if} <span class="fileView">{$article->getViews()} views</span></a></li>
                   
			</ul>
		</div> -->
	</div>

	{/if}


{call_hook name="Templates::Issue::Issue::Article"}
{/foreach}

{if !$smarty.foreach.sections.last}

{/if}

{/foreach}

