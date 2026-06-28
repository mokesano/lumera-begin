{**
 * templates/search/titleIndex.tpl
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display published articles by title
 *
 *}
{strip}
{assign var=pageTitle value="search.titleIndex"}
{include file="common/header.tpl"}
{/strip}

<div id="descriptionTitle">
    <p>Thank you for your interest in <em>{$currentJournal->getLocalizedTitle()|strip_tags|escape}</em>. The journal has recently switched publishers to {$currentJournal->getSetting('publisherInstitution')|escape}, who will host all back content. If you notice any missing content, please reach out to <a href="mailto:admin@stipwunaraha.ac.id">us</a>.</p>
    </div>

{if $currentJournal}
	{assign var=numCols value=3}
{else}
	{assign var=numCols value=4}
{/if}

<div id="results" class="artByTitle">
    <table class="tocArticle"><tbody>
        {iterate from=results item=result}
        <tr class="TOC" valign="top">
            <td class="tocArticleTitleAuthors Info">
                <div class="article-list">
                    {assign var=publishedArticle value=$result.publishedArticle}
                    {assign var=article value=$result.article}
                    {assign var=issue value=$result.issue}
                    {assign var=issueAvailable value=$result.issueAvailable}
                    {assign var=journal value=$result.journal}
                    {assign var=sectionId value=$article->getSectionId()}
                    {assign var=section value=$sections[$sectionId]}
                    
                    <ul id="articleInfoList" class="tocMenuArticle">
                        {foreach name=sections from=$publishedArticles item=section key=sectionId}
                        {foreach from=$section.articles item=article}
                        <li>{if $section.title}<h7 class="tocSectionTitle">{$section.title|escape} | </h7>{/if} {/foreach}{* articles *}{/foreach}{* sections *} <h7>{if $section && $section->getLocalizedIdentifyType()}{$section->getLocalizedIdentifyType()|escape}{else}{translate key="rt.metadata.pkp.peerReviewed"} | {/if}</h7><span class="ArtType">Open Access</span></li>
                    </ul>

                    <div class="tocTitle"><a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestArticleId()}">{$article->getLocalizedTitle()|strip_unsafe_html}</a></div>
                    
                    {if $article->getLocalizedAbstract()}
                    <div class="abstract authorDetails">{$article->getLocalizedAbstract()|truncate:200:"..."|strip_unsafe_html|nl2br}</div>
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
                            {assign var=count value=$count+1} <a href="{url page="search" op="authors" path="view" firstName=$authorFirstName middleName=$authorMiddleName lastName=$authorLastName affiliation=$authorAffiliation country=$authorCountry}" class="authorName" target="_blank" title="View articles by: {if $fullname}{$fullname|escape}{/if}" aria-label="{if $fullname}{$fullname|escape}{/if}">{if $fullname}{$fullname|escape}</a>{else}{/if}{if $i==$authorCount-2}, and {elseif $i<$authorCount-1}, {/if}
                        {/foreach}
                    </div>

                    <ul id="author-article-InfoList" class="tocMenuArticle">
                        <li class="infoPubJournal"><em>{$currentJournal->getLocalizedTitle()|strip_tags|escape}</em> {$issue->getVolume()|strip_tags|escape}({$issue->getNumber()|escape})</li></ul>
                    
                    <ul id="author-article-InfoList" class="tocMenuArticle ul-list">
                        <li class="tocMenuArticle li-list pubDOI">{if $issueAvailable}
                        {foreach from=$publishedArticle->getGalleys() item=galley name=galleyList}<a title="{$article->getLocalizedTitle()|strip_unsafe_html}" href="{url journal=$journal->getPath() page="article" op="download" path=$publishedArticle->getBestArticleId($journal)|to_array:$galley->getBestGalleyId($journal)}" class="file">Download {$galley->getGalleyLabel()|escape} <span class="fileSize">({$galley->getNiceFileSize()})</span></a>
                        {/foreach}{/if}</li>
                        <li class="tocMenuArticle li-list pubDOI"><a title="{$article->getLocalizedTitle()|strip_unsafe_html}" target="_blank" href="{url journal=$journal->getPath() page="article" op="view" path=$publishedArticle->getBestArticleId($journal)}" class="file">View {if $article->getLocalizedAbstract()}{translate key="article.abstract"}{else}{translate key="article.details"}{/if}</a></li>
                        <li class="tocMenuArticle li-list pubDOI">{assign var="doi" value=$article->getStoredPubId('doi')}{if $article->getPubId('doi')}<a href="http://dx.doi.org/{$article->getPubId('doi')|escape}"><span class="fileDOI">DOI:</span> {$article->getPubId('doi')}</a>{/if}</li>
                        <div class="tocPages">Pages: {$article->getPages()|escape}</div>
                        </ul>
                    </div>
                </td>
            </tr>
            {/iterate}
        </tbody>
    </table>
    
    <div id="colspan-anchor">
        <table width="100%">
            <tbody>
                {if $results->wasEmpty()}
                <tr valign="bottom">
                    <td colspan="{$numCols|escape}" class="nodata">{translate key="search.noResults"}</td>
                    </tr>
                {else}
                <tr class="paging page--listing">
                    <td width="50%" {if !$currentJournal}colspan="2" {/if}align="left">{page_info iterator=$results}</td>
                    <td width="50%" colspan="2" align="right">{page_links anchor="results" iterator=$results name="search"}</td>
                    </tr>
                {/if}
                </tbody>
            </table>
        </div>
    </div>
	
{include file="common/footer.tpl"}

</div>