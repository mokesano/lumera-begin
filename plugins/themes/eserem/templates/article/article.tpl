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
		{$galley->getHTMLContents()}
	{elseif $galley->isPdfGalley()}
		{include file="article/pdfViewer.tpl"}
	{/if}
{else}
	<div id="topBar">

        <table width="100%" style="border-bottom:1px solid #ccc"><tbody><tr>
            <td width="12%" bgcolor="#fff" style="padding-top:0em">
                <div id="COSIRELogo">
                    <a title="Go to COSIRE Indonesia" href="https://cosire.org" target="_blank"><img src="{$baseUrl}/public/site/images/cosire-logo.svg" height="100%" width="100%" alt="COSIRE Indonesia"/></a>
                </div></td>
            <td id="JournalName" width="76%" bgcolor="#fff" style="padding-top:0em">
                <div id="JournalName" class="TitlesJournal" xmlns="http://www.w3.org/1999/xhtml"><a title="Go to {$currentJournal->getLocalizedTitle()|strip_tags|escape}" href="{url page="$currentJournal"}">{$currentJournal->getLocalizedTitle()|strip_tags|escape}</a></div>
                <div id="InfoVolIssue" class="TitlesJournal"> 
            {if $currentJournal} <a title="Go to table of contents for this volume/issue" href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}" class="file">{translate key="issue.volume"} {$issue->getVolume()|strip_tags|escape}, {translate key="issue.issue"} {$issue->getNumber()|escape}</a>, {$issue->getDatePublished()|date_format:"%B %Y"}, Pages {$article->getPages()|escape}{/if}</div>
            
            {if is_a($article, 'PublishedArticle')}{assign var=galleys value=$article->getGalleys()}{/if}
            {if $galleys && $subscriptionRequired && $showGalleyLinks}
                <div id="accessKey" class="articleType" style="float: center;">
                    <img src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_open_medium.gif" alt="{translate key="article.accessLogoOpen.altText"}" />
                    {translate key="reader.openAccess"}&nbsp;
                    <img src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />
                {if $purchaseArticleEnabled}
                    {translate key="reader.subscriptionOrFeeAccess"}
                {else}
                    {translate key="reader.subscriptionAccess"}
                {/if}
            </div>{/if}
            </td>
            <td width="12%" bgcolor="#fff" style="padding-top:0em">
                <div id="coverArticleIssue"><img src="{$publicFilesDir}/{$homepageImage.uploadName|escape}/homepageImage_en_US.jpg" {if $homepageImageAltText != ''}alt="{$homepageImageAltText|escape}"{else}alt="{$currentJournal->getLocalizedTitle()|strip_tags|escape}"{/if} /></div></td>
        </tr></tbody>
        </table>
        
    </div>    
		
	{if $coverPagePath}
		<div id="articleCoverImage"><img src="{$coverPagePath|escape}{$coverPageFileName|escape}"{if $coverPageAltText != ''} alt="{$coverPageAltText|escape}"{else} alt="{translate key="article.coverPage.altText"}"{/if}{if $width} width="{$width|escape}"{/if}{if $height} height="{$height|escape}"{/if}/>
		</div>
	{/if}
	{call_hook name="Templates::Article::Article::ArticleCoverImage"}

	<div id="articleTitle">
        <div id="DOI" class="pubDOI">
        <ul class="info">
            {foreach name=sections from=$publishedArticles item=section key=sectionId}
            {foreach from=$section.articles item=article}
            <li>{if $section.title}<h7 class="tocSectionTitle">{$section.title|escape}</h7>{/if}</li>
            {/foreach}{* articles *}
            {/foreach}{* sections *}
            <li><h7>{if $section && $section->getLocalizedIdentifyType()}{$section->getLocalizedIdentifyType()|escape}{else}{translate key="rt.metadata.pkp.peerReviewed"}{/if}</h7></li>
            </ul>
        </div>
        <h2>{$article->getLocalizedTitle()|strip_unsafe_html}</h2>
	</div>

    <div id="author" class="authorName">
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
            {assign var=count value=$count+1} <a href="{url page="search" op="authors" path="view" firstName=$authorFirstName middleName=$authorMiddleName lastName=$authorLastName affiliation=$authorAffiliation country=$authorCountry}" class="authorName"> {if $fullname}{$fullname|escape} <sup>{if $contact eq 1}{$count|escape}{else}{$count|escape}{/if}</sup></a>{if $author}{if $author->getData('primaryContact')|escape}<svg title="Corresponding Author" focusable="false" viewBox="0 0 106 128" class="icon icon-person" height="11" width="12"><path d="m11.07 1.2e2l0.84-9.29c1.97-18.79 23.34-22.93 41.09-22.93 17.74 0 39.11 4.13 41.08 22.84l0.84 9.38h10.04l-0.93-10.34c-2.15-20.43-20.14-31.66-51.03-31.66s-48.89 11.22-51.05 31.73l-0.91 10.27h10.03m41.93-102.29c-9.72 0-18.24 8.69-18.24 18.59 0 13.67 7.84 23.98 18.24 23.98s18.24-10.31 18.24-23.98c0-9.9-8.52-18.59-18.24-18.59zm0 52.29c-15.96 0-28-14.48-28-33.67 0-15.36 12.82-28.33 28-28.33s28 12.97 28 28.33c0 19.19-12.04 33.67-28 33.67"></path></svg> {if $author->getData('email')}<a class="icon" title="Corresponding Author Mail: {$author->getData('email')|escape}" href="mailto:{$author->getData('email')|escape}" target="_blank" ><svg xmlns="http://www.w3.org/2000/svg" width="13" height="10" viewBox="0.741 0 13 10"><path fill="#B0A8A3" d="M13.741 0L7.24 5.121.74 0zM.742 1.714L.74 10h6.502l-.001-3.165zm6.501 5.121L7.242 10h6.499V1.714z" alt="mail" /></svg></a>{/if}{/if}
            {if $author->getData('orcid')}<a title="View ORCID ID profile" href="{$author->getData('orcid')|escape}" target="_blank" class="icon"><img src="{$baseUrl}/public/site/images/orcid_16x16.svg" style="height:12px" alt="orcid" /></a>{esle}{/if}
            {if $author->getUrl()}<a title="View Google Scholar profile" href="{$author->getUrl()|escape}" target="_blank" class="icon"><img src="{$baseUrl}/public/site/images/scholar.svg" style="height:14px" alt="scholar" /></a>{else}{/if}{if $i==$authorCount-2} and {elseif $i<$authorCount-1}, {/if}{/if}{/if}
        {/foreach}
        </div>

    {assign="aboutAuthors"}
    <div id="affiliationid" class="affiliation">
        {assign var=count value=0}
        {foreach from=$article->getAuthors() item=author name=authorList}
            {assign var=authorAffiliation value=$author->getLocalizedAffiliation()}
            {assign var=count value=$count+1}
            {if $authorAffiliation||$count}<dt><sup>{$count|escape}</sup></dt> <dd>{$authorAffiliation|escape}, {if $author->getCountry()}{$author->getCountryLocalized()|escape}{/if}.{/if}</dd>
        {/foreach}
        </div>

    <div id="articleMetric" class="articleInfo">
        <div class="articleInfo"> Received {$article->getDateSubmitted()|date_format:"%e %B %Y"}, {if $decisionKey neq 0} | {/if} {assign var="decision" value=$editorDecision.decision}
            {translate key=$editorDecisionOptions.$decision} {if $editorDecision.dateDecided != 0}{$editorDecision.dateDecided|date_format:$dateFormatShort}, {/if}Published {$article->getDatePublished()|date_format:"%e %B %Y"}, Available online {$article->getDatePublished()|date_format:"%e %B %Y"}. {if $galleys}{foreach from=$galleys item=galley name=galleyList} {$galley->getGalleyLabel()} accesses {$galley->getViews()} <em>times</em>{/foreach}{/if}</div>
    </div>

    <div id="crossmark" class="article">
    <!-- Start Crossmark Snippet v2.0 -->
    <script src="https://crossmark-cdn.crossref.org/widget/v2.0/widget.js"></script><a data-target="crossmark"><img src="https://crossmark-cdn.crossref.org/widget/v2.0/logos/CROSSMARK_Color_horizontal.svg" width="150" /></a>
    <!-- End Crossmark Snippet -->
    </div>
    
    {include file="controllers/extrasOnDemand.tpl" id="aboutAuthors" moreDetailsText="search.advancedSearchMore" lessDetailsText="search.advancedSearchLess" extraContent=$aboutAuthors}

    <div id="DOI" class="pubDOI">
        <ul class="info">
            <li>
                {foreach from=$pubIdPlugins item=pubIdPlugin}
    {if $issue->getPublished()}
        {assign var=pubId value=$pubIdPlugin->getPubId($pubObject)}
    {else}
        {assign var=pubId value=$pubIdPlugin->getPubId($pubObject, true)}{* Preview rather than assign a pubId *}
    {/if}
    {if $pubId}
        {if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}<a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}" href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}">{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}</a>{else}{$pubId|escape}{/if}
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

            </li>
        </ul>

        </div>
    
    <div class="info">
        <div id="articleType" class="openaccess">
            <ul class="info" style="float: left;">
                <li id="openaccess"><div id="articleLicense" class="articleInfo">Under a Creative Commons <a href="{$article->getLicenseURL()|escape}" rel="license">license</a></div></li>
                </ul>
            <ul class="info" style="float: right;">
                <li id="articleType" class="openaccess">{translate key="reader.openAccess"}</li>
                </ul>
            </div>
        </div>
    </div>


	{if $article->getLocalizedAbstract()}
    <div id="articleAbstract" class="articleAbstract">
        <h6>{translate key="article.abstract"}</h6>
        <div id="abstract" class="abstractId">{$article->getLocalizedAbstract()|strip_unsafe_html|nl2br}</div>
        </div>
    {/if}

    
    {if $article->getLocalizedSubject()}
    <div id="articleSubject" class="subjectId">
        <h6>{translate key="article.subject"}</h6>
        <p id="articleSubject" class="subjectId">{$article->getLocalizedSubject()|strip_unsafe_html|nl2br}</p>
        </div>
    {/if}


    {if (!$subscriptionRequired || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || $subscribedUser || $subscribedDomain)}
        {assign var=hasAccess value=1}
    {else}
        {assign var=hasAccess value=0}
    {/if}
    
    {if $galleys}
    <table id="detailArticle" width="100%">
        <tbody>
            <tr>
                <td bgcolor="#f2f2f2">&nbsp;&nbsp;&nbsp;</td><td width="50%" bgcolor="#f2f2f2">
                    <div id="articleFullText" class="fullTextId"><svg focusable="false" viewBox="0 0 32 32" width="24" height="24" class="icon icon-pdf-multicolor pdf-icon"><path d="M7 .362h17.875l6.763 6.1V31.64H6.948V16z" stroke="#000" stroke-width=".703" fill="#fff"></path><path d="M.167 2.592H22.39V9.72H.166z" stroke="#aaa" stroke-width=".315" fill="#da0000"></path><path fill="#fff9f9" d="M5.97 3.638h1.62c1.053 0 1.483.677 1.488 1.564.008.96-.6 1.564-1.492 1.564h-.644v1.66h-.977V3.64m.977.897v1.34h.542c.27 0 .596-.068.596-.673-.002-.6-.32-.667-.596-.667h-.542m3.8.036v2.92h.35c.933 0 1.223-.448 1.228-1.462.008-1.06-.316-1.45-1.23-1.45h-.347m-.977-.94h1.03c1.68 0 2.523.586 2.534 2.39.01 1.688-.607 2.4-2.534 2.4h-1.03V3.64m4.305 0h2.63v.934h-1.657v.894H16.6V6.4h-1.56v2.026h-.97V3.638"></path><path d="M19.462 13.46c.348 4.274-6.59 16.72-8.508 15.792-1.82-.85 1.53-3.317 2.92-4.366-2.864.894-5.394 3.252-3.837 3.93 2.113.895 7.048-9.25 9.41-15.394zM14.32 24.874c4.767-1.526 14.735-2.974 15.152-1.407.824-3.157-13.72-.37-15.153 1.407zm5.28-5.043c2.31 3.237 9.816 7.498 9.788 3.82-.306 2.046-6.66-1.097-8.925-4.164-4.087-5.534-2.39-8.772-1.682-8.732.917.047 1.074 1.307.67 2.442-.173-1.406-.58-2.44-1.224-2.415-1.835.067-1.905 4.46 1.37 9.065z" fill="#f91d0a"></path></svg><a href="{url page="article" op="download" path=$article->getBestArticleId($currentJournal)|to_array:$galley->getBestGalleyId($currentJournal)}" class="file" {if $galley->getRemoteURL()}target="_blank"{else}target="_parent"{/if}><strong>Download</strong> {translate key="reader.fullText"}
                    {if $hasAccess || ($subscriptionRequired && $showGalleyLinks)}
                    {foreach from=$article->getGalleys() item=galley name=galleyList}
                    {$galley->getGalleyLabel()|escape}</a>
                    {if $subscriptionRequired && $showGalleyLinks && $restrictOnlyPdf}
                    {if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || !$galley->isPdfGalley()}
                        <img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_open_medium.gif" alt="{translate key="article.accessLogoOpen.altText"}" />
                    {else}
                        <img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />
                        {/if}
                    {/if}
                    {/foreach}
                    {if $subscriptionRequired && $showGalleyLinks && !$restrictOnlyPdf}
                    {if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN}
                        <img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_open_medium.gif" alt="{translate key="article.accessLogoOpen.altText"}" />
                    {else}
                        <img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />
                    {/if}
                {/if}
                {else}
                    &nbsp;<a href="{url page="about" op="subscriptions"}" target="_parent">{translate key="reader.subscribersOnly"}</a>
                {/if}
            </div>
                <td width="50%" bgcolor="#f2f2f2">&nbsp;&nbsp;&nbsp;</td>
                <td width="100%" bgcolor="#f2f2f2">&nbsp;&nbsp;&nbsp;</td>
            </tr>
        </tbody>
    </table>
    {/if}

    

    <div id="Declaration" class="Declaration">
        <h6>Declarations</h6>

        <div id="CompetingInterest" class="CompetingInterest">
            <h3>Acknowledgements</h3>
            <div class="stateCompeting">Hessam Ghanimi, Jennifer McCarthy, and Sabrina Medrano (California State Polytechnic University, USA) greatly helped with the laboratory work. Elena Tricarico (University of Florence) helped with the writing of part of the manuscript and supervised EB’s work during his Master thesis. Biju Kumar (University of Kerala, India) assisted with the specimens from India. Liz Kools and Terry Gosliner facilitated the loan from the CASIZ. Dr R. Ravinesh greatly assisted during field collection in India. An anonymous reviewer provided precious insight and suggestions that greatly helped to improve the manuscript.</div>
        </div>

        <div id="CompetingInterest" class="CompetingInterest">
            <h3>Author(s) contributions</h3>
            <div class="stateCompeting">EB extracted and amplified DNA of part of the specimens, conducted sequence alignment and analysis (haplotype network), prepared Figs. 1, 3 and 4, and was a major contributor in writing the manuscript. FC co-supervised the project, helped prepare Fig. 2, and was a major contributor in writing the manuscript. KEP and HG extracted and amplified DNA of part of the specimens. HB, SG, AJ, SC and JLCC contributed to specimen acquisition, and corrected and improved the final manuscript. DP contributed to specimen acquisition, prepared Fig. 2, and corrected and improved the final manuscript. AV supervised the project, contributed to specimen acquisition, conducted sequence alignment and analysis (ΦST pairwise analysis), and was a major contributor in writing the manuscript. All authors read and approved the final manuscript.</div>
        </div>

        <div id="CompetingInterest" class="CompetingInterest">
            <h3>{translate key="author.competingInterests"}</h3>
            <div class="stateCompeting">{translate key="author.statecompetingInterests"}</div>
        </div>

        {if $article}
        <div id="supportingAgencies" class="Agencies">
            <h3>{translate key="rt.metadata.pkp.sponsors"} or Funding</h3>
            <div class="stateAgencies">
            {$article->getLocalizedSponsor()|escape}</div>
        </div>
        {/if}
        
        <div id="PublisherName" class="PublisherName">
            <h3>{translate key="rt.metadata.dublinCore.publisher"}'s Note</h3>
            <div class="statePublisher">{$currentJournal->getSetting('publisherInstitution')|escape} remains neutral with regard to jurisdictional claims in published maps and institutional affiliations.</div>
        </div>

        <div id="copyrightBadge">
            <h3 style="font-style: normal;">Open Access</h3>
            <div class="stateDeclaration">
            {if $ccLicenseBadge}{$ccLicenseBadge}
            {elseif $article->getLicenseURL()}{/if} {$article->getLicense|escape} (<a href="{$article->getLicenseURL()|escape}" rel="license">{$article->getLicenseURL()|escape}</a>), {translate key="submission.license.Statement1"} 
            </div>
        </div>
    </div>

    {if $suppFile}
    <div id="SuppFiles" class="Suplementary">
        <h6>{translate key="article.suppFiles"}</h6>
        <div class="SuppFiles">
            <table width="100%" class="data">
                <tr valign="top">
                    <td width="20%" class="label">{translate key="common.title"}</td>
                    <td width="80%" class="value">{$suppFile->getSuppFileTitle()|escape|default:"&mdash;"}</td>
                </tr>
                <tr valign="top">
                    <td class="label">{translate key="author.submit.suppFile.createrOrOwner"}</td>
                    <td class="value">{$suppFile->getSuppFileCreator()|escape|default:"&mdash;"}</td>
                </tr>
                <tr valign="top">
                    <td class="label">{translate key="common.subject"}</td>
                    <td class="value">{$suppFile->getSuppFileSubject()|escape|default:"&mdash;"}</td>
                </tr>
                <tr valign="top">
                    <td class="label">{translate key="common.type"}</td>
                    <td class="value">{$suppFile->getType()|escape|default:$suppFile->getSuppFileTypeOther()|default:"&mdash;"}</td>
                </tr>
                <tr valign="top">
                    <td class="label">{translate key="author.submit.suppFile.briefDescription"}</td>
                    <td class="value">{$suppFile->getSuppFileDescription()|escape|nl2br|default:"&mdash;"}</td>
                </tr>
                <tr valign="top">
                    <td class="label">{translate key="common.publisher"}</td>
                    <td class="value">{$suppFile->getSuppFilePublisher()|escape|default:"&mdash;"}</td>
                </tr>
                <tr valign="top">
                    <td class="label">{translate key="author.submit.suppFile.contributorOrSponsor"}</td>
                    <td class="value">{$suppFile->getSuppFileSponsor()|escape|default:"&mdash;"}</td>
                </tr>
                <tr valign="top">
                    <td class="label">{translate key="common.date"}</td>
                    <td class="value">{$suppFile->getDateCreated()|default:"&mdash;"}</td>
                </tr>
                <tr valign="top">
                    <td class="label">{translate key="common.source"}</td>
                    <td class="value">{$suppFile->getSuppFileSource()|escape|default:"&mdash;"}</td>
                </tr>
                <tr valign="top">
                    <td class="label">{translate key="common.language"}</td>
                    <td class="value">{$suppFile->getLanguage()|escape|default:"&mdash;"}</td>
                </tr>
            </table>
        </div>
            <table width="100%" class="data">
                <tr valign="top">
                    <td width="20%" class="label">{translate key="common.fileName"}</td>
                    <td width="80%" class="value"><a href="{url op="downloadFile" path=$articleId|to_array:$suppFile->getFileId()}">{$suppFile->getFileName()|escape}</a></td>
                </tr>
                <tr valign="top">
                    <td class="label">{translate key="common.originalFileName"}</td>
                    <td class="value">{$suppFile->getOriginalFileName()|escape}</td>
                </tr>
                <tr valign="top">
                    <td class="label">{translate key="common.fileSize"}</td>
                    <td class="value">{$suppFile->getNiceFileSize()}</td>
                </tr>
                <tr valign="top">
                    <td class="infoLabel">{translate key="common.dateUploaded"}</td>
                    <td class="value">{$suppFile->getDateUploaded()|date_format:$datetimeFormatShort}</td>
                </tr>
            </table>
            {else}
    <div id="SuppFiles" class="Suplementary">
        <h6>{translate key="article.suppFiles"}</h6>
        <div class="SuppFiles">
            <tr valign="top">
                <td colspan="2" class="noResults">{translate key="author.submit.suppFile.noFile"}</td>
            </tr>
            </div>
        </div>
    {/if}
    

    {if $citationFactory->getCount()}
    <div id="References" class="References">
        <h6>{translate key="submission.citations"}</h6>
        <ol class="citationId">
            {iterate from=citationFactory item=citation}
            <li>{$citation->getRawCitation()|strip_unsafe_html}</li>
            {/iterate}</ol>
        </div>
    {/if}

    
    <div id="copyright" class="copyrightHolder">
        <h6>{translate key="submission.copyright}</h6>
        <div class="stateCopyright">
            {if $currentJournal->getSetting('includeCopyrightStatement')}
            {translate key="submission.copyrightStatement" copyrightYear=$article->getCopyrightYear()|strip_unsafe_html|nl2br copyrightHolder=$article->getLocalizedCopyrightHolder()|strip_unsafe_html|nl2br}{/if}</div>
        <div id="peer-review" class="statePeer">Peer review under responsibility of {$currentJournal->getSetting('publisherInstitution')|escape}</div>
    </div>
    
    <div id="Notes" class="articleNotes">
        <h6>Notes</h6>
            <div class="Note__adjacent">
                <h3>Manuscript submitter by:</h3>
                <div class="statteNotes">
                    {assign var="contact" value=$author->getData('primaryContact')}
                    {if $author}{if $author->getData('primaryContact')|escape}{/if}{/if}
                </div>
            </div>

            <div class="Note__adjacent">
                <h3>Edited by:</h3>
                <div class="statteNotes">
                    assign var=editAssignments value=$submission->getEditAssignments()
                    $editAssignment->getEditorFullName()|escape
                </div>
            </div>
            
            <div class="Note__adjacent">
                <h3>Reviewed by:</h3>
                <div class="statteNotes">
                    $reviewAssignment->getReviewerFullName()|escape
                </div>
            </div>
       {call_hook name="Templates::Article::MoreInfo"}
    </div>

    <div id="additionalNotes" class="additionalNotes">
        <h6>Bibliometrics</h6>

        <div id="bibliometricts-info" class="section__content bibliographic-information">
            

        <div class="crossmark__adjacent">
            <div id="CiteAs" class="crossmark__adjacent CiteAs">
                <h3>Cite this article as:</h3>
                <div class="stateCiteAs">
                {assign var=authors value=$article->getAuthors()}
                {assign var=authorCount value=$authors|@count}
                {foreach from=$authors item=author name=authors key=i}
                {assign var=firstName value=$author->getFirstName()}
                {assign var=middleName value=$author->getMiddleName()}
                {$author->getLastName()|escape}, {$firstName|escape|truncate:1:".":true}{$middleName|escape|truncate:1:".":true}{if $i==$authorCount-2}, &amp; {elseif $i<$authorCount-1}, {/if}{/foreach},

                ({if $article->getDatePublished()}{$article->getDatePublished()|date_format:'%Y'}{elseif $issue->getDatePublished()}{$issue->getDatePublished()|date_format:'%Y'}{else}{$issue->getYear()|escape}{/if}). {$article->getLocalizedTitle()|strip_unsafe_html|nl2br}. <em>{$currentJournal->getLocalizedTitle()|strip_tags|escape}</em>&nbsp;{if $currentJournal}{$issue->getVolume()|strip_tags|escape}({$issue->getNumber()|escape}): {$article->getPages()|escape}{/if}. {foreach from=$pubIdPlugins item=pubIdPlugin}
                {if $issue->getPublished()}
                {assign var=pubId value=$pubIdPlugin->getPubId($pubObject)}
                {else}
                {assign var=pubId value=$pubIdPlugin->getPubId($pubObject, true)}{* Preview rather than assign a pubId *}
                {/if}
                {if $pubId} {if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}<a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}" href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}">{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}</a>{else}{$pubId|escape}{/if} {/if}{/foreach}</div>
                </div>

            <div id="PublisherName" class="PublisherName">
                <h3>{translate key="rt.metadata.dublinCore.publisher"} Name</h3>
                <div class="statePublisher statteCrossmark">{$currentJournal->getSetting('publisherInstitution')|escape}</div>
                </div>

            

            </div>
        
        </div>

    </div>
{/if}


</div>
</div>

{include file="article/footer.tpl"}
