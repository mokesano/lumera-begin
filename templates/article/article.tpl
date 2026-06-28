{**
 * templates/article/article.tpl
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article View.
 *}
{strip}
{if $galley}
    {assign var=pubObject value=$galley}
{else}
    {assign var=pubObject value=$article}
{/if}
{include file="article/header.tpl"}
{/strip}

{if $galley}
    {if $galley->isHTMLGalley()}

    <div id="cover-issueA" class="c-page-layout__main">
        {call_hook name="Templates::Article::Article::ArticleCoverImage"}
        {if $coverPagePath}
        <div id="articleCoverImage"><img src="{$coverPagePath|escape}{$coverPageFileName|escape}"{if $coverPageAltText != ''} alt="{$coverPageAltText|escape}"{else} alt="{translate key="article.coverPage.altText"}"{/if} width="100%" {if $height} height="{$height|escape}" {/if} />
        </div>

        {else}

        <noscript>
        {if $issue->getLocalizedFileName() && $issue->getShowCoverPage($locale) && !$issue->getHideCoverPageArchives($locale)}
            <img class="cover-issue cover-default" {if $issue->getCoverPageAltText($locale) != ''} title="Cover issue {$issue->getCoverPageAltText($locale)|escape}" {else} title="Cover issue {translate key="issue.coverPage.altText"}"{/if} src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $issue->getCoverPageAltText($locale) != ''} alt="{$issue->getCoverPageAltText($locale)|escape}"{else} alt="{translate key="issue.coverPage.altText"}"{/if} style="margin-top: 0" width="100%" />
        {else}
            <img class="cover-issue cover-default img-default" title="Cover issue default" src="//media.stipwunaraha.ac.id/img/img-default.jpg" alt="Stipwunaraha Media & Publishing Group" style="margin-top: 0" width="100%" />
        {/if}
        </noscript>

        {if $issue->getLocalizedFileName() && $issue->getShowCoverPage($locale) && !$issue->getHideCoverPageArchives($locale)}
            <div class="articleCoverImage"><img class="cover-issue cover-default" {if $issue->getCoverPageAltText($locale) != ''} title="Cover issue {$issue->getCoverPageAltText($locale)|escape}" {else} title="Cover issue {translate key="issue.coverPage.altText"}"{/if} src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $issue->getCoverPageAltText($locale) != ''} alt="{$issue->getCoverPageAltText($locale)|escape}"{else} alt="{translate key="issue.coverPage.altText"}"{/if} style="margin-top: 0" width="100%" />
            </div>
        {else}
            <div class="articleCoverImage"><img class="cover-issue cover-default img-default" title="Cover issue default" src="{$publicFilesDir}/{$homepageImage.uploadName|escape}/homepageImage_en_US.jpg" alt="Stipwunaraha Media & Publishing Group" style="margin-top: 0" width="100%" />
            </div>
        {/if}        

        {/if}
    </div>

    <div id="topBar" class="c-page-layout__side u-text-sm">
        
        {if $sharingEnabled}
        <!-- start AddThis -->
            {if isset($sharingDropDownMenu)}
                {if isset($sharingUserName)}
                    <script type="text/javascript">
                        var addthis_pub = '{$sharingUserName}';
                    </script>
                {/if}
                <div class="addthis_container share">
                    <a href="http://www.addthis.com/bookmark.php"
                        onmouseover="return addthis_open(this, '', '{$sharingArticleURL|escape:"javascript"}', '{$sharingArticleTitle|escape:"javascript"}')"
                        onmouseout="addthis_close()" onclick="return addthis_sendto()">
                            <img src="{$sharingButtonUrl}" width="{$sharingButtonWidth}" height="{$sharingButtonHeight}" border="0" alt="Bookmark and Share" style="border:0;padding:0" />
                    </a>
                    <script type="text/javascript" src="//s7.addthis.com/js/200/addthis_widget.js"></script>
                </div>
            {else}
                <a href="http://www.addthis.com/bookmark.php"
                    onclick="window.open('http://www.addthis.com/bookmark.php?pub={$sharingUserName|escape:"url"}&amp;url={$sharingRequestURL|escape:"url"}&amp;title={$sharingArticleTitle|escape:"url"}', 'addthis',
                                         'scrollbars=yes,menubar=no,width=620,height=520,resizable=yes,toolbar=no,location=no,status=no');
                             return false;"
                    title="Bookmark using any bookmark manager!" target="_blank">
                        <img src="{$sharingButtonUrl}" width="{$sharingButtonWidth}" height="{$sharingButtonHeight}" border="0" alt="Bookmark and Share" style="border:0;padding:0" />
                </a>
            {/if}
        <!-- end AddThis -->
        {else}
        <div class="share">
            {assign var="doi" value=$article->getStoredPubId('doi')}
            {if $article->getPubId('doi')}
            <a class="anchor social-anchor-facebook" href="http://www.facebook.com/sharer.php?u=https://doi.org/{$article->getPubId('doi')}" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174848.svg" width="25px"></a>
            <a class="anchor social-anchor-twitter" href="http://twitter.com/share?text={$article->getLocalizedTitle()|strip_tags|escape}&amp;url=https://doi.org/{$article->getPubId('doi')}&amp;via=Stipwunaraha_" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174876.svg" width="25px"></a>
            <a class="anchor social-anchor-linkedin" href="https://www.linkedin.com/shareArticle?mini=true&amp;url=https://doi.org/{$article->getPubId('doi')}&amp;title={$article->getLocalizedTitle()|strip_tags|escape}&amp;summary={if $article->getLocalizedAbstract()}{$article->getLocalizedAbstract()|strip_tags|escape}{else}{$article->getLocalizedTitle()|strip_tags|escape}{/if}&amp;source={$currentJournal->getLocalizedTitle()|strip_tags|escape}" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174857.svg" width="25px"></a>
            <a class="anchor social-anchor-whatsapp" href="https://web.whatsapp.com/send?text={$article->getLocalizedTitle()|strip_tags|escape}&amp;url=https://doi.org/{$article->getPubId('doi')}" data-action="share/whatsapp/share" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174879.svg" width="25px"></a>
            <a class="anchor social-anchor-reddit" href="https://reddit.com/submit?url=https://doi.org/{$article->getPubId('doi')}&amp;title={$article->getLocalizedTitle()|strip_tags|escape}" aria-label="Reddit" target="_blank"><img src="https://image.flaticon.com/icons/svg/1051/1051279.svg" width="25px"></a>
            {else}
            <a class="anchor social-anchor-facebook" href="http://www.facebook.com/sharer.php?u={url page="article" op="view" path=$article->getBestArticleId($currentJournal)}" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174848.svg" width="25px"></a>
            <a class="anchor social-anchor-twitter" href="http://twitter.com/share?text={$article->getLocalizedTitle()|strip_tags|escape}&amp;url=https://doi.org/{$article->getPubId('doi')}&amp;via=Stipwunaraha_" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174876.svg" width="25px"></a>
            <a class="anchor social-anchor-linkedin" href="https://www.linkedin.com/shareArticle?mini=true&amp;url={url page="article" op="view" path=$article->getBestArticleId($currentJournal)}&amp;title={$article->getLocalizedTitle()|strip_tags|escape}&amp;summary={if $article->getLocalizedAbstract()}{$article->getLocalizedAbstract()|strip_tags|escape}{else}{$article->getLocalizedTitle()|strip_tags|escape}{/if}&amp;source={$currentJournal->getLocalizedTitle()|strip_tags|escape}" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174857.svg" width="25px"></a>
            <a class="anchor social-anchor-whatsapp" href="https://web.whatsapp.com/send?text={$article->getLocalizedTitle()|strip_tags|escape}&amp;url={url page="article" op="view" path=$article->getBestArticleId($currentJournal)}" data-action="share/whatsapp/share" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174879.svg" width="25px"></a>
            <a class="anchor social-anchor-reddit" href="https://reddit.com/submit?url={url page="article" op="view" path=$article->getBestArticleId($currentJournal)}&amp;title={$article->getLocalizedTitle()|strip_tags|escape}" aria-label="Reddit" target="_blank"><img src="https://image.flaticon.com/icons/svg/1051/1051279.svg" width="25px"></a>
            {/if}
        </div>
        {/if}

        <div id="JournalName" class="TitlesJournal"><a title="Go to {$currentJournal->getLocalizedTitle()|strip_tags|escape}" href="{url page="$currentJournal"}">{$currentJournal->getLocalizedTitle()|strip_tags|escape}</a>
        </div>
        
        <div id="InfoVolIssue" class="TitlesJournal">
            <img src="data:image/svg+xml;charset=utf8, %3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='13'%3E%3Cpath fill='none' stroke='%23666' d='M1 0v12h12' stroke-dasharray='1 1'/%3E%3C/svg%3E" height="14px" />
            
            {if $currentJournal} <a title="Go to table of contents for this volume/issue" href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}" class="file">{translate key="issue.volume"} {$issue->getVolume()|strip_tags|escape}, {translate key="issue.issue"} {$issue->getNumber()|escape}</a>, {$issue->getDatePublished()|date_format:"%B %Y"}, Pages {$article->getPages()|escape}{/if} | <a title="Click here to cite this '{$article->getLocalizedTitle()|strip_unsafe_html}'" class="citing" href="#CiteAs">Cite as</a>
        </div>

    <div id="articleTitle">
        <ul class="articleType">
            {if is_a($article, 'PublishedArticle')}{assign var=galleys value=$article->getGalleys()}{/if}
            {if $galleys && $subscriptionRequired && $showGalleyLinks}
                {if $purchaseArticleEnabled}
                <li class="u-text-separator-after-micro">{translate key="reader.subscriptionOrFeeAccess"}</li>
                {else}
                <li class="u-text-separator-after-micro">{translate key="reader.subscriptionAccess"}</li>                        
                {/if}
            {else}
            <li class="open-access u-text-separator-after-micro">{translate key="reader.openAccess"}</li>
            {/if}
            <li>{if $section && $section->getLocalizedIdentifyType()}{$section->getLocalizedIdentifyType()|escape}{else}{translate key="rt.metadata.sep.peerReviewed"}{/if}</li>            
        </ul>
        <h2 class="title">{$article->getLocalizedTitle()|strip_unsafe_html}</h2>
    </div>

    <div id="author" class="authorName"><!-- <img src="{$baseUrl}/public/site/images/group.png" height="13px" /> -->
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
            {assign var=count value=$count+1}
            <a href="{url page="search" op="authors" path="view" firstName=$authorFirstName middleName=$authorMiddleName lastName=$authorLastName affiliation=$authorAffiliation country=$authorCountry}" class="authorName" target="_blank">{if $fullname}{$fullname|escape}<sup>{if $contact eq 1} {$count|escape}{else} {$count|escape}{/if}</sup>{if $author->getData('primaryContact')|escape}<svg title="Corresponding Author" focusable="false" viewBox="0 0 106 128" class="icon icon-person" height="11" width="12"><path d="m11.07 1.2e2l0.84-9.29c1.97-18.79 23.34-22.93 41.09-22.93 17.74 0 39.11 4.13 41.08 22.84l0.84 9.38h10.04l-0.93-10.34c-2.15-20.43-20.14-31.66-51.03-31.66s-48.89 11.22-51.05 31.73l-0.91 10.27h10.03m41.93-102.29c-9.72 0-18.24 8.69-18.24 18.59 0 13.67 7.84 23.98 18.24 23.98s18.24-10.31 18.24-23.98c0-9.9-8.52-18.59-18.24-18.59zm0 52.29c-15.96 0-28-14.48-28-33.67 0-15.36 12.82-28.33 28-28.33s28 12.97 28 28.33c0 19.19-12.04 33.67-28 33.67"></path></svg></a>{if $author->getData('email')}<a class="icon" title="{$fullname|escape}, mail: {$author->getData('email')|escape} (Corresponding Author)" href="mailto:{$author->getData('email')|escape}" target="_blank" ><svg xmlns="http://www.w3.org/2000/svg" width="13" height="10" viewBox="0.741 0 13 10"><path fill="#B0A8A3" d="M13.741 0L7.24 5.121.74 0zM.742 1.714L.74 10h6.502l-.001-3.165zm6.501 5.121L7.242 10h6.499V1.714z" alt="mail" /></svg></a>{/if}{else}{/if}{if $author->getData('orcid')} <a title="Go to view {$fullname|escape} orcid-ID profile" href="{$author->getData('orcid')|escape}" target="_blank" class="icon extern"><img src="{$baseUrl}/public/site/images/orcid_16x16.svg" style="height:12px" alt="orcid" /></a>{esle}{/if}{if $author->getUrl()} <a title="Go to view {$fullname|escape} Google Scholar profile" href="{$author->getUrl()|escape}" target="_blank" class="icon extern"><img src="{$baseUrl}/public/site/images/scholar.svg" style="height:14px" alt="scholar" /></a>{else}</a>{/if}{if $i==$authorCount-2}, {elseif $i<$authorCount-1}, {/if}{/if}
        {/foreach}
    </div>

    <div id="affiliationid" class="affiliation">
    {assign var=count value=0}
    {foreach from=$article->getAuthors() item=author name=authorList}
        {assign var=authorAffiliation value=$author->getLocalizedAffiliation()}
        {assign var=count value=$count+1}
        <dt>{if $authorAffiliation||$count}<sup>{$count|escape}</sup></dt>{/if}
        <dd>{$authorAffiliation|escape}, {if $author->getCountry()}{$author->getCountryLocalized()|escape}{/if}.</dd>
    {/foreach}
    </div>

    <div class="articleID">
    <div class="mailingAuthor">
        <svg title="Corresponding Author" focusable="false" viewBox="0 0 106 128" class="icon icon-person" height="11" width="12"><path d="m11.07 1.2e2l0.84-9.29c1.97-18.79 23.34-22.93 41.09-22.93 17.74 0 39.11 4.13 41.08 22.84l0.84 9.38h10.04l-0.93-10.34c-2.15-20.43-20.14-31.66-51.03-31.66s-48.89 11.22-51.05 31.73l-0.91 10.27h10.03m41.93-102.29c-9.72 0-18.24 8.69-18.24 18.59 0 13.67 7.84 23.98 18.24 23.98s18.24-10.31 18.24-23.98c0-9.9-8.52-18.59-18.24-18.59zm0 52.29c-15.96 0-28-14.48-28-33.67 0-15.36 12.82-28.33 28-28.33s28 12.97 28 28.33c0 19.19-12.04 33.67-28 33.67"></path></svg> Corresponding Author
    </div>

    {assign var="doi" value=$article->getStoredPubId('doi')}
    {if $article->getPubId('doi')}
        <a id="pub-id::doi" href="https://doi.org/{$article->getPubId('doi')|escape}" title="Persistent link using digital object identifier">https://doi.org/{$article->getPubId('doi')}</a>
    {/if}

    {if is_a($article, 'PublishedArticle')}{assign var=galleys value=$article->getGalleys()}{/if}
        {if $galleys && $subscriptionRequired && $showGalleyLinks}
        <div id="accessKey" class="right">
            <img src="{$baseUrl}/lib/sep/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />
            {if $purchaseArticleEnabled}
                {translate key="reader.subscriptionOrFeeAccess"}
            {else}
                {translate key="reader.subscriptionAccess"}
            {/if}
        </div>
        {else}
        <div id="accessKey" class="open-access right">{translate key="reader.openAccess"}</div>
    {/if}                    
    </div>

    <div id="articleMetric" class="main-context__container" title="Article info of {$article->getLocalizedTitle()|strip_unsafe_html}">
        <div class="main-context__column articleInfo"><b class="bold">Article History</b>:
            <!--<div>Manuscript submitted {$article->getDateSubmitted()|date_format:"%e %B %Y"}</div> -->
            <div>{if $lastEditorDecision} {assign var="decision" value=$lastEditorDecision.decision} {translate key=$editorDecisionOptions.$decision}{if $lastEditorDecision.dateDecided != 0} {$lastEditorDecision.dateDecided|date_format:$dateFormatShort}{/if} {else} Revised <i>(under constructions)</i>{/if}</div>
            <div>Accepted <i>(under constructions)</i></div>
            <div>Published {$article->getDatePublished()|date_format:"%e %B %Y"}, First online {$article->getDatePublished()|date_format:"%e %B %Y"}.</div>
        </div>

        <div class="main-context__column viewer">
        <ul class="article-metrics u-sansSerif">
            <li class="article-metrics__item">
                <span class="article-metrics__views">{$article->getViews()}</span>
                <span class="article-metrics__label">views</span>
            </li>
            {if $galleys}{if $galley->isPdfGalley()}     
            <li class="article-metrics__item">
                <span class="article-metrics__views">{$galley->getViews('PdfGalley')}</span>
                <span class="article-metrics__label">download</span>
            </li>
            {/if}{/if}
            {if $galleys}{if $galley->isHTMLGalley()}
            <li class="article-metrics__item">
                <span class="article-metrics__views">{$galley->getViews('HTMLGalley')}</span>
                <span class="article-metrics__label">download</span>
            </li>            
            {/if}{/if}
            <li class="article-metrics__item">
            {if $article->getPubId('doi')}
            <script type="text/javascript" src="https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js"></script><div data-badge-popover="bottom" data-badge-type="donut" data-doi="{$article->getPubId('doi')}" class="altmetric-embed" style="margin-bottom: 1.2em;margin-top: .69em;"></div>
            {else}
            <div data-badge-popover="bottom" data-badge-type="donut" data-doi="{$article->getPubId('doi')}" class="altmetric-embed"></div>
            {/if}
            </li>
            <li class="article-metrics__item" style="vertical-align: bottom;">
                <span class="__dimensions_badge_embed__" data-doi="{$article->getPubId('doi')}" data-style="small_circle" style="margin-bottom: 1.2em;margin-top: .69em;" data-legend="hover-bottom"></span><script async src="https://badge.dimensions.ai/badge.js" charset="utf-8"></script>
            </li>
        </ul>
        </div>
    </div>
    
    {if $article->getLocalizedAbstract()}
    <div id="articleAbstract">
        <h3>{translate key="article.abstract"}</h3>
        <div>{$article->getLocalizedAbstract()|strip_unsafe_html|nl2br}</div>
    </div>
    {/if}

    {if $article->getLocalizedSubject()}
    <div id="articleSubject" class="subjectId Keywords u-font-serif">
    <h3>{translate key="article.subject"}</h3>
        {foreach from=$article->getSubject(null) key=metaLocale item=metaValue}
        {foreach from=$metaValue|explode:"; " item=gsKeyword}
        {if $gsKeyword}
        <span id="keyword" class="keyword">{$gsKeyword|strip_unsafe_html|nl2br}</span>
        {/if}
        {/foreach}{/foreach}
        <!-- <div class="subjectId keyword">{$article->getLocalizedSubject()|strip_unsafe_html|nl2br}</div> -->
    </div>
    <span class="article-notes"><i>These keywords were added by the authors and not by machine. This process is static and keywords cannot be updated except using algorithms or other reasons.</i></span>
    {/if}

    {if (!$subscriptionRequired || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || $subscribedUser || $subscribedDomain)}
        {assign var=hasAccess value=1}
           {else}
        {assign var=hasAccess value=0}
    {/if}
    {if $galleys}
    <div id="articleFullText">
        <h3>{translate key="reader.fullText"}</h3>
    {if $hasAccess || ($subscriptionRequired && $showGalleyLinks)}
    {foreach from=$article->getGalleys() item=galley name=galleyList}<a href="{url page="article" op="view" path=$article->getBestArticleId($currentJournal)|to_array:$galley->getBestGalleyId($currentJournal)}" class="file" {if $galley->getRemoteURL()}target="_blank"{else}target="_blank"{/if} >Download {$galley->getGalleyLabel()|escape} <span class="fileSize">({$galley->getNiceFileSize()})</span></a> to read the full article text
    {if $subscriptionRequired && $showGalleyLinks && $restrictOnlyPdf}
        {if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || !$galley->isPdfGalley()}
        <img src="{$baseUrl}/public/site/images/icon-pdf.png" />
        {else}
        <img src="{$baseUrl}/public/site/images/icon-file.png" />
        {/if}
    {/if}
    {/foreach}
    {if $subscriptionRequired && $showGalleyLinks && !$restrictOnlyPdf}
        {if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN}
            <img src="{$baseUrl}/public/site/images/icon-pdf.png" />
        {else}
            <img src="{$baseUrl}/public/site/images/icon-file.png" />
        {/if}
    {/if}
    {else}
    &nbsp;<a href="{url page="about" op="subscriptions"}" target="_parent">{translate key="reader.subscribersOnly"}</a>
    {/if}
    </div>
    <span class="article-notes"><strong>Note: </strong>Downloadable document is available in {$article->getLanguage()|escape}</span>
    {/if}
    
    <div class="fulltext_html"> 
        {$galley->getHTMLContents()}
    </div>

    <div id="supplement-files" class="article">
    {if $journalRt->getSupplementaryFiles() && is_a($article, 'PublishedArticle') && $article->getSuppFiles()}
        <h3>{translate key="rt.suppFiles"}</h3>
        {foreach from=$article->getSuppFiles() item=suppFile key=key}
        <div class="supplement-files--value">
            <h6 class="supplement-files--label"><a href="{url page="article" op="downloadSuppFile" path=$article->getBestArticleId()|to_array:$suppFile->getBestSuppFileId($currentJournal)}" class="fileView">{translate key="article.additionalFiles"} {$key+1}:</a></h6>
            <span class="supplement-files--label"><b>{if $suppFile->getSuppFileTitle()}{$suppFile->getSuppFileTitle()|escape}</b>.{/if}
        
            {if $suppFile->getSuppFileDescription()}
            {$suppFile->getSuppFileDescription()|escape|nl2br}.{/if}
            
            {translate key="common.type"} {if $suppFile->getType()|escape}
                    {$suppFile->getType()|escape}.
                {elseif $suppFile->getSuppFileTypeOther()}
                    {$suppFile->getSuppFileTypeOther()|escape}.
                {else}
                    {translate key="common.other"}.
                {/if}
            
            {if $suppFile->getSuppFileCreator()}
            {translate key="author.submit.suppFile.createrOrOwner"} {$suppFile->getSuppFileCreator()|escape}.{/if}
            
            {if $suppFile->getSuppFileSponsor()}
            {translate key="author.submit.suppFile.contributorOrSponsor"} {$suppFile->getSuppFileSponsor()|escape}.{/if}
            
            {if $suppFile->getSuppFilePublisher()}
            {translate key="common.publisher"} {$suppFile->getSuppFilePublisher()|escape}.{/if}
            
            {if $suppFile->isInlineable() || $suppFile->getRemoteURL()}{translate key="common.view"}{else}{/if} {if !$suppFile->getRemoteURL()} ({$suppFile->getNiceFileSize()}).{/if}
            </span>
        </div>
        {/foreach}
    {else}
        <div id="SuppFiles" class="Suplementary">
        <h3>{translate key="rt.suppFiles"}</h3>
        <div class="SuppFiles">
            <tr valign="top">
                <td colspan="2" class="noResults">{translate key="author.submit.suppFile.noFile"}</td>
            </tr>
            </div>
        </div>
    {/if}
    </div>
    
    <div id="Declaration" class="Declaration">
        <h3>Declarations</h3>

        <div id="CompetingInterest" class="CompetingInterest">
            <h4>{translate key="author.competingInterests"}</h4>
            <div class="stateCompeting">{translate key="author.statecompetingInterests"}</div>
        </div>

        {if $article->getLocalizedSponsor()}
        <div id="supportingAgencies" class="Agencies">
            <h4>Funding Information</h4>
            <div class="stateAgencies">
            {$article->getLocalizedSponsor()|escape}</div>
        </div>
        {/if}
        
        <div id="PublisherName" class="PublisherName">
            <h4>{translate key="rt.metadata.dublinCore.publisher"}'s Note</h4>
            <div class="statePublisher">{$currentJournal->getSetting('publisherInstitution')|escape} remains neutral with regard to jurisdictional claims in published maps and institutional affiliations.</div>
        </div>
        
        <div id="copyrightBadge">
            <h4 style="font-style: normal;">Open Access</h4>
            <div class="stateDeclaration">
            {translate key="submission.license.Statement0"} {$article->getLicense|escape} {translate key="submission.licenseURL"} (<a href="{$article->getLicenseURL()|escape}" rel="license">{$article->getLicenseURL()|escape}</a>), {translate key="submission.license.Statement1"}
            </div>
        </div>
    </div>

    {if $citationFactory}
    <div id="articleCitations">
        <h3>{translate key="submission.citations"}</h3>

        <div>{iterate from=citationFactory item=citation}
            <p>{$citation->getRawCitation()|strip_unsafe_html}</p>
            {/iterate}
        </div>
        {if $citationFactory->getCount()}{/if}
        <br />
    </div>
    {/if}

    {if $currentJournal}
    <div class="copyrightLicense">
        {if $currentJournal->getSetting('includeCopyrightStatement')}
            <h3>{translate key="submission.copyright"}</h3>
            {translate key="submission.copyrightStatement" copyrightYear=$article->getCopyrightYear()|escape copyrightHolder=$article->getLocalizedCopyrightHolder()|strip_unsafe_html|nl2br}. Hosting by Stipwunaraha Research Media.
        {/if}
        {if $currentJournal->getSetting('includeLicense')}
        <br /><br />
            {if $ccLicenseBadge}
                {$ccLicenseBadge}
            {elseif $article->getLicenseURL()}{translate key="submission.licenseURL"}: <a href="{$article->getLicenseURL()|escape}" rel="license">{$article->getLicenseURL()|escape}</a>
            {/if}
        {/if} <a href="{$article->getLicenseURL()|escape}" rel="license" target="_blank">({$article->getLicenseURL()|escape})</a>, which permits unrestricted use, distribution, and reproduction in any medium, provided you give appropriate credit to the original author(s) and the source, provide a link to the Creative Commons license, and indicate if changes were made. The Creative Commons Public Domain Dedication waiver (<a href="http://creativecommons.org/publicdomain/zero/1.0/" rel="license" itemprop="license" target="_blank">http://creativecommons.org/publicdomain/zero/1.0/</a>) applies to the data made available in this article, unless otherwise stated.
    </div>
    {/if}

    <br />

    <div class="about-article">
        <h3>About this article</h3>
        <div class="metrics c-bibliographic-information">
            <div class="crosmark__adjacent c-bibliographic-information__column">
            <!-- Start Crossmark Snippet v2.0 -->
            <script src="https://crossmark-cdn.crossref.org/widget/v2.0/widget.js"></script>
            <a data-target="crossmark"><img alt="Verify currency and authenticity via CrossMark" src="https://media.stipwunaraha.ac.id/img/crossmark.png" width="57" height="81" /></a>
            <!-- End Crossmark Snippet -->
            </div>

        <div class="c-bibliographic-information__column">
            <div id="CiteAs" class="CiteAs__adjacent" title="Copy or following this instruction in box">
                <h5>Cite this article as: <span class="cite fileView">if using <span title="For using Mendeley you need an account. Register at Mendeley.com then follow the instructions." class="mendeley"><a href="https://www.mendeley.com" target="_blank">Mendeley</a></span> click <a title="Click to save metadata this article using Mendeley" href="javascript:document.getElementsByTagName('body')[0].appendChild(document.createElement('script')).setAttribute('src','https://www.mendeley.com/minified/bookmarklet.js');" class="citing">here</a></span></h5>
                <div class="stateCiteAs">
                {assign var=authors value=$article->getAuthors()}
                {assign var=authorCount value=$authors|@count}
                {foreach from=$authors item=author name=authors key=i}
                {assign var=firstName value=$author->getFirstName()}
                {assign var=middleName value=$author->getMiddleName()}
                {$author->getLastName()|escape}, {$firstName|escape|truncate:1:".":true}{$middleName|escape|truncate:1:".":true}{if $i==$authorCount-2}, &amp; {elseif $i<$authorCount-1}, {/if}{/foreach}, 
                {if $article->getDatePublished()}{$article->getDatePublished()|date_format:'%Y'}{elseif $issue->getDatePublished()}{$issue->getDatePublished()|date_format:'%Y'}{else}{$issue->getYear()|escape}{/if}. {$article->getLocalizedTitle()|strip_unsafe_html|nl2br}. <em>{$currentJournal->getLocalizedTitle()|strip_tags|escape}</em>&nbsp;{if $currentJournal}{$issue->getVolume()|strip_tags|escape}({$issue->getNumber()|escape}): {$article->getPages()|escape}{/if}. 
                {assign var="doi" value=$article->getStoredPubId('doi')}
                {if $article->getPubId('doi')}<a id="pub-id::doi" href="https://doi.org/{$article->getPubId('doi')|escape}" title="Persistent link using digital object identifier">https://doi.org/{$article->getPubId('doi')}</a>{/if}
                </div>
            </div>

            <ul class="c-bibliographic-information__list">
<!--                <li class="c-bibliographic-information__list-item">
                    <h5>Manuscript submitted</h5>
                    <p class="c-bibliographic-information__value">{$article->getDateSubmitted()|date_format:"%e %B %Y"}</p>
                </li> -->
                <li class="c-bibliographic-information__list-item">
                    <h5>Revised</h5>
                    <p class="c-bibliographic-information__value">Not available</p>
                </li>                <li class="c-bibliographic-information__list-item">
                    <h5>Accepted</h5>
                    <p class="c-bibliographic-information__value">Not available</p>
                </li>
                <li class="c-bibliographic-information__list-item">
                    <h5>Published</h5>
                    <p class="c-bibliographic-information__value">{$article->getDatePublished()|date_format:"%e %B %Y"}</p>
                </li>
            </ul>

            <ul class="c-bibliographic-information__list">
            {if $pubId}
                <li class="c-bibliographic-information__list-item">
                    <h5>DOI</h5>
                    <p class="c-bibliographic-information__value">{if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}{else}{$pubId|escape}{/if}</p>
                </li>
            {/if}
                <li class="c-bibliographic-information__list-item">
                    <h5>{translate key="rt.metadata.dublinCore.publisher"} Name</h5>
                    <p class="c-bibliographic-information__value">{$currentJournal->getSetting('publisherInstitution')|escape}</p>
                </li>            
            {if $currentJournal->getSetting('printIssn')}    
                <li class="c-bibliographic-information__list-item">
                    <h5>Print ISSN</h5>
                    <p class="c-bibliographic-information__value">{$currentJournal->getSetting('printIssn')}</p>
                </li>
            {/if}
                <li class="c-bibliographic-information__list-item">
                    <h5>Online ISSN</h5>
                    <p class="c-bibliographic-information__value">{if $currentJournal->getSetting('onlineIssn')}{$currentJournal->getSetting('onlineIssn')}{else}On Process{/if}</p>
                </li>
            </ul>            

            <ul class="c-bibliographic-information__list">
            {if $article->getLocalizedDiscipline()}    
                <li class="c-bibliographic-information__list-item">
                    <h5>{translate key="rt.metadata.sep.discipline"}</h5>
                    <p class="c-bibliographic-information__value">{$article->getLocalizedDiscipline()|escape}</p>
                </li>
            {/if}
            
            {if $article->getLocalizedSubjectClass()}
                <li class="c-bibliographic-information__list-item">
                    <h5>Sub-{translate key="rt.metadata.sep.discipline"}</h5>
                    <p class="c-bibliographic-information__value">{$article->getLocalizedSubjectClass()|escape}</p>
                </li>
            {/if}
            </ul>

            <div class="c-article__heading">
            {if $article->getLocalizedSubject()}
                <h4 class="c-article__sub-heading">{translate key="rt.metadata.dublinCore.subject"}</h4>
                <ul class="c-article-subject-list">
                    {foreach from=$article->getSubject(null) key=metaLocale item=metaValue}
                    {foreach from=$metaValue|explode:"; " item=gsKeyword}
                    {if $gsKeyword}
                    <li class="c-article-subject-list__subject"><span itemprop="about">{$gsKeyword|strip_unsafe_html|nl2br}</span></li>
                    {/if}
                    {/foreach}{/foreach}
                    <span class="article-notes"><i>These keywords were added by the authors and not by machine. This process is static and keywords cannot be updated except using algorithms or other reasons.</i></span>
                </ul>
            {/if}
            </div>

            <div>
            {if $sharingEnabled}
            <!-- start AddThis -->
                <!-- Go to www.addthis.com/dashboard to customize your tools --> <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5b1b8c88d8801350"></script> 
            <!-- end AddThis -->
            {/if}
            {call_hook name="Templates::Article::MoreInfo"}
            </div>
        </div>
        </div>

        <div class="readmores">
            <h4>This article can be traced from</h4>

            <a class="readmore" title="Article in Portal Garuda" href="http://garuda.ristekdikti.go.id/documents?select=doi&q={$article->getPubId('doi')}&pub=" target="_blank"><input type="submit" value="Garuda" class="button"></a>

            <a class="readmore" title="Article in Google Scholar" href="https://scholar.google.co.id/scholar_lookup?title={$article->getLocalizedTitle()|strip_unsafe_html}" target="_blank"><input type="submit" value="Google Scholar" class="button"></a>

            <a class="readmore" title="Article in BASE" href="https://www.base-search.net/Search/Results?lookfor={$article->getPubId('doi')}&name=&oaboost=1&newsearch=1&refid=dcbasen" target="_blank"><input type="submit" value="BASE" class="button"></a>

            <a class="readmore" title="Article in Dimension" href="https://badge.dimensions.ai/details/doi/{$article->getPubId('doi')}?domain={$baseUrl}" target="_blank"><input type="submit" value="Dimension" class="button"></a>

            <a class="readmore" title="Article in CrossRef" href="https://search.crossref.org/?q={$article->getPubId('doi')}" target="_blank"><input type="submit" value="CrossRef" class="button"></a>

            <a class="readmore" title="Article in OCLC WorldCat" href="https://www.worldcat.org/search?q={$article->getLocalizedTitle()|strip_unsafe_html}" target="_blank"><input type="submit" value="OCLC WorldCat" class="button"></a>
        </div>

    </div>

    <div class="comments about-article">
        <h3>Comments</h3>
        <span>By submitting a comment you agree to abide by our Terms and Community Guidelines. If you find something abusive or that does not comply with our terms or guidelines please flag it as inappropriate.</span>
        <div id="disqus_thread"></div>

        <script>

        /**
        *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
        *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
        /*
        var disqus_config = function () {
        this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
        this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
        };
        */
        (function() { // DON'T EDIT BELOW THIS LINE
        var d = document, s = d.createElement('script');
        s.src = 'https://online-jurnal-sistem.disqus.com/embed.js';
        s.setAttribute('data-timestamp', +new Date());
        (d.head || d.body).appendChild(s);
        })();
        </script>
        <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    </div>

    </div> <!-- Close header fulltext-html -->

    {elseif $galley->isPdfGalley()}
    <div class="fullText-epdf">
        {include file="article/pdfViewer.tpl"}<div><div>
    {/if}
{else}

    <div id="cover-issueA" class="c-page-layout__main">
        {call_hook name="Templates::Article::Article::ArticleCoverImage"}
        {if $coverPagePath}
        <div class="articleCoverImage"><img src="{$coverPagePath|escape}{$coverPageFileName|escape}"{if $coverPageAltText != ''} alt="{$coverPageAltText|escape}"{else} alt="{translate key="article.coverPage.altText"}"{/if}{if $width} width="{$width|escape}"{/if}{if $height} height="{$height|escape}" {/if} />
        </div>

        {else}

        <noscript>
        {if $issue->getLocalizedFileName() && $issue->getShowCoverPage($locale) && !$issue->getHideCoverPageArchives($locale)}
            <img class="cover-issue cover-default" {if $issue->getCoverPageAltText($locale) != ''} title="Cover issue {$issue->getCoverPageAltText($locale)|escape}" {else} title="Cover issue {translate key="issue.coverPage.altText"}"{/if} src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $issue->getCoverPageAltText($locale) != ''} alt="{$issue->getCoverPageAltText($locale)|escape}"{else} alt="{translate key="issue.coverPage.altText"}"{/if} style="margin-top: 0" width="100%" />
        {else}
            <img class="cover-issue cover-default img-default" title="Cover issue default" src="//media.stipwunaraha.ac.id/img/img-default.jpg" alt="Stipwunaraha Media & Publishing Group" style="margin-top: 0" width="100%" />
        {/if}
        </noscript>

        {if $issue->getLocalizedFileName() && $issue->getShowCoverPage($locale) && !$issue->getHideCoverPageArchives($locale)}
            <div class="articleCoverImage"><img class="cover-issue cover-default" {if $issue->getCoverPageAltText($locale) != ''} title="Cover issue {$issue->getCoverPageAltText($locale)|escape}" {else} title="Cover issue {translate key="issue.coverPage.altText"}"{/if} src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $issue->getCoverPageAltText($locale) != ''} alt="{$issue->getCoverPageAltText($locale)|escape}"{else} alt="{translate key="issue.coverPage.altText"}"{/if} style="margin-top: 0" width="100%" />
            </div>
        {else}
            <div class="articleCoverImage"><img class="cover-issue cover-default img-default" title="Cover issue default" src="{$publicFilesDir}/{$homepageImage.uploadName|escape}/homepageImage_en_US.jpg" alt="Stipwunaraha Media & Publishing Group" style="margin-top: 0" width="100%" />
            </div>
        {/if}        

        {/if}        
    </div>

    <div id="topBar" class="c-page-layout__side u-text-sm">

        {if $sharingEnabled}
        <!-- start AddThis -->
            {if isset($sharingDropDownMenu)}
                {if isset($sharingUserName)}
                    <script type="text/javascript">
                        var addthis_pub = '{$sharingUserName}';
                    </script>
                {/if}
                <div class="addthis_container share">
                    <a href="http://www.addthis.com/bookmark.php"
                        onmouseover="return addthis_open(this, '', '{$sharingArticleURL|escape:"javascript"}', '{$sharingArticleTitle|escape:"javascript"}')"
                        onmouseout="addthis_close()" onclick="return addthis_sendto()">
                            <img src="{$sharingButtonUrl}" width="{$sharingButtonWidth}" height="{$sharingButtonHeight}" border="0" alt="Bookmark and Share" style="border:0;padding:0" />
                    </a>
                    <script type="text/javascript" src="//s7.addthis.com/js/200/addthis_widget.js#pubid=ra-5c37e6e63536e916"></script>
                </div>
            {else}
                <a href="http://www.addthis.com/bookmark.php"
                    onclick="window.open('http://www.addthis.com/bookmark.php?pub={$sharingUserName|escape:"url"}&amp;url={$sharingRequestURL|escape:"url"}&amp;title={$sharingArticleTitle|escape:"url"}', 'addthis',
                                         'scrollbars=yes,menubar=no,width=620,height=520,resizable=yes,toolbar=no,location=no,status=no');
                             return false;"
                    title="Bookmark using any bookmark manager!" target="_blank">
                        <img src="{$sharingButtonUrl}" width="{$sharingButtonWidth}" height="{$sharingButtonHeight}" border="0" alt="Bookmark and Share" style="border:0;padding:0" />
                </a>
            {/if}
        <!-- end AddThis -->
        {else}
        <div class="share">
            {assign var="doi" value=$article->getStoredPubId('doi')}
            {if $article->getPubId('doi')}
            <a class="anchor social-anchor-facebook" href="http://www.facebook.com/sharer.php?u=https://doi.org/{$article->getPubId('doi')}" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174848.svg" width="25px"></a>
            <a class="anchor social-anchor-twitter" href="http://twitter.com/share?text={$article->getLocalizedTitle()|strip_tags|escape}&amp;url=https://doi.org/{$article->getPubId('doi')}&amp;via=Stipwunaraha_" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174876.svg" width="25px"></a>
            <a class="anchor social-anchor-linkedin" href="https://www.linkedin.com/shareArticle?mini=true&amp;url=https://doi.org/{$article->getPubId('doi')}&amp;title={$article->getLocalizedTitle()|strip_tags|escape}&amp;summary={if $article->getLocalizedAbstract()}{$article->getLocalizedAbstract()|strip_tags|escape}{else}{$article->getLocalizedTitle()|strip_tags|escape}{/if}&amp;source={$currentJournal->getLocalizedTitle()|strip_tags|escape}" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174857.svg" width="25px"></a>
            <a class="anchor social-anchor-whatsapp" href="https://web.whatsapp.com/send?text={$article->getLocalizedTitle()|strip_tags|escape}&amp;url=https://doi.org/{$article->getPubId('doi')}" data-action="share/whatsapp/share" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174879.svg" width="25px"></a>
            <a class="anchor social-anchor-reddit" href="https://reddit.com/submit?url=https://doi.org/{$article->getPubId('doi')}&amp;title={$article->getLocalizedTitle()|strip_tags|escape}" aria-label="Reddit" target="_blank"><img src="https://image.flaticon.com/icons/svg/1051/1051279.svg" width="25px"></a>
            {else}
            <a class="anchor social-anchor-facebook" href="http://www.facebook.com/sharer.php?u={url page="article" op="view" path=$article->getBestArticleId($currentJournal)}" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174848.svg" width="25px"></a>
            <a class="anchor social-anchor-twitter" href="http://twitter.com/share?text={$article->getLocalizedTitle()|strip_tags|escape}&amp;url=https://doi.org/{$article->getPubId('doi')}&amp;via=Stipwunaraha_" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174876.svg" width="25px"></a>
            <a class="anchor social-anchor-linkedin" href="https://www.linkedin.com/shareArticle?mini=true&amp;url={url page="article" op="view" path=$article->getBestArticleId($currentJournal)}&amp;title={$article->getLocalizedTitle()|strip_tags|escape}&amp;summary={if $article->getLocalizedAbstract()}{$article->getLocalizedAbstract()|strip_tags|escape}{else}{$article->getLocalizedTitle()|strip_tags|escape}{/if}&amp;source={$currentJournal->getLocalizedTitle()|strip_tags|escape}" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174857.svg" width="25px"></a>
            <a class="anchor social-anchor-whatsapp" href="https://web.whatsapp.com/send?text={$article->getLocalizedTitle()|strip_tags|escape}&amp;url={url page="article" op="view" path=$article->getBestArticleId($currentJournal)}" data-action="share/whatsapp/share" target="_blank"><img src="https://image.flaticon.com/icons/svg/174/174879.svg" width="25px"></a>
            <a class="anchor social-anchor-reddit" href="https://reddit.com/submit?url={url page="article" op="view" path=$article->getBestArticleId($currentJournal)}&amp;title={$article->getLocalizedTitle()|strip_tags|escape}" aria-label="Reddit" target="_blank"><img src="https://image.flaticon.com/icons/svg/1051/1051279.svg" width="25px"></a>
            {/if}
        </div>        
        {/if}        
        
        <div id="JournalName" class="TitlesJournal"><a title="Go to {$currentJournal->getLocalizedTitle()|strip_tags|escape}" href="{url page="$currentJournal"}">{$currentJournal->getLocalizedTitle()|strip_tags|escape}</a>
        </div>
        
        <div id="InfoVolIssue" class="TitlesJournal">
            <img src="data:image/svg+xml;charset=utf8, %3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='13'%3E%3Cpath fill='none' stroke='%23666' d='M1 0v12h12' stroke-dasharray='1 1'/%3E%3C/svg%3E" height="14px" />
            
            {if $currentJournal} <a title="Go to table of contents for this volume/issue" href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}" class="file">{translate key="issue.volume"} {$issue->getVolume()|strip_tags|escape}, {translate key="issue.issue"} {$issue->getNumber()|escape}</a>, {$issue->getDatePublished()|date_format:"%B %Y"}, Pages {$article->getPages()|escape}{/if} | <a title="Click here to cite this {$article->getLocalizedTitle()|strip_tags|escape}" class="citing" href="#CiteAs">Cite as</a>
        </div>

    <div id="articleTitle">
        <ul class="articleType">
            {if is_a($article, 'PublishedArticle')}{assign var=galleys value=$article->getGalleys()}{/if}
            {if $subscriptionRequired && $showGalleyLinks && !$restrictOnlyPdf}
                {if $purchaseArticleEnabled}
                <li class="no-access u-text-separator-after-micro">{translate key="reader.subscriptionOrFeeAccess"}</li>
                {else}
                <li class="no-access u-text-separator-after-micro">{translate key="reader.subscriptionAccess"}</li>                        
                {/if}
            {else}
            <li class="open-access u-text-separator-after-micro">{translate key="reader.openAccess"}</li>
            {/if}
            <li>{if $section && $section->getLocalizedIdentifyType()}{$section->getLocalizedIdentifyType()|escape}{else}{translate key="rt.metadata.sep.peerReviewed"}{/if}</li>            
        </ul>
        <h2 class="title">{$article->getLocalizedTitle()|strip_unsafe_html}</h2>
    </div>

    <div id="author" class="authorName"><!-- <img src="{$baseUrl}/public/site/images/group.png" height="13px" /> -->
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
            {assign var=count value=$count+1}
            <a href="{url page="search" op="authors" path="view" firstName=$authorFirstName middleName=$authorMiddleName lastName=$authorLastName affiliation=$authorAffiliation country=$authorCountry}" class="authorName" target="_blank">{if $fullname}{$fullname|escape}<sup>{if $contact eq 1} {$count|escape}{else} {$count|escape}{/if}</sup>{if $author->getData('primaryContact')|escape}<svg title="Corresponding Author" focusable="false" viewBox="0 0 106 128" class="icon icon-person" height="11" width="12"><path d="m11.07 1.2e2l0.84-9.29c1.97-18.79 23.34-22.93 41.09-22.93 17.74 0 39.11 4.13 41.08 22.84l0.84 9.38h10.04l-0.93-10.34c-2.15-20.43-20.14-31.66-51.03-31.66s-48.89 11.22-51.05 31.73l-0.91 10.27h10.03m41.93-102.29c-9.72 0-18.24 8.69-18.24 18.59 0 13.67 7.84 23.98 18.24 23.98s18.24-10.31 18.24-23.98c0-9.9-8.52-18.59-18.24-18.59zm0 52.29c-15.96 0-28-14.48-28-33.67 0-15.36 12.82-28.33 28-28.33s28 12.97 28 28.33c0 19.19-12.04 33.67-28 33.67"></path></svg></a>{if $author->getData('email')}<a class="icon" title="{$fullname|escape}, mail: {$author->getData('email')|escape} (Corresponding Author)" href="mailto:{$author->getData('email')|escape}" target="_blank" ><svg xmlns="http://www.w3.org/2000/svg" width="13" height="10" viewBox="0.741 0 13 10"><path fill="#B0A8A3" d="M13.741 0L7.24 5.121.74 0zM.742 1.714L.74 10h6.502l-.001-3.165zm6.501 5.121L7.242 10h6.499V1.714z" alt="mail" /></svg></a>{/if}{else}{/if}{if $author->getData('orcid')} <a title="Go to view {$fullname|escape} orcid-ID profile" href="{$author->getData('orcid')|escape}" target="_blank" class="icon extern"><img src="{$baseUrl}/public/site/images/orcid_16x16.svg" style="height:12px" alt="orcid" /></a>{esle}{/if}{if $author->getUrl()} <a title="Go to view {$fullname|escape} Google Scholar profile" href="{$author->getUrl()|escape}" target="_blank" class="icon extern"><img src="{$baseUrl}/public/site/images/scholar.svg" style="height:14px" alt="scholar" /></a>{else}</a>{/if}{if $i==$authorCount-2}, {elseif $i<$authorCount-1}, {/if}{/if}
        {/foreach}
    </div>

    <div id="affiliationid" class="affiliation">
    {assign var=count value=0}
    {foreach from=$article->getAuthors() item=author name=authorList}
        {assign var=authorAffiliation value=$author->getLocalizedAffiliation()}
        {assign var=count value=$count+1}
        <dt>{if $authorAffiliation||$count}<sup>{$count|escape}</sup></dt>{/if}
        <dd>{$authorAffiliation|escape}, {if $author->getCountry()}{$author->getCountryLocalized()|escape}{/if}.</dd>
    {/foreach}
    </div>

    <div class="articleID">
    <div class="mailingAuthor">
        <svg title="Corresponding Author" focusable="false" viewBox="0 0 106 128" class="icon icon-person" height="11" width="12"><path d="m11.07 1.2e2l0.84-9.29c1.97-18.79 23.34-22.93 41.09-22.93 17.74 0 39.11 4.13 41.08 22.84l0.84 9.38h10.04l-0.93-10.34c-2.15-20.43-20.14-31.66-51.03-31.66s-48.89 11.22-51.05 31.73l-0.91 10.27h10.03m41.93-102.29c-9.72 0-18.24 8.69-18.24 18.59 0 13.67 7.84 23.98 18.24 23.98s18.24-10.31 18.24-23.98c0-9.9-8.52-18.59-18.24-18.59zm0 52.29c-15.96 0-28-14.48-28-33.67 0-15.36 12.82-28.33 28-28.33s28 12.97 28 28.33c0 19.19-12.04 33.67-28 33.67"></path></svg> Corresponding Author
    </div>

    {foreach from=$pubIdPlugins item=pubIdPlugin}
        {if $issue->getPublished()}
            {assign var=pubId value=$pubIdPlugin->getPubId($pubObject)}
        {else}
            {assign var=pubId value=$pubIdPlugin->getPubId($pubObject, true)}{* Preview rather than assign a pubId *}
        {/if}
        {if $pubId}
            {if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}<a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}" title="Permanent link for {$article->getLocalizedTitle()|strip_tags|escape}" href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}">{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}</a>{else}{$pubId|escape}{/if}
        {/if}
    {/foreach}

    {if $galleys}
    {foreach from=$pubIdPlugins item=pubIdPlugin}
        {foreach from=$galleys item=galley name=galleyList}
            {if $issue->getPublished()}
                {assign var=galleyPubId value=$pubIdPlugin->getPubId($galley)}
            {else}
                {assign var=galleyPubId value=$pubIdPlugin->getPubId($galley, true)}{* Preview rather than assign a pubId *}
            {/if}
            {if $galleyPubId}
                <br />
                <br />
                {$pubIdPlugin->getPubIdDisplayType()|escape} ({$galley->getGalleyLabel()|escape}): {if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $galleyPubId)|escape}<a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}-g{$galley->getId()}" href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $galleyPubId)|escape}">{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $galleyPubId)|escape}</a>{else}{$galleyPubId|escape}{/if}
            {/if}
        {/foreach}
    {/foreach}
    {/if}

    {if is_a($article, 'PublishedArticle')}{assign var=galleys value=$article->getGalleys()}{/if}
        {if $subscriptionRequired && $showGalleyLinks && !$restrictOnlyPdf}
        <div id="accessKey" class="right">
            <img src="{$baseUrl}/lib/sep/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />
            {if $purchaseArticleEnabled}
                {translate key="reader.subscriptionOrFeeAccess"}
            {else}
                {translate key="reader.subscriptionAccess"}
            {/if}
        </div>
        {else}
        <div id="accessKey" class="open-access right">{translate key="reader.openAccess"}</div>
    {/if}                
    </div>

    <div id="articleMetric" class="main-context__container" title="Article info of {$article->getLocalizedTitle()|strip_tags|escape}">
        <div class="main-context__column articleInfo"><b class="bold">Article History</b>:
            <!--<div>Manuscript submitted {$article->getDateSubmitted()|date_format:"%e %B %Y"}</div> -->
            <div>{if $lastEditorDecision} {assign var="decision" value=$lastEditorDecision.decision} {translate key=$editorDecisionOptions.$decision}{if $lastEditorDecision.dateDecided != 0} {$lastEditorDecision.dateDecided|date_format:$dateFormatShort}{/if} {else} Revised <i>(under constructions)</i>{/if}</div>
            <div>Accepted <i>(under constructions)</i></div>
            <div>Published {$article->getDatePublished()|date_format:"%e %B %Y"}, First online {$article->getDatePublished()|date_format:"%e %B %Y"}.</div>
        </div>

        <div class="main-context__column viewer">
        <ul class="article-metrics u-sansSerif">
            <li class="article-metrics__item">
                <span class="article-metrics__views">{$article->getViews()}</span>
                <span class="article-metrics__label">views</span>
            </li>
            {if $galleys}{if $galley->isPdfGalley()}     
            <li class="article-metrics__item">
                <span class="article-metrics__views">{$galley->getViews('PdfGalley')}</span>
                <span class="article-metrics__label">download</span>
            </li>
            {/if}{/if}
            {if $galleys}{if $galley->isHTMLGalley()}
            <li class="article-metrics__item">
                <span class="article-metrics__views">{$galley->getViews('HTMLGalley')}</span>
                <span class="article-metrics__label">download</span>
            </li>            
            {/if}{/if}
            <li class="article-metrics__item">
            {if $article->getPubId('doi')}
            <script type="text/javascript" src="https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js"></script><div data-badge-popover="bottom" data-badge-type="donut" data-doi="{$article->getPubId('doi')}" class="altmetric-embed" style="margin-bottom: 1.2em;margin-top: .69em;"></div>
            {else}
            <div data-badge-popover="bottom" data-badge-type="donut" data-doi="{$article->getPubId('doi')}" class="altmetric-embed"></div>
            {/if}
            </li>
            <li class="article-metrics__item" style="vertical-align: bottom;">
                <span class="__dimensions_badge_embed__" data-doi="{$article->getPubId('doi')}" data-style="small_circle" style="margin-bottom: 1.2em;margin-top: .69em;" data-legend="hover-bottom"></span><script async src="https://badge.dimensions.ai/badge.js" charset="utf-8"></script>
            </li>
        </ul>
        </div>
    </div>
    
    {if $article->getLocalizedAbstract()}
    <div id="articleAbstract">
        <h3>{translate key="article.abstract"}</h3>
        <div>{$article->getLocalizedAbstract()|strip_unsafe_html|nl2br}</div>
    </div>
    {/if}

    {if $article->getLocalizedSubject()}
    <div id="articleSubject" class="subjectId Keywords u-font-serif">
    <h3>{translate key="article.subject"}</h3>
        {foreach from=$article->getSubject(null) key=metaLocale item=metaValue}
        {foreach from=$metaValue|explode:"; " item=gsKeyword}
        {if $gsKeyword}
        <span id="keyword" class="keyword">{$gsKeyword|strip_unsafe_html|nl2br}</span>
        {/if}
        {/foreach}{/foreach}
        <!-- <div class="subjectId keyword">{$article->getLocalizedSubject()|strip_unsafe_html|nl2br}</div> -->
    </div>
    <span class="article-notes"><i>These keywords were added by the authors and not by machine. This process is static and keywords cannot be updated except using algorithms or other reasons.</i></span>
    {/if}

    {if (!$subscriptionRequired || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || $subscribedUser || $subscribedDomain)}
        {assign var=hasAccess value=1}
           {else}
        {assign var=hasAccess value=0}
    {/if}
    {if $galleys}
    <div id="articleFullText">
        <h3>{translate key="reader.fullText"}</h3>
    {if $hasAccess || ($subscriptionRequired && $showGalleyLinks)}
    {foreach from=$article->getGalleys() item=galley name=galleyList}<a href="{url page="article" op="view" path=$article->getBestArticleId($currentJournal)|to_array:$galley->getBestGalleyId($currentJournal)}" class="file" {if $galley->getRemoteURL()}target="_blank"{else}target="_blank"{/if} >Download {$galley->getGalleyLabel()|escape} <span class="fileSize">({$galley->getNiceFileSize()})</span></a> to read the full article text
    {if $subscriptionRequired && $showGalleyLinks && $restrictOnlyPdf}
        {if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || !$galley->isPdfGalley()}
        <img src="{$baseUrl}/public/site/images/icon-pdf.png" />
        {else}
        <img src="{$baseUrl}/public/site/images/icon-file.png" />
        {/if}
    {/if}
    {/foreach}
    {if $subscriptionRequired && $showGalleyLinks && !$restrictOnlyPdf}
        {if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN}
            <img src="{$baseUrl}/public/site/images/icon-pdf.png" />
        {else}
            <img src="{$baseUrl}/public/site/images/icon-file.png" />
        {/if}
    {/if}
    {else}
    &nbsp;<a href="{url page="about" op="subscriptions"}" target="_parent">{translate key="reader.subscribersOnly"}</a>
    {/if}
    </div>
    <span class="article-notes"><strong>Note: </strong>Downloadable document is available in {$article->getLanguage()|escape}</span>
    {/if}

    <div id="supplement-files" class="article">
    {if $journalRt->getSupplementaryFiles() && is_a($article, 'PublishedArticle') && $article->getSuppFiles()}
        <h3>{translate key="rt.suppFiles"}</h3>
        {foreach from=$article->getSuppFiles() item=suppFile key=key}
        <div class="supplement-files--value">
            <h6 class="supplement-files--label"><a href="{url page="article" op="downloadSuppFile" path=$article->getBestArticleId()|to_array:$suppFile->getBestSuppFileId($currentJournal)}" class="fileView">{translate key="article.additionalFiles"} {$key+1}:</a></h6>
            <span class="supplement-files--label"><b>{if $suppFile->getSuppFileTitle()}{$suppFile->getSuppFileTitle()|escape}</b>.{/if}
        
            {if $suppFile->getSuppFileDescription()}
            {$suppFile->getSuppFileDescription()|escape|nl2br}.{/if}
            
            {translate key="common.type"} {if $suppFile->getType()|escape}
                    {$suppFile->getType()|escape}.
                {elseif $suppFile->getSuppFileTypeOther()}
                    {$suppFile->getSuppFileTypeOther()|escape}.
                {else}
                    {translate key="common.other"}.
                {/if}
            
            {if $suppFile->getSuppFileCreator()}
            {translate key="author.submit.suppFile.createrOrOwner"} {$suppFile->getSuppFileCreator()|escape}.{/if}
            
            {if $suppFile->getSuppFileSponsor()}
            {translate key="author.submit.suppFile.contributorOrSponsor"} {$suppFile->getSuppFileSponsor()|escape}.{/if}
            
            {if $suppFile->getSuppFilePublisher()}
            {translate key="common.publisher"} {$suppFile->getSuppFilePublisher()|escape}.{/if}
            
            {if $suppFile->isInlineable() || $suppFile->getRemoteURL()}{translate key="common.view"}{else}{/if} {if !$suppFile->getRemoteURL()} ({$suppFile->getNiceFileSize()}).{/if}
            </span>
        </div>
        {/foreach}
    {else}
        <div id="SuppFiles" class="Suplementary">
        <h3>{translate key="rt.suppFiles"}</h3>
        <div class="SuppFiles">
            <tr valign="top">
                <td colspan="2" class="noResults">{translate key="author.submit.suppFile.noFile"}</td>
            </tr>
            </div>
        </div>
    {/if}
    </div>

    <div id="Declaration" class="Declaration">
        <h3>Declarations</h3>

        <div id="CompetingInterest" class="CompetingInterest">
            <h4>{translate key="author.competingInterests"}</h4>
            <div class="stateCompeting">{translate key="author.statecompetingInterests"}</div>
        </div>

        {if $article->getLocalizedSponsor()}
        <div id="supportingAgencies" class="Agencies">
            <h4>Funding Information</h4>
            <div class="stateAgencies">
            {$article->getLocalizedSponsor()|escape}</div>
        </div>
        {/if}
        
        <div id="PublisherName" class="PublisherName">
            <h4>{translate key="rt.metadata.dublinCore.publisher"}'s Note</h4>
            <div class="statePublisher">{$currentJournal->getSetting('publisherInstitution')|escape} remains neutral with regard to jurisdictional claims in published maps and institutional affiliations.</div>
        </div>
        
        <div id="copyrightBadge">
            <h4 style="font-style: normal;">Open Access</h4>
            <div class="stateDeclaration">
            {translate key="submission.license.Statement0"} {$article->getLicense|escape} {translate key="submission.licenseURL"} (<a href="{$article->getLicenseURL()|escape}" rel="license">{$article->getLicenseURL()|escape}</a>), {translate key="submission.license.Statement1"}
            </div>
        </div>
    </div>

    {if $citationFactory->getCount()}
    <div id="articleCitations">
        <h3>{translate key="submission.citations"}</h3>

        <div>{iterate from=citationFactory item=citation}
            <p>{$citation->getRawCitation()|strip_unsafe_html}</p>
            {/iterate}
        </div>
        {if $citationFactory->getCount()}{/if}
        <br />
    </div>
    {/if}

    {if $currentJournal}
    <div class="copyrightLicense">
        {if $currentJournal->getSetting('includeCopyrightStatement')}
            <h3>{translate key="submission.copyright"}</h3>
            {translate key="submission.copyrightStatement" copyrightYear=$article->getCopyrightYear()|escape copyrightHolder=$article->getLocalizedCopyrightHolder()|strip_unsafe_html|nl2br}. Hosting by Stipwunaraha Research Media.
        {/if}
        {if $currentJournal->getSetting('includeLicense')}
        <br /><br />
            {if $ccLicenseBadge}
                {$ccLicenseBadge}
            {elseif $article->getLicenseURL()}{translate key="submission.licenseURL"}: <a href="{$article->getLicenseURL()|escape}" rel="license">{$article->getLicenseURL()|escape}</a>
            {/if}
        {/if} <a href="{$article->getLicenseURL()|escape}" rel="license" target="_blank">({$article->getLicenseURL()|escape})</a>, which permits unrestricted use, distribution, and reproduction in any medium, provided you give appropriate credit to the original author(s) and the source, provide a link to the Creative Commons license, and indicate if changes were made. The Creative Commons Public Domain Dedication waiver (<a href="http://creativecommons.org/publicdomain/zero/1.0/" rel="license" itemprop="license" target="_blank">http://creativecommons.org/publicdomain/zero/1.0/</a>) applies to the data made available in this article, unless otherwise stated.
    </div>
    {/if}

    <br />

    <div class="about-article">
        <h3>About this article</h3>
        <div class="metrics c-bibliographic-information">
            <div class="crosmark__adjacent c-bibliographic-information__column">
            <!-- Start Crossmark Snippet v2.0 -->
            <script src="https://crossmark-cdn.crossref.org/widget/v2.0/widget.js"></script>
            <a data-target="crossmark"><img alt="Verify currency and authenticity via CrossMark" src="https://media.stipwunaraha.ac.id/img/crossmark.png" width="57" height="81" /></a>
            <!-- End Crossmark Snippet -->
            </div>

        <div class="c-bibliographic-information__column">
            <div id="CiteAs" class="CiteAs__adjacent" title="Copy or following this instruction in box">
                <h5>Cite this article as: <span class="cite fileView">if using <span title="For using Mendeley you need an account. Register at Mendeley.com then follow the instructions." class="mendeley"><a href="https://www.mendeley.com" target="_blank">Mendeley</a></span> click <a title="Click to save metadata this article using Mendeley" href="javascript:document.getElementsByTagName('body')[0].appendChild(document.createElement('script')).setAttribute('src','https://www.mendeley.com/minified/bookmarklet.js');" class="citing">here</a></span></h5>
                <div class="stateCiteAs">
                {assign var=authors value=$article->getAuthors()}
                {assign var=authorCount value=$authors|@count}
                {foreach from=$authors item=author name=authors key=i}
                {assign var=firstName value=$author->getFirstName()}
                {assign var=middleName value=$author->getMiddleName()}
                {$author->getLastName()|escape}, {$firstName|escape|truncate:1:".":true}{$middleName|escape|truncate:1:".":true}{if $i==$authorCount-2}, &amp; {elseif $i<$authorCount-1}, {/if}{/foreach}, 
                {if $article->getDatePublished()}{$article->getDatePublished()|date_format:'%Y'}{elseif $issue->getDatePublished()}{$issue->getDatePublished()|date_format:'%Y'}{else}{$issue->getYear()|escape}{/if}. {$article->getLocalizedTitle()|strip_unsafe_html|nl2br}. <em>{$currentJournal->getLocalizedTitle()|strip_tags|escape}</em>&nbsp;{if $currentJournal}{$issue->getVolume()|strip_tags|escape}({$issue->getNumber()|escape}): {$article->getPages()|escape}{/if}. {foreach from=$pubIdPlugins item=pubIdPlugin}
                {if $issue->getPublished()}{assign var=pubId value=$pubIdPlugin->getPubId($pubObject)}{else}{assign var=pubId value=$pubIdPlugin->getPubId($pubObject, true)}{* Preview rather than assign a pubId *}{/if}
                {if $pubId} {if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}<a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}" href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}">{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}</a>{else}{$pubId|escape}{/if} {/if}{/foreach}
                </div>
            </div>

            <ul class="c-bibliographic-information__list">
<!--                <li class="c-bibliographic-information__list-item">
                    <h5>Manuscript submitted</h5>
                    <p class="c-bibliographic-information__value">{$article->getDateSubmitted()|date_format:"%e %B %Y"}</p>
                </li> -->
                <li class="c-bibliographic-information__list-item">
                    <h5>Revised</h5>
                    <p class="c-bibliographic-information__value">Not available</p>
                </li>                <li class="c-bibliographic-information__list-item">
                    <h5>Accepted</h5>
                    <p class="c-bibliographic-information__value">Not available</p>
                </li>
                <li class="c-bibliographic-information__list-item">
                    <h5>Published</h5>
                    <p class="c-bibliographic-information__value">{$article->getDatePublished()|date_format:"%e %B %Y"}</p>
                </li>
            </ul>

            <ul class="c-bibliographic-information__list">
            {if $pubId}
                <li class="c-bibliographic-information__list-item">
                    <h5>DOI</h5>
                    <p class="c-bibliographic-information__value">{if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}{else}{$pubId|escape}{/if}</p>
                </li>
            {/if}
                <li class="c-bibliographic-information__list-item">
                    <h5>{translate key="rt.metadata.dublinCore.publisher"} Name</h5>
                    <p class="c-bibliographic-information__value">{$currentJournal->getSetting('publisherInstitution')|escape}</p>
                </li>            
            {if $currentJournal->getSetting('printIssn')}    
                <li class="c-bibliographic-information__list-item">
                    <h5>Print ISSN</h5>
                    <p class="c-bibliographic-information__value">{$currentJournal->getSetting('printIssn')}</p>
                </li>
            {/if}
                <li class="c-bibliographic-information__list-item">
                    <h5>Online ISSN</h5>
                    <p class="c-bibliographic-information__value">{if $currentJournal->getSetting('onlineIssn')}{$currentJournal->getSetting('onlineIssn')}{else}On Process{/if}</p>
                </li>
            </ul>            

            <ul class="c-bibliographic-information__list">
            {if $article->getLocalizedDiscipline()}    
                <li class="c-bibliographic-information__list-item">
                    <h5>{translate key="rt.metadata.sep.discipline"}</h5>
                    <p class="c-bibliographic-information__value">{$article->getLocalizedDiscipline()|escape}</p>
                </li>
            {/if}
            
            {if $article->getLocalizedSubjectClass()}
                <li class="c-bibliographic-information__list-item">
                    <h5>Sub-{translate key="rt.metadata.sep.discipline"}</h5>
                    <p class="c-bibliographic-information__value">{$article->getLocalizedSubjectClass()|escape}</p>
                </li>
            {/if}
            </ul>

            <div class="c-article__heading">
            {if $article->getLocalizedSubject()}
                <h4 class="c-article__sub-heading">{translate key="rt.metadata.dublinCore.subject"}</h4>
                <ul class="c-article-subject-list">
                    {foreach from=$article->getSubject(null) key=metaLocale item=metaValue}
                    {foreach from=$metaValue|explode:"; " item=gsKeyword}
                    {if $gsKeyword}
                    <li class="c-article-subject-list__subject"><span itemprop="about">{$gsKeyword|strip_unsafe_html|nl2br}</span></li>
                    {/if}
                    {/foreach}{/foreach}
                    <span class="article-notes"><i>These keywords were added by the authors and not by machine. This process is static and keywords cannot be updated except using algorithms or other reasons.</i></span>
                </ul>
            {/if}
            </div>

            <div>
            {if $sharingEnabled}
            <!-- start AddThis -->
                <!-- Go to www.addthis.com/dashboard to customize your tools --> <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5b1b8c88d8801350"></script> 
            <!-- end AddThis -->
            {/if}
            {call_hook name="Templates::Article::MoreInfo"}
            </div>

        </div>
        </div>

        <div class="readmores">
            <h4>This article can be traced from</h4>

            <a class="readmore" title="Article in Portal Garuda" href="http://garuda.ristekdikti.go.id/documents?select=doi&q={$article->getPubId('doi')}&pub=" target="_blank"><input type="submit" value="Garuda" class="button"></a>

            <a class="readmore" title="Article in Google Scholar" href="https://scholar.google.co.id/scholar_lookup?title={$article->getLocalizedTitle()|strip_tags|escape}" target="_blank"><input type="submit" value="Google Scholar" class="button"></a>

            <a class="readmore" title="Article in BASE" href="https://www.base-search.net/Search/Results?lookfor={$article->getPubId('doi')}&name=&oaboost=1&newsearch=1&refid=dcbasen" target="_blank"><input type="submit" value="BASE" class="button"></a>

            <a class="readmore" title="Article in Dimension" href="https://badge.dimensions.ai/details/doi/{$article->getPubId('doi')}?domain={$baseUrl}" target="_blank"><input type="submit" value="Dimension" class="button"></a>

            <a class="readmore" title="Article in CrossRef" href="https://search.crossref.org/?q={$article->getPubId('doi')}" target="_blank"><input type="submit" value="CrossRef" class="button"></a>

            <a class="readmore" title="Article in OCLC WorldCat" href="https://www.worldcat.org/search?q={$article->getLocalizedTitle()|strip_tags|escape}" target="_blank"><input type="submit" value="OCLC WorldCat" class="button"></a>
        </div>

    </div>

    <div class="article__moreInfo">{include file="article/comments.tpl"}</div>

    <div class="comments about-article">
        <h3>Comments</h3>
        <span>By submitting a comment you agree to abide by our Terms and Community Guidelines. If you find something abusive or that does not comply with our terms or guidelines please flag it as inappropriate.</span>
        <div id="disqus_thread"></div>

        <script>

        /**
        *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
        *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
        /*
        var disqus_config = function () {
        this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
        this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
        };
        */
        (function() { // DON'T EDIT BELOW THIS LINE
        var d = document, s = d.createElement('script');
        s.src = 'https://online-jurnal-sistem.disqus.com/embed.js';
        s.setAttribute('data-timestamp', +new Date());
        (d.head || d.body).appendChild(s);
        })();
        </script>
        <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    </div>
</div> <!-- Close haed -->

{/if}

{include file="article/footer.tpl"}
