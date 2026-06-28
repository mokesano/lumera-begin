{**
 * templates/issue/archive.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Issue Archive.
 *
 *}

{strip}
{assign var="pageTitle" value="archive.archivesc"}
{include file="common/header-ISSUE.tpl"}
{/strip}
{$currentJournal->getSetting('$journalTitle')}

{if $currentJournal && $currentJournal->getSetting('onlineIssn')}
	{assign var=issn value=$currentJournal->getSetting('onlineIssn')}
{elseif $currentJournal && $currentJournal->getSetting('printIssn')}
	{assign var=issn value=$currentJournal->getSetting('printIssn')}
{/if}
{if $printIssn} {else if $onlineIssn}
<p id="issnOverview">ISSN: {if $currentJournal->getSetting('printIssn')}{$currentJournal->getSetting('printIssn')} (Print) {/if}{if $currentJournal->getSetting('onlineIssn')}{$currentJournal->getSetting('onlineIssn')} (Online){else}on proccess (Online){/if}</p>
{/if}

{if $currentJournal->getLocalizedSetting('history') != ''}
<div id="journal-history-link ">
	<span class="icon-container info history-link">
		This journal was previously published under other titles
        <a href="{url page="about" op="history" anchor=""}">(view Journal {translate key="about.history"})</a>
    </span>
</div>
{/if}

<div id="issues" >
{iterate from=issues item=issue}
	{if $issue->getYear() != $lastYear}
		{if !$notFirstYear}
			{assign var=notFirstYear value=1}
		{else}
			</div>
		{/if}
		<div id="{translate key="issue.volume"}{$issue->getVolume()|escape}" class="issue-item" >
		<h3>{translate key="issue.volume"} {$issue->getVolume()|escape} <span id="issueDate" class="c-issue">{$issue->getDatePublished('issue.firstYear')|date_format:"%B %Y"} - {$issue->getDatePublished('issue.lastYear')|date_format:"%B %Y"}</span></h3>
		{assign var=lastYear value=$issue->getYear()}
	{/if}

	<div id="issue-{$issue->getId()}" >
	{if $issue->getLocalizedFileName() && $issue->getShowCoverPage($locale) && !$issue->getHideCoverPageArchives($locale)}
	<div class="list">
		<div class="issueCoverImage"><a href="{url op="view" path=$issue->getBestIssueId($currentJournal)}"><img src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $issue->getCoverPageAltText($locale) != ''} alt="{$issue->getCoverPageAltText($locale)|escape}"{else} alt="{translate key="issue.coverPage.altText"}"{/if}/></a>
		</div>
		<div class="issueDescription">
			<h4><a href="{url op="view" path=$issue->getBestIssueId($currentJournal)}">{$issue->getDatePublished()|date_format:"%B %Y"}, {translate key="issue.number"} {$issue->getNumber()|escape}, Articles {$issue->getNumArticles()|escape}{if $issue->getLocalizedTitle($currentJournal)}, {$issue->getLocalizedTitle($currentJournal)|escape}{else}{/if}</a></h4>
			<p>{$issue->getLocalizedDescription()|strip_unsafe_html|nl2br}</p>
		</div>
	</div>
	{else}
	<div class="list">
		<div class="issueDescription">
			<h4><a href="{url op="view" path=$issue->getBestIssueId($currentJournal)}">{$issue->getDatePublished()|date_format:"%B %Y"}, {translate key="issue.number"} {$issue->getNumber()|escape}, Articles {$issue->getNumArticles()|escape}{if $issue->getLocalizedTitle($currentJournal)}, {$issue->getLocalizedTitle($currentJournal)|escape}{else}{/if}</a></h4>
			<p>{$issue->getLocalizedDescription()|strip_unsafe_html|nl2br}</p>
		</div>
	</div>
	{/if}
			<div class="separator" style="clear:left;"></div>
	</div>

{/iterate}
{if $notFirstYear}<br /></div>{/if}

    {if !$issues->wasEmpty()}
    <div >
        <table id="colspan-anchor" width="100%">
            <tbody>
                <tr valign="bottom">
                    <td class="anchor" width="50%" {if !$currentJournal}colspan="2" {/if}align="left">View {page_info iterator=$issues}</td>
                    <td class="anchor" width="50%" colspan="2" style="text-align: right;">{page_links anchor="issues" name="issues" iterator=$issues}</td>
                    </tr>
         </table>
    </div>
    {else}
        {translate key="current.noCurrentIssueDesc"}                
    {/if}
</div>

{include file="common/footer.tpl"}

