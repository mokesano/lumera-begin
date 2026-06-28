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
    {if $galley->isPdfGalley()}
    <!-- Begin to pdf galley file -->
        {include file="article/pdfViewer.tpl"}
    {elseif $galley->isHTMLGalley()}

    <div id="publication" class="Publication u-font-sans">
        <table width="100%" ><tbody><tr>
            <td width="12%" bgcolor="#fff" style="padding-top:0em">
                <div id="COSIRELogo" class="text-img">
                    <a title="Go to COSIRE Indonesia" href="https://cosire.org" target="_blank"><img class="u-font-sans" src="{$baseUrl}/public/site/images/cosire-logo.svg" height="100%" width="100%" alt="COSIRE Indonesia"/></a>
                </div></td>
            <td id="JournalName" width="76%" bgcolor="#fff" style="padding-top:0em">
                <div id="JournalName" class="TitlesJournal"><a title="Go to {$currentJournal->getLocalizedTitle()|strip_tags|escape}" href="{url page="$currentJournal"}">{$currentJournal->getLocalizedTitle()|strip_tags|escape}</a></div>
                <div id="InfoVolIssue" class="TitlesJournal"> 
                    {if $issue->getVolume()}<a title="Go to table of contents for this volume/issue" href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}" class="file">{translate key="issue.volume"} {$issue->getVolume()|strip_tags|escape}{if $issue->getNumber()}, {translate key="issue.issue"} {$issue->getNumber()|escape}{else}{/if}</a>, {$issue->getDatePublished()|date_format:"%B %Y"}{if $article->getPages()}, Pages {$article->getPages()|escape}{else}, {$article->getId()|escape}{/if}{else}Available online {$article->getDatePublished()|date_format:"%e %B %Y"}, {$article->getId()|escape}
                    <div><span class="size-m publication-aip-text"><a href="{url page="issue" op="view" path="onlineFirst"}">In Press, Corrected Proof</a></span><span><a class="anchor" href="https://service.elsevier.com/app/answers/detail/a_id/22801/supporthub/sciencedirect/" target="_blank" title="What are Corrected Proof articles?"><svg focusable="false" viewBox="0 0 114 128" width="16" height="16" class="icon icon-help"><path d="m57 8c-14.7 0-28.5 5.72-38.9 16.1-10.38 10.4-16.1 24.22-16.1 38.9 0 30.32 24.68 55 55 55 14.68 0 28.5-5.72 38.88-16.1 10.4-10.4 16.12-24.2 16.12-38.9 0-30.32-24.68-55-55-55zm0 1e1c24.82 0 45 20.18 45 45 0 12.02-4.68 23.32-13.18 31.82s-19.8 13.18-31.82 13.18c-24.82 0-45-20.18-45-45 0-12.02 4.68-23.32 13.18-31.82s19.8-13.18 31.82-13.18zm-0.14 14c-11.55 0.26-16.86 8.43-16.86 18v2h1e1v-2c0-4.22 2.22-9.66 8-9.24 5.5 0.4 6.32 5.14 5.78 8.14-1.1 6.16-11.78 9.5-11.78 20.5v6.6h1e1v-5.56c0-8.16 11.22-11.52 12-21.7 0.74-9.86-5.56-16.52-16-16.74-0.39-0.01-0.76-0.01-1.14 0zm-4.86 5e1v1e1h1e1v-1e1h-1e1z"></path></svg></a></span></div>
                    {/if}
                </div>
            </td>
            <td width="12%" bgcolor="#fff" style="padding-top:0em">
                <div id="coverArticleIssue">
                <noscript>
                {if $issue->getLocalizedFileName() && $issue->getShowCoverPage($locale) && !$issue->getHideCoverPageArchives($locale)}
                    <a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}"><img class="cover-issue cover-default publication-cover-image" {if $issue->getCoverPageAltText($locale) != ''} title="{$currentJournal->getLocalizedTitle()|strip_tags|escape}" {else} title="{$currentJournal->getLocalizedTitle()|strip_tags|escape}"{/if} src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $issue->getCoverPageAltText($locale) != ''} alt="{$currentJournal->getLocalizedTitle()|strip_tags|escape}"{else} alt="{$currentJournal->getLocalizedTitle()|strip_tags|escape}"{/if} style="margin-top: 0" width="170" /></a>
                {else}
                    <a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}"><img class="cover-issue cover-default img-default publication-cover-image" src="//media.stipwunaraha.ac.id/img/img-default.jpg" alt="Stipwunaraha Media & Publishing Group" style="margin-top: 0" width="170" /></a>
                {/if}
                </noscript>

                {if $issue->getLocalizedFileName() && $issue->getShowCoverPage($locale) && !$issue->getHideCoverPageArchives($locale)}
                    <a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}"><img class="cover-issue cover-default publication-cover-image" {if $issue->getCoverPageAltText($locale) != ''} title="{$currentJournal->getLocalizedTitle()|strip_tags|escape}" {else} title="{$currentJournal->getLocalizedTitle()|strip_tags|escape}"{/if} src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $issue->getCoverPageAltText($locale) != ''} alt="{$currentJournal->getLocalizedTitle()|strip_tags|escape}"{else} alt="{$currentJournal->getLocalizedTitle()|strip_tags|escape}"{/if} style="margin-top: 0" width="170" /></a>
                {else}
                    <a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}"><img class="cover-issue cover-default img-default publication-cover-image" src="{$publicFilesDir}/{$homepageImage.uploadName|escape}/homepageImage_en_US.jpg" alt="Stipwunaraha Media & Publishing Group" style="margin-top: 0" width="170" /></a>
                {/if}
                </div>
            </td>
        </tr></tbody>
    </table>
    </div>    
        
    <div id="articleTitle">
        <div class="pubDOI u-font-sans">
        <ul class="info">
            {foreach name=sections from=$publishedArticles item=section key=sectionId}
            {foreach from=$section.articles item=article}
            <li>{if $section.title}<h7 class="tocSectionTitle">{$section.title|escape}</h7>{/if}</li>
            {/foreach}{* articles *}
            {/foreach}{* sections *}
            <li><h7>{if $section && $section->getLocalizedIdentifyType()}{$section->getLocalizedIdentifyType()|escape}{else}{translate key="rt.metadata.pkp.peerReviewed"}{/if}</h7></li>
            </ul>
        </div>
        <h2 class="title u-font-serif">{$article->getLocalizedTitle()|strip_unsafe_html}</h2>
    </div>

    <div id="author" class="authorName u-font-sans">
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
            <a href="{url page="search" op="authors" path="view" firstName=$authorFirstName middleName=$authorMiddleName lastName=$authorLastName affiliation=$authorAffiliation country=$authorCountry}" class="authorName" target="_blank">{if $fullname}{$fullname|escape}<sup>{if $contact eq 1} {$count|escape}{else} {$count|escape}{/if}</sup>{if $author->getData('primaryContact')|escape}<svg title="Corresponding Author" focusable="false" viewBox="0 0 106 128" class="icon icon-person" height="11" width="12"><path d="m11.07 1.2e2l0.84-9.29c1.97-18.79 23.34-22.93 41.09-22.93 17.74 0 39.11 4.13 41.08 22.84l0.84 9.38h10.04l-0.93-10.34c-2.15-20.43-20.14-31.66-51.03-31.66s-48.89 11.22-51.05 31.73l-0.91 10.27h10.03m41.93-102.29c-9.72 0-18.24 8.69-18.24 18.59 0 13.67 7.84 23.98 18.24 23.98s18.24-10.31 18.24-23.98c0-9.9-8.52-18.59-18.24-18.59zm0 52.29c-15.96 0-28-14.48-28-33.67 0-15.36 12.82-28.33 28-28.33s28 12.97 28 28.33c0 19.19-12.04 33.67-28 33.67"></path></svg></a>{if $author->getData('email')} <a class="icon" title="{$fullname|escape}, mail: {$author->getData('email')|escape} (Corresponding Author)" href="mailto:{$author->getData('email')|escape}" target="_blank" ><svg xmlns="http://www.w3.org/2000/svg" width="13" height="10" viewBox="0.741 0 13 10"><path fill="#B0A8A3" d="M13.741 0L7.24 5.121.74 0zM.742 1.714L.74 10h6.502l-.001-3.165zm6.501 5.121L7.242 10h6.499V1.714z" alt="mail" /></svg></a>{/if}{else}{/if}{if $author->getData('orcid')} <a title="Go to view {$fullname|escape} orcid-ID profile" href="{$author->getData('orcid')|escape}" target="_blank" class="icon extern"><img src="{$baseUrl}/public/site/images/orcid_16x16.svg" style="height:12px" alt="orcid" /></a>{esle}{/if}{if $author->getUrl()} <a title="Go to view {$fullname|escape} Google Scholar profile" href="{$author->getUrl()|escape}" target="_blank" class="icon extern"><img src="{$baseUrl}/public/site/images/scholar.svg" style="height:14px" alt="scholar" /></a>{else}</a>{/if}{if $i==$authorCount-2}, {elseif $i<$authorCount-1}, {/if}{/if}
        {/foreach}
    </div>

    <div id="affiliationid" class="affiliation u-font-sans">
        {assign var=count value=0}
        {foreach from=$article->getAuthors() item=author name=authorList}
            {assign var=authorAffiliation value=$author->getLocalizedAffiliation()}
            {assign var=count value=$count+1}
            {if $authorAffiliation||$count}<dt><sup>{$count|escape}</sup></dt> <dd>{$authorAffiliation|escape}, {if $author->getCountry()}{$author->getCountryLocalized()|escape}{/if}.{/if}</dd>
        {/foreach}
    </div>

    <div id="articleMetric" class="articleInfo u-font-sans">
        {assign var="authorRevisionExists" value=false}
        {foreach from=$authorFiles item=authorFile}
            {assign var="authorRevisionExists" value=true}
        {/foreach}

        {assign var="editorRevisionExists" value=false}
        {foreach from=$editorFiles item=editorFile}
            {assign var="editorRevisionExists" value=true}
        {/foreach}
        {if $reviewFile}
            {assign var="reviewVersionExists" value=1}
        {/if}        
        {assign var="firstItem" value=true}
        <div class="articleInfo">Received {$article->getDateSubmitted()|date_format:"%e %B %Y"}, Revised {foreach from=$authorFiles item=authorFile key=key}{$authorFile->getDateModified()|date_format:$dateFormatShort}{if $copyeditFile && ($copyeditFile->getSourceFileId() == $authorFile->getFileId() && $copyeditFile->getSourceRevision() == $authorFile->getRevision())}{$copyeditFile->getDateUploaded()|date_format:$dateFormatShort}{/if}{/foreach}, Accepted {$editorDecision.dateDecided|date_format:"%e %B %Y"}, Available online {$article->getDatePublished()|date_format:"%e %B %Y"}.</div>
    </div>

    {assign var="doi" value=$article->getStoredPubId('doi')}
    {if $article->getPubId('doi')}
    <div id="DOI" class="pubDOI u-font-sans">
        <ul class="info">
            <li><a class="file" href="https://doi.org/{$article->getPubId('doi')|escape}" title="Persistent link using digital object identifier">https://doi.org/{$article->getPubId('doi')}</a></li>
        </ul>
    </div>
    {/if}
    
    <div class="info u-font-sans">
        <div id="articleType" class="openaccess">
            <ul class="info" style="float: left;">
                <li id="openaccess"><div id="articleLicense" class="articleInfo">Under a Creative Commons <a href="{$article->getLicenseURL()|escape}" rel="license">license</a></div></li>
            </ul>
            {if is_a($article, 'PublishedArticle')}{assign var=galleys value=$article->getGalleys()}{/if}
            {if $galleys && $subscriptionRequired && $showGalleyLinks}
            <ul class="info" style="float: right;">
                <li id="articleType" class="openaccess">
                {if $purchaseArticleEnabled}
                    {translate key="reader.subscriptionOrFeeAccess"}
                {else}
                    {translate key="reader.subscriptionAccess"}
                {/if}
                </li>
            </ul>
            {else}
            <ul class="info" style="float: right;">
                <li id="articleType" class="openaccess">{translate key="reader.openAccess"}</li>
            </ul>
            {/if}
        </div>
    </div>

    {if $article->getLocalizedAbstract()}
    <div id="articleAbstract" class="articleAbstract u-font-serif">
        <h6 class="sub-title u-font-serif">{translate key="article.abstract"}</h6>
        <div id="abstract" class="abstractId u-font-serif">{$article->getLocalizedAbstract()|strip_unsafe_html|nl2br}</div>
    </div>
    {/if}

    <!-- setting PDF file insert here -->
    <ul id="issue-navigation" class="issue-navigation u-margin-s-bottom u-bg-grey1"><li class="previous move-left u-padding-s-ver u-padding-s-left"><a class="button-alternative button-alternative-tertiary" href="#"><svg focusable="false" viewBox="0 0 54 128" width="32" height="32" class="icon icon-navigate-left"><path d="m1 61l45-45 7 7-38 38 38 38-7 7z"></path></svg><span class="button-alternative-text"><strong>Previous </strong><span class="extra-detail-1">article</span><span class="extra-detail-2"> in issue</span></span></a></li><li class="next move-right u-padding-s-ver u-padding-s-right"><a class="button-alternative button-alternative-tertiary" href="#"><span class="button-alternative-text"><strong>Next </strong><span class="extra-detail-1">article</span><span class="extra-detail-2"> in issue</span></span><svg focusable="false" viewBox="0 0 54 128" width="32" height="32" class="icon icon-navigate-right"><path d="m1 99l38-38-38-38 7-7 45 45-45 45z"></path></svg></a></li></ul>

    {if $article->getLocalizedSubject()}
    <div id="articleSubject" class="subjectId Keywords u-font-serif">
        <h6 class="sub-title u-font-serif">{translate key="article.subject"}</h6>
        <div class="subjectId u-font-serif">{$article->getLocalizedSubject()|strip_unsafe_html|nl2br}</div>
    </div>
    {/if}    

    <!-- Begin fulltext HTML -->
        {$galley->getHTMLContents()}

    <div id="Declaration" class="Declaration">
        <h6 class="sub-title u-font-serif">Declarations</h6>

        <div id="CompetingInterest" class="CompetingInterest">
            <h3 class="sub2-title u-fonts-serif">{translate key="author.competingInterests"}</h3>
            <div class="stateCompeting u-font-serif">{translate key="author.statecompetingInterests"}</div>
        </div>

        {if $article->getLocalizedSponsor()}
        <div id="supportingAgencies" class="Agencies">
            <h3 class="sub2-title u-fonts-serif">Funding Information</h3>
            <div class="stateAgencies u-font-serif">
            {$article->getLocalizedSponsor()|escape}</div>
        </div>
        {/if}
        
        <div id="PublisherName" class="PublisherName">
            <h3 class="sub2-title u-fonts-serif">{translate key="rt.metadata.dublinCore.publisher"}'s Note</h3>
            <div class="statePublisher u-font-serif">{$currentJournal->getSetting('publisherInstitution')|escape} remains neutral with regard to jurisdictional claims in published maps and institutional affiliations.</div>
        </div>
        
        <div id="copyrightBadge">
            <h3 class="sub2-title u-fonts-serif" style="font-style: normal;">Open Access</h3>
            <div class="stateDeclaration u-font-serif">
            {translate key="submission.license.Statement0"} {$article->getLicense|escape} {translate key="submission.licenseURL"} (<a href="{$article->getLicenseURL()|escape}" rel="license">{$article->getLicenseURL()|escape}</a>), {translate key="submission.license.Statement1"}
            </div>
        </div>
    </div>

    <div id="SuppFiles" class="Suplementary">
    {if $journalRt->getSupplementaryFiles() && is_a($article, 'PublishedArticle') && $article->getSuppFiles()}
        <h6 class="sub-title u-font-serif">{translate key="rt.suppFiles"}</h6>
        {foreach from=$article->getSuppFiles() item=suppFile key=key}
        <div class="supplement-files--value u-font-serif">
            <h4 class="supplement-files--label u-font-serif"><a href="{url page="article" op="downloadSuppFile" path=$article->getBestArticleId()|to_array:$suppFile->getBestSuppFileId($currentJournal)}" class="file">{translate key="article.additionalFiles"} {$key+1}:</a> {if $suppFile->getSuppFileTitle()}<span class="fileHit" title="{$galley->getViews()} click">{$galley->getViews()}</span>{/if}</h4>
            <span class="supplement-files--label u-font-serif"><b class="strong">{if $suppFile->getSuppFileTitle()}{$suppFile->getSuppFileTitle()|escape}</b>.{/if}
            
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
                {translate key="common.publisher"} {$suppFile->getSuppFilePublisher()|escape}{/if}
            
                {if $suppFile->isInlineable() || $suppFile->getRemoteURL()}{translate key="common.view"}{else}{/if} {if !$suppFile->getRemoteURL()} ({$galley->getGalleyLabel()|escape} {$suppFile->getNiceFileSize()}).{/if}
            </span>
        </div>
        {/foreach}
        {else}
        <div id="SuppFiles" class="Suplementary">
        <h6 class="sub-title u-font-serif">{translate key="rt.suppFiles"}</h6>
        <div class="SuppFiles u-font-serif">
            <tr valign="top">
                <td colspan="2" class="noResults">{translate key="author.submit.suppFile.noFile"}</td>
            </tr>
            </div>
        </div>
    {/if}
    </div>
    
    <!-- Citation factory count -->
    <section id="References" class="u-font-serif References bibliography text-s">
        <h6 class="sub-title u-font-serif">{translate key="submission.citations"}</h6>
        <ol class="citationId u-font-serif">
            {iterate from=citationFactory item=citation}
            <li>{$citation->getRawCitation()|strip_unsafe_html}</li>
            {/iterate}
        </ol>
    </section>
    
    
    <div id="copyright" class="copyrightHolder">
        <h6 class="sub-title u-font-serif">{translate key="submission.copyright} and permissions</h6>
        <div class="stateCopyright u-font-serif">
            {if $currentJournal->getSetting('includeCopyrightStatement')}
            {translate key="submission.copyrightStatement" copyrightYear=$article->getCopyrightYear()|strip_unsafe_html|nl2br copyrightHolder=$article->getLocalizedCopyrightHolder()|strip_unsafe_html|nl2br}{/if}</div>
        
        <div id="copyrightBadge">
            <h3 class="sub2-title u-font-serif" style="font-style: normal;">Open Access</h3>
            <div class="stateDeclaration u-font-serif">
            {if $ccLicenseBadge}{$ccLicenseBadge}
            {elseif $article->getLicenseURL()}{/if} {$article->getLicense|escape} (<a href="{$article->getLicenseURL()|escape}" rel="license">{$article->getLicenseURL()|escape}</a>), {translate key="submission.license.Statement1"} 
            </div>
        </div>
        
    </div>
    
    <div id="additionalNotes" class="additionalNotes">
        <h6 class="sub-title u-font-serif">Notes & Bibliometrics</h6>

        <div id="bibliometricts-info" class="section__content bibliographic-information">
            <div class="crossmark">
                <span class="bibliometricts">
                    <div class="crosmark__adjacent c-bibliographic-information__column embed">
                    <!-- Start Crossmark Snippet v2.0 -->
                    <script src="https://crossmark-cdn.crossref.org/widget/v2.0/widget.js"></script>
                    <a data-target="crossmark" class="u-font-sans"><img alt="Verify currency and authenticity via CrossMark" src="https://media.stipwunaraha.ac.id/img/crossmark.png" width="57" height="81" /></a>
                    <!-- End Crossmark Snippet -->
                    </div>
            </div>

        <div class="crossmark__adjacent">
            <div id="CiteAs" class="crossmark__adjacent CiteAs">
                <h3 class="heading">Cite this article as:</h3>
                <div class="stateCiteAs u-font-sans">
                {assign var=authors value=$article->getAuthors()}
                {assign var=authorCount value=$authors|@count}
                {foreach from=$authors item=author name=authors key=i}
                {assign var=firstName value=$author->getFirstName()}
                {assign var=middleName value=$author->getMiddleName()}
                {$author->getLastName()|escape}, {$firstName|escape|truncate:1:".":true}{$middleName|escape|truncate:1:".":true}{if $i==$authorCount-2}, &amp; {elseif $i<$authorCount-1}, {/if}{/foreach}, 
                {if $article->getDatePublished()}{$article->getDatePublished()|date_format:'%Y'}{elseif $issue->getDatePublished()}{$issue->getDatePublished()|date_format:'%Y'}{else}{$issue->getYear()|escape}{/if}. {$article->getLocalizedTitle()|strip_unsafe_html|nl2br}. <em>{$currentJournal->getLocalizedTitle()|strip_tags|escape}</em>&nbsp;{if $currentJournal}{$issue->getVolume()|strip_tags|escape}({$issue->getNumber()|escape}): {$article->getPages()|escape}{/if}. {assign var="doi" value=$article->getStoredPubId('doi')}{if $article->getPubId('doi')}<a id="" title="Permanent link for this article" href="https://doi.org/{$article->getPubId('doi')|escape}">https://doi.org/{$article->getPubId('doi')|escape}</a>{/if}</div>
                </div>

            <ul class="c-bibliographic-information__list">
            <li class="c-bibliographic-information__list-item">
                <h5 class="strong u-font-serif">Submitted</h5>
                <span class="c-bibliographic-information__value u-font-sans">{$article->getDateSubmitted()|date_format:"%e %B %Y"}</span>
            </li>
            <li class="c-bibliographic-information__list-item">
                <h5 class="strong u-font-serif">Revised</h5>
                <span class="c-bibliographic-information__value u-font-sans">Not available</span>
            </li>
            <li class="c-bibliographic-information__list-item">
                <h5 class="strong u-font-serif">Accepted</h5>
                <span class="c-bibliographic-information__value u-font-sans">Not available</span>
            </li>            
            <li class="c-bibliographic-information__list-item">
                <h5 class="strong u-font-serif">Published</h5>
                <span class="c-bibliographic-information__value u-font-sans">{$article->getDatePublished()|date_format:"%e %B %Y"}</span>
            </li>
        </ul>

        <ul class="c-bibliographic-information__list">
            {if $article->getLocalizedDiscipline()}    
            <li class="c-bibliographic-information__item">
                <h5 class="strong u-font-serif">{translate key="rt.metadata.pkp.discipline"}</h5>
                <span class="c-bibliographic-information__value u-font-sans">{$article->getLocalizedDiscipline()|escape}</span>
            </li>{/if}
            
            {if $article->getLocalizedSubjectClass()}
            <li class="c-bibliographic-information__item">
                <h5 class="strong u-font-serif">Sub-{translate key="rt.metadata.pkp.discipline"}</h5>
                <span class="c-bibliographic-information__value u-font-sans">{$article->getLocalizedSubjectClass()|escape}</span>
            </li>{/if}
        </ul>
        
        <ul class="c-bibliographic-information__list">
            {assign var="doi" value=$article->getStoredPubId('doi')}
            {if $article->getPubId('doi')}
            <li class="c-bibliographic-information__item">
                <h5 class="strong u-font-serif">DOI</h5>
                <span class="c-bibliographic-information__value u-font-sans"><a id="" title="Permanent link for this article" href="https://doi.org/{$article->getPubId('doi')|escape}">https://doi.org/{$article->getPubId('doi')|escape}</a></span>
            </li>{/if}
            
            {if $currentJournal->getSetting('publisherInstitution')}
            <li class="c-bibliographic-information__item">
                <h5 class="strong u-font-serif">{translate key="rt.metadata.dublinCore.publisher"} Name</h5>
                <span class="c-bibliographic-information__value u-font-serif">{$currentJournal->getSetting('publisherInstitution')|escape}</span>
            </li>
            {/if}            
        </ul>

        <div class="c-article__heading">
            {if $article->getLocalizedSubject()}
            <h4 class="c-article__sub-heading u-font-serif">{translate key="rt.metadata.dublinCore.subject"}</h4>
            <ul class="c-article-subject-list u-font-sans">
                {if $article->getSubject(null)}{foreach from=$article->getSubject(null) key=metaLocale item=metaValue}
                {foreach from=$metaValue|explode:"; " item=dcSubject}
                <li class="c-article-subject-list__subject u-font-sans">
                    <span itemprop="about">{if $dcSubject}<span class="subjectId--value u-font-sans"><a class="q-gs q-cf" href="//scholar.google.com/scholar?q={$dcSubject|strip_tags|escape}" target="_blank">{$dcSubject|strip_unsafe_html|nl2br}</a></span>{/if}</span></li>
                {/foreach}
                {/foreach}{/if}
            </ul>
            {/if}
        </div>
        
        </div>
                
        {call_hook name="Templates::Article::MoreInfo"}
        
        </div>

    </div>

    {include file="article/comments.tpl"}

    <div class="Footnotes"><dl class="footnote"><dt class="footnote-label"></dt><dd class="u-margin-xxl-left"><p id="np005">Peer review under responsibility of National Institute of Oceanography and Fisheries.</p></dd></dl></div>

    <a class="anchor full-text-link u-font-sans" href="{url page="article" op="view" path=$articleId}" target="_blank" aria-disabled="false" tabindex="0"><span class="anchor-text">View Abstract</span></a>

    <div class="Copyright"><span class="copyright-line u-font-sans">{if $currentJournal->getSetting('includeCopyrightStatement')}© {$article->getCopyrightYear()|strip_unsafe_html|nl2br} {$article->getLocalizedCopyrightHolder()|strip_unsafe_html|nl2br}.{/if} {if $currentJournal->getSetting('publisherInstitution')}Published by {$currentJournal->getSetting('publisherInstitution')|escape}{else}Published by Stipwunaraha Research Media (SRM){/if}.</span></div>   

    </div><!-- End to fulltext HTML --> 

    {/if}
    
{else}
<!-- Begin to fulltext file -->      
    <div id="publication" class="Publication">
        <table width="100%" ><tbody><tr>
            <td width="12%" bgcolor="#fff" style="padding-top:0em">
                <div id="COSIRELogo" class="text-img">
                    <a title="Go to COSIRE Indonesia" href="https://cosire.org" target="_blank"><img class="u-font-sans" src="{$baseUrl}/public/site/images/cosire-logo.svg" height="100%" width="100%" alt="COSIRE Indonesia"/></a>
                </div>
            </td>
            
            <td id="JournalName" width="76%" bgcolor="#fff" style="padding-top:0em">
                <div id="JournalName" class="TitlesJournal"><a title="Go to {$currentJournal->getLocalizedTitle()|strip_tags|escape}" href="{url page="$currentJournal"}">{$currentJournal->getLocalizedTitle()|strip_tags|escape}</a></div>
                <div id="InfoVolIssue" class="TitlesJournal"> 
                    {if $issue->getVolume()}<a title="Go to table of contents for this volume/issue" href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}" class="file">{translate key="issue.volume"} {$issue->getVolume()|strip_tags|escape}{if $issue->getNumber()}, {translate key="issue.issue"} {$issue->getNumber()|escape}{else}{/if}</a>, {$issue->getDatePublished()|date_format:"%B %Y"}{if $article->getPages()}, Pages {$article->getPages()|escape}{else}, {$article->getId()|escape}{/if}{else}Available online {$article->getDatePublished()|date_format:"%e %B %Y"}, {$article->getId()|escape}
                    <div><span class="size-m publication-aip-text"><a href="{url page="issue" op="view" path="onlineFirst"}">In Press, Corrected Proof</a></span><span><a class="anchor" href="https://service.elsevier.com/app/answers/detail/a_id/22801/supporthub/sciencedirect/" target="_blank" title="What are Corrected Proof articles?"><svg focusable="false" viewBox="0 0 114 128" width="16" height="16" class="icon icon-help"><path d="m57 8c-14.7 0-28.5 5.72-38.9 16.1-10.38 10.4-16.1 24.22-16.1 38.9 0 30.32 24.68 55 55 55 14.68 0 28.5-5.72 38.88-16.1 10.4-10.4 16.12-24.2 16.12-38.9 0-30.32-24.68-55-55-55zm0 1e1c24.82 0 45 20.18 45 45 0 12.02-4.68 23.32-13.18 31.82s-19.8 13.18-31.82 13.18c-24.82 0-45-20.18-45-45 0-12.02 4.68-23.32 13.18-31.82s19.8-13.18 31.82-13.18zm-0.14 14c-11.55 0.26-16.86 8.43-16.86 18v2h1e1v-2c0-4.22 2.22-9.66 8-9.24 5.5 0.4 6.32 5.14 5.78 8.14-1.1 6.16-11.78 9.5-11.78 20.5v6.6h1e1v-5.56c0-8.16 11.22-11.52 12-21.7 0.74-9.86-5.56-16.52-16-16.74-0.39-0.01-0.76-0.01-1.14 0zm-4.86 5e1v1e1h1e1v-1e1h-1e1z"></path></svg></a></span></div>
                    {/if}
                </div>
            
            {if is_a($article, 'PublishedArticle')}{assign var=galleys value=$article->getGalleys()}{/if}
            {if $galleys && $subscriptionRequired && $showGalleyLinks}
                <div id="accessKey" class="articleType" style="float: center;">
                {if $purchaseArticleEnabled}
                {else}
                {/if}
                </div>
            {/if}
            </td>

            <td width="12%" bgcolor="#fff" style="padding-top:0em">
                <div id="coverArticleIssue">
                <noscript>
                {if $issue->getLocalizedFileName() && $issue->getShowCoverPage($locale) && !$issue->getHideCoverPageArchives($locale)}
                    <a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}"><img class="cover-issue cover-default publication-cover-image" {if $issue->getCoverPageAltText($locale) != ''} title="{$currentJournal->getLocalizedTitle()|strip_tags|escape}" {else} title="{$currentJournal->getLocalizedTitle()|strip_tags|escape}"{/if} src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $issue->getCoverPageAltText($locale) != ''} alt="{$currentJournal->getLocalizedTitle()|strip_tags|escape}"{else} alt="{$currentJournal->getLocalizedTitle()|strip_tags|escape}"{/if} style="margin-top: 0" width="170" /></a>
                {else}
                    <a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}"><img class="cover-issue cover-default img-default publication-cover-image" src="//media.stipwunaraha.ac.id/img/img-default.jpg" alt="Stipwunaraha Media & Publishing Group" style="margin-top: 0" width="170" /></a>
                {/if}
                </noscript>

                {if $issue->getLocalizedFileName() && $issue->getShowCoverPage($locale) && !$issue->getHideCoverPageArchives($locale)}
                    <a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}"><img class="cover-issue cover-default publication-cover-image" {if $issue->getCoverPageAltText($locale) != ''} title="{$currentJournal->getLocalizedTitle()|strip_tags|escape}" {else} title="{$currentJournal->getLocalizedTitle()|strip_tags|escape}"{/if} src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $issue->getCoverPageAltText($locale) != ''} alt="{$currentJournal->getLocalizedTitle()|strip_tags|escape}"{else} alt="{$currentJournal->getLocalizedTitle()|strip_tags|escape}"{/if} style="margin-top: 0" width="170" /></a>
                {else}
                    <a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}"><img class="cover-issue cover-default img-default publication-cover-image" src="{$publicFilesDir}/{$homepageImage.uploadName|escape}/homepageImage_en_US.jpg" alt="Stipwunaraha Media & Publishing Group" style="margin-top: 0" width="170" /></a>
                {/if}
                </div>
            </td>
        </tr></tbody>
    </table>
    </div>    
        
    <div id="articleTitle">
        <div class="pubDOI u-font-sans">
        <ul class="info">
            {foreach name=sections from=$publishedArticles item=section key=sectionId}
            {foreach from=$section.articles item=article}
            <li>{if $section.title}<h7 class="tocSectionTitle">{$section.title|escape}</h7>{/if}</li>
            {/foreach}{* articles *}
            {/foreach}{* sections *}
            <li><h7>{if $section && $section->getLocalizedIdentifyType()}{$section->getLocalizedIdentifyType()|escape}{else}{translate key="rt.metadata.pkp.peerReviewed"}{/if}</h7></li>
            </ul>
        </div>
        <h2 class="title u-font-serif">{$article->getLocalizedTitle()|strip_unsafe_html}</h2>
    </div>

    <div id="banner" class="Banner">
    <div id="author" class="authorName u-font-sans">
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

    <div id="affiliationid" class="affiliation u-font-sans">
        {assign var=count value=0}
        {foreach from=$article->getAuthors() item=author name=authorList}
        <dl class="affiliation">
            {assign var=authorAffiliation value=$author->getLocalizedAffiliation()}
            {assign var=count value=$count+1}
            {if $authorAffiliation||$count}{if $i=$authorCount-1}<dt><sup>{$count|escape}</sup></dt>{else}{/if} <dd>{$authorAffiliation|escape}, {if $author->getCountry()}{$author->getCountryLocalized()|escape}{/if}.{/if}</dd>
        </dl>
        {/foreach}
    </div>

    <div id="articleMetric" class="articleInfo u-font-sans">
        {assign var="authorRevisionExists" value=false}
        {foreach from=$authorFiles item=authorFile}
            {assign var="authorRevisionExists" value=true}
        {/foreach}
        {assign var="editorRevisionExists" value=false}
        {foreach from=$editorFiles item=editorFile}
            {assign var="editorRevisionExists" value=true}
        {/foreach}
        {assign var="firstItem" value=true}
        <div class="articleInfo">Received {$article->getDateSubmitted()|date_format:"%e %B %Y"},{if $lastDecision == SUBMISSION_EDITOR_DECISION_ACCEPT || $lastDecision == SUBMISSION_EDITOR_DECISION_RESUBMIT} Revised {$authorFile->getDateModified()|date_format:$dateFormatShort}{else}{if $copyeditFile}{$copyeditFile->getDateUploaded()|date_format:$dateFormatShort},{/if} {/if}{if $lastDecision == SUBMISSION_EDITOR_DECISION_ACCEPT || $lastDecision == SUBMISSION_EDITOR_DECISION_RESUBMIT}Accepted {$editorFile->getDateModified()|date_format:$dateFormatShort}{else}{if $copyeditFile}{$copyeditFile->getDateUploaded()|date_format:$dateFormatShort},{/if} {/if}Available online {$article->getDatePublished()|date_format:"%e %B %Y"}.</div>
    </div>

    <div style="margin-left: -3px; margin-bottom: 5px;">
        <!-- Start Crossmark Snippet v2.0 -->
        <script src="https://crossmark-cdn.crossref.org/widget/v2.0/widget.js"></script><a data-target="crossmark"><img src="https://crossmark-cdn.crossref.org/widget/v2.0/logos/CROSSMARK_Color_horizontal.svg" width="150" /></a>
        <!-- End Crossmark Snippet -->
    </div>

    <button class="show-hide-details u-font-sans" type="button" aria-expanded="false"><svg viewBox="0 0 9 9" class="icon-collapse"><path d="M2 5V4h5v1z"></path><path d="M0 0v9h9V0zm1 1h7v7H1z"></path></svg>Show more</button>
    </div>

    <div id="DOI" class="pubDOI u-font-sans">
        <ul class="info">
            <li>
            {foreach from=$pubIdPlugins item=pubIdPlugin}
                {if $issue->getPublished()}
                    {assign var=pubId value=$pubIdPlugin->getPubId($pubObject)}
                {else}
                    {assign var=pubId value=$pubIdPlugin->getPubId($pubObject, true)}{* Preview rather than assign a pubId *}
                {/if}
                {if $pubId}
                    {if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}<a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}" title="Persistent link using digital object identifier" href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}">{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}</a>{else}{$pubId|escape}{/if}
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
                            {$pubIdPlugin->getPubIdDisplayType()|escape} ({$galley->getGalleyLabel()|escape}): {if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $galleyPubId)|escape}<a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}-g{$galley->getId()}" title="Persistent link using digital object identifier" href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $galleyPubId)|escape}">{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $galleyPubId)|escape}</a>{else}{$galleyPubId|escape}{/if}
                        {/if}
                    {/foreach}
                {/foreach}
            {/if}
            </li>
        </ul>        
    </div>
    
    <div class="info u-font-sans">
        <div id="articleType" class="openaccess">
            <ul class="info" style="float: left;">
                <li id="openaccess"><div id="articleLicense" class="articleInfo">Under a Creative Commons <a href="{$article->getLicenseURL()|escape}" target="_blank" rel="license">license</a></div></li>
            </ul>
            {if is_a($article, 'PublishedArticle')}{assign var=galleys value=$article->getGalleys()}{/if}
            {if $galleys && $subscriptionRequired && $showGalleyLinks}
            <ul class="info" style="float: right;">
                <li id="articleType" class="openaccess">{if $purchaseArticleEnabled}{else}{/if}</li>
            {else}
            <ul class="info" style="float: right;">
                <li id="articleType" class="openaccess">{translate key="reader.openAccess"}</li>
            </ul>
            {/if}
        </div>
    </div>

    {if $article->getLocalizedAbstract()}
    <div id="articleAbstract" class="articleAbstract u-font-serif">
        <h6 class="sub-title u-font-serif">{translate key="article.abstract"}</h6>
        <div id="abstract" class="abstractId u-font-serif">{$article->getLocalizedAbstract()|strip_unsafe_html|nl2br}</div>
        </div>
    {/if}

    
    {if (!$subscriptionRequired || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || $subscribedUser || $subscribedDomain)}
        {assign var=hasAccess value=1}
    {else}
        {assign var=hasAccess value=0}
    {/if}
    {if $galleys}
    <ul id="issue-navigation" class="issue-navigation u-margin-s-bottom u-bg-grey1">
        {if $hasAccess || ($subscriptionRequired)}
        {if $galley->isPdfGalley()}
            {foreach from=$article->getGalleys() item=galley name=galleyList}
        <li class="previous move-left u-padding-s-ver u-padding-s-left">
            <a class="button-alternatif" href="{url page="article" op="view" path=$article->getBestArticleId($currentJournal)|to_array:$galley->getBestGalleyId($currentJournal)}" class="file" {if $galley->getRemoteURL()}target="_blank"{else}target="_blank"{/if}><svg focusable="false" viewBox="0 0 32 32" width="32" height="32" class="icon icon-pdf-multicolor pdf-icon"><path d="M7 .362h17.875l6.763 6.1V31.64H6.948V16z" stroke="#000" stroke-width=".703" fill="#fff"></path><path d="M.167 2.592H22.39V9.72H.166z" stroke="#aaa" stroke-width=".315" fill="#da0000"></path><path fill="#fff9f9" d="M5.97 3.638h1.62c1.053 0 1.483.677 1.488 1.564.008.96-.6 1.564-1.492 1.564h-.644v1.66h-.977V3.64m.977.897v1.34h.542c.27 0 .596-.068.596-.673-.002-.6-.32-.667-.596-.667h-.542m3.8.036v2.92h.35c.933 0 1.223-.448 1.228-1.462.008-1.06-.316-1.45-1.23-1.45h-.347m-.977-.94h1.03c1.68 0 2.523.586 2.534 2.39.01 1.688-.607 2.4-2.534 2.4h-1.03V3.64m4.305 0h2.63v.934h-1.657v.894H16.6V6.4h-1.56v2.026h-.97V3.638"></path><path d="M19.462 13.46c.348 4.274-6.59 16.72-8.508 15.792-1.82-.85 1.53-3.317 2.92-4.366-2.864.894-5.394 3.252-3.837 3.93 2.113.895 7.048-9.25 9.41-15.394zM14.32 24.874c4.767-1.526 14.735-2.974 15.152-1.407.824-3.157-13.72-.37-15.153 1.407zm5.28-5.043c2.31 3.237 9.816 7.498 9.788 3.82-.306 2.046-6.66-1.097-8.925-4.164-4.087-5.534-2.39-8.772-1.682-8.732.917.047 1.074 1.307.67 2.442-.173-1.406-.58-2.44-1.224-2.415-1.835.067-1.905 4.46 1.37 9.065z" fill="#f91d0a"></path></svg><span id="articleFullText" class="button-alternatif-text fullTextId pdf">{if is_a($article, 'PublishedArticle')}{assign var=galleys value=$article->getGalleys()}{/if}{if $galleys && $subscriptionRequired && $showGalleyLinks}{if $purchaseArticleEnabled}{translate key="reader.subscriptionOrFeeAccess"} {else}{translate key="reader.subscriptionAccess"} {/if}{else}<strong>Download </strong>full text in {$galley->getGalleyLabel()|escape} {/if}<span class="fileSize">({$galley->getNiceFileSize()|escape})</span></span>
            </a>
        </li>
            {/foreach}
        {else}
        <li class="previous move-left u-padding-s-ver u-padding-s-left"><a class="button-alternative button-alternative-tertiary" href="#"><svg focusable="false" viewBox="0 0 54 128" width="32" height="32" class="icon icon-navigate-left"><path d="m1 61l45-45 7 7-38 38 38 38-7 7z"></path></svg><span class="button-alternative-text"><strong>Previous </strong><span class="extra-detail-1">article</span><span class="extra-detail-2"> in issue</span></span></a></li><li class="next move-right u-padding-s-ver u-padding-s-right"><a class="button-alternative button-alternative-tertiary" href="#"><span class="button-alternative-text"><strong>Next </strong><span class="extra-detail-1">article</span><span class="extra-detail-2"> in issue</span></span><svg focusable="false" viewBox="0 0 54 128" width="32" height="32" class="icon icon-navigate-right"><path d="m1 99l38-38-38-38 7-7 45 45-45 45z"></path></svg></a></li>
        {/if}
        {else}
        <li class="previous move-left u-padding-s-ver u-padding-s-left"><a href="{url page="about" op="subscriptions"}" target="_parent"><span class="button-alternative-text">{translate key="reader.subscribersOnly"}</span></a></li>
        {/if}
    </ul>
    {else}
    <ul id="issue-navigation" class="issue-navigation u-margin-s-bottom u-bg-grey1"><li class="previous move-left u-padding-s-ver u-padding-s-left"><a class="button-alternative button-alternative-tertiary" href="#"><svg focusable="false" viewBox="0 0 54 128" width="32" height="32" class="icon icon-navigate-left"><path d="m1 61l45-45 7 7-38 38 38 38-7 7z"></path></svg><span class="button-alternative-text"><strong>Previous </strong><span class="extra-detail-1">article</span><span class="extra-detail-2"> in issue</span></span></a></li><li class="next move-right u-padding-s-ver u-padding-s-right"><a class="button-alternative button-alternative-tertiary" href="#"><span class="button-alternative-text"><strong>Next </strong><span class="extra-detail-1">article</span><span class="extra-detail-2"> in issue</span></span><svg focusable="false" viewBox="0 0 54 128" width="32" height="32" class="icon icon-navigate-right"><path d="m1 99l38-38-38-38 7-7 45 45-45 45z"></path></svg></a></li></ul>
    {/if}

    {if $article->getLocalizedSubject()}
    <div id="articleSubject" class="subjectId Keywords u-font-serif">
        <div class="keywords-section">
            <h6 class="sub-title u-font-serif">{translate key="article.subject"}</h6>
            {foreach from=$article->getSubject(null) key=metaLocale item=metaValue}
            {foreach from=$metaValue|explode:"; " item=gsKeyword}
            {if $gsKeyword}
            <div id="keyword" class="keyword">{$gsKeyword|strip_unsafe_html|nl2br}</div>
            {/if}
            {/foreach}{/foreach}
            <!-- <div class="subjectId keyword">{$article->getLocalizedSubject()|strip_unsafe_html|nl2br}</div> -->
        </div>
    </div>
    {/if}

    {if $galley}

    <div class="Footnotes"><dl class="footnote"><dt class="footnote-label"></dt><dd class="u-margin-xxl-left"><p id="np005">Peer review under responsibility of National Institute of Oceanography and Fisheries.</p></dd></dl></div>

    <a class="anchor full-text-link u-font-sans file-link" {if $galley}{if $galley->isHTMLGalley()}href="{url page="article" op="view" path=$article->getBestArticleId($currentJournal)|to_array:$galley->getBestGalleyId($currentJournal)}" class="file" {if $galley->getRemoteURL()}target="_blank"{else}target="_blank"{/if} aria-disabled="false" tabindex="0"{elseif $galley->isPdfGalley()}aria-disabled="true" tabindex="-1"{/if}{/if}><span class="anchor-text">View full text</span></a>

    <div class="Copyright"><span class="copyright-line u-font-sans">{if $currentJournal->getSetting('includeCopyrightStatement')}© {$article->getCopyrightYear()|strip_unsafe_html|nl2br} {$article->getLocalizedCopyrightHolder()|strip_unsafe_html|nl2br}.{/if} {if $currentJournal->getSetting('publisherInstitution')}Published by {$currentJournal->getSetting('publisherInstitution')|escape}{else}Published by Stipwunaraha Research Media (SRM){/if}.</span></div>

    </div><!-- End fulltext with Galley PDF -->

    {else}
    <!-- Galley not available begin -->

    <div class="Footnotes"><dl class="footnote"><dt class="footnote-label"></dt><dd class="u-margin-xxl-left"><p id="np005">Peer review under responsibility of National Institute of Oceanography and Fisheries.</p></dd></dl></div>

    <a class="anchor full-text-link u-font-sans file-link" aria-disabled="true" tabindex="-1"><span class="anchor-text">View full text</span></a>

    <div class="Copyright"><span class="copyright-line u-font-sans">{if $currentJournal->getSetting('includeCopyrightStatement')}© {$article->getCopyrightYear()|strip_unsafe_html|nl2br} {$article->getLocalizedCopyrightHolder()|strip_unsafe_html|nl2br}.{/if} {if $currentJournal->getSetting('publisherInstitution')}Published by {$currentJournal->getSetting('publisherInstitution')|escape}{else}Published by Stipwunaraha Research Media (SRM){/if}.</span></div>

    </div><!-- Galley not available end -->
    {/if} 

{/if}

</div>
</div>

{include file="article/footer.tpl"}
