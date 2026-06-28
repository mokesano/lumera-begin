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
{include file="common/header-SA07.tpl"}
{/strip}

<div class="sub-search__meta">
    <div class="search-meta" role="main">
        <div class="result-meta-information">
            <p class="result-count-message">Showing <strong>{page_info iterator=$results} results.</strong></p>
            <div class="result-filter">Within
                <span class="facet-constraint-group facet-constraint-group-type"><a class="facet-link facet-link-type__journal" href="{url page="index"}">Articles</a></span>
            </div>
        </div>
    </div>
</div>

{if $currentJournal}
	{assign var=numCols value=3}
{else}
	{assign var=numCols value=4}
{/if}

<div id="results" class="sub-search__result-list artByTitle">
    <table class="tocArticle"><tbody>
        {iterate from=results item=result}
        <tr class="articles TOC">
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
                        <li>{if $section.title}<h7 class="tocSectionTitle">{$section.title|escape}</h7>{/if}</li>
                        {/foreach}{* articles *}{/foreach}{* sections *}
                        <li><h7>{if $section && $section->getLocalizedIdentifyType()}{$section->getLocalizedIdentifyType()|escape}{else}{translate key="rt.metadata.sep.peerReviewed"}{/if}</h7></li>

                    <!-- <div class="ArtType">Open Access</div> -->
                    </ul>

                    <div class="ul-article--value">
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
                            {assign var=count value=$count+1} <a href="{url page="search" op="authors" path="view" firstName=$authorFirstName middleName=$authorMiddleName lastName=$authorLastName affiliation=$authorAffiliation country=$authorCountry}" class="authorName" target="_blank" title="View articles by: {if $fullname}{$fullname|escape}{/if}" aria-label="{if $fullname}{$fullname|escape}{/if}">{if $fullname}{$fullname|escape}</a>{else}{/if}{if $i==$authorCount-2}, and {elseif $i<$authorCount-1}, {elseif $i==$authorCount-3|truncate:"..."|strip_unsafe_html|nl2br} {/if}
                        {/foreach}
                        in <a title="Go to {$journal->getLocalizedTitle()|escape}" target="_blank" href="{url journal=$journal->getPath()}"><em>{$currentJournal->getLocalizedTitle()|strip_tags|escape}</a> <span class="year" title="{$issue->getDatePublished()|date_format:'%B %Y'}">({$issue->getDatePublished()|date_format:'%Y'})</span></em>
                    </div>

                    {if $article->getLocalizedAbstract()}
                    <div class="abstract authorDetails">{$article->getLocalizedAbstract()|truncate:170:"..."|strip_unsafe_html|nl2br}</div>
                    {/if}

                    <div class="li-list ul-sans hide ul-journalName">
                         Volume {$issue->getVolume()|strip_tags|escape}, Issue ({$issue->getNumber()|escape}), Page: {$article->getPages()|escape}, {assign var="doi" value=$article->getStoredPubId('doi')}{if $article->getPubId('doi')}<a href="http://dx.doi.org/{$article->getPubId('doi')|escape}"><span class="fileDOI">DOI:</span> {$article->getPubId('doi')}</a>{/if}</div>

                    </div>

                    <ul id="author-article-InfoList" class="tocMenuArticle ul-list">
                        {foreach from=$publishedArticle->getGalleys() item=galley name=galleyList}
                        {if $issueAvailable}
                        <li class="tocMenuArticle li-list pubDOI">
                        <a title="{$article->getLocalizedTitle()|strip_unsafe_html}" href="{url journal=$journal->getPath() page="article" op="download" path=$publishedArticle->getBestArticleId($journal)|to_array:$galley->getBestGalleyId($journal)}" class="file">Download {$galley->getGalleyLabel()|escape} <span class="fileSize">({$galley->getNiceFileSize()})</span> <span class="fileView">{$galley->getViews()} views</span></a>
                        </li>
                        {/if}{/foreach}

                        <li class="tocMenuArticle li-list pubDOI"><a title="View {$article->getLocalizedTitle()|strip_unsafe_html}" target="_blank" href="{url journal=$journal->getPath() page="article" op="view" path=$publishedArticle->getBestArticleId($journal)}" target="_blank" class="file">View {if $article->getLocalizedAbstract()}{translate key="article.abstract"}{else}{translate key="article.details"}{/if}</a></li>
                        
                        <div class="tocPages"></div>
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
                <tr >
                    <td width="50%" {if !$currentJournal}colspan="2" {/if}align="left">{page_info iterator=$results}</td>
                    <td width="50%" colspan="2" style="text-align: right;">{page_links anchor="results" iterator=$results name="search"}</td>
                    </tr>
                {/if}
                </tbody>
            </table>
        </div>

<div class="functions-bar functions-bar-bottom">
        <div class="pagination">
                <span class="prev" title="previous">previous</span>
            <span class="page-nr">
                Page
                <span class="field">
                    <input class="page-number" type="text" name="page" value="1">
                    <input type="hidden" name="query" value="social">
                            <input type="hidden" name="facet-type" value="type__journal">
                    <span class="pagination-error error-message hidden">
                        <strong>
                            <span class="invalid-page-number"></span>
                        </strong>
                        is not a valid page number. Please enter a number between <strong></strong> and <strong></strong>.
                    </span>
                </span>
                of
                <span class="number-of-pages">2</span>
            </span>
                <a href="{url page="search" op="titles?searchPage=2#results"}" class="next" title="next"></a>
        </div>
    </div>

    </div>
</div>
	
{include file="common/footer.tpl"}

