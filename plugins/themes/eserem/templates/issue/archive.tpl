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
{include file="common/header-people.tpl"}
{/strip}
{$currentJournal->getSetting('$journalTitle')}
<br />
{if $currentJournal && $currentJournal->getSetting('onlineIssn')}
	{assign var=issn value=$currentJournal->getSetting('onlineIssn')}
{elseif $currentJournal && $currentJournal->getSetting('printIssn')}
	{assign var=issn value=$currentJournal->getSetting('printIssn')}
{/if}
{if $printIssn} {else if $onlineIssn}
<p id="issnOverview">ISSN: {$currentJournal->getSetting('printIssn')} (Print), {$currentJournal->getSetting('onlineIssn')} (Online)</p>
{/if}

{if $currentJournal->getLocalizedSetting('history') != ''}
<div id="journal-history-link">
	<span class="icon-container info">
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
			<br />
			<div class="separator" style="clear:left;"></div>
		{/if}
		<div style="float: left; width: 100%;">
		<h3>{translate key="issue.volume"} {$issue->getVolume()|escape} <span id="issueDate" class="c-issue">{$issue->getDatePublished()|date_format:"%B %Y"}</span></h3>
		{assign var=lastYear value=$issue->getYear()}
	{/if}

	<div id="issue-{$issue->getId()}" style="clear:left;">
	{if $issue->getLocalizedFileName() && $issue->getShowCoverPage($locale) && !$issue->getHideCoverPageArchives($locale)}
	<div class="list">
		<div class="issueCoverImage"><a href="{url op="view" path=$issue->getBestIssueId($currentJournal)}"><img src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $issue->getCoverPageAltText($locale) != ''} alt="{$issue->getCoverPageAltText($locale)|escape}"{else} alt="{translate key="issue.coverPage.altText"}"{/if}/></a>
		</div>
		<div class="issueDescriptionImage">
			<h4><a href="{url op="view" path=$issue->getBestIssueId($currentJournal)}">{$issue->getDatePublished()|date_format:"%B %Y"}, {translate key="issue.number"} {$issue->getNumber()|escape}, {$issue->getLocalizedTitle($currentJournal)|escape}</a></h4>
			<p>{$issue->getLocalizedDescription()|strip_unsafe_html|nl2br}</p>
		</div>
	</div>
	{else}
	<div class="list">
		<div class="issueDescription">
			<h4><a href="{url op="view" path=$issue->getBestIssueId($currentJournal)}">{$issue->getDatePublished()|date_format:"%B %Y"}, {translate key="issue.number"} {$issue->getNumber()|escape}, {$issue->getLocalizedTitle($currentJournal)|escape}</a></h4>
			<p>{$issue->getLocalizedDescription()|strip_unsafe_html|nl2br}</p>
		</div>
	</div>
	{/if}
	</div>

{/iterate}
{if $notFirstYear}<br /></div>{/if}

{if !$issues->wasEmpty()}
	{page_info iterator=$issues}&nbsp;&nbsp;&nbsp;&nbsp;
	{page_links anchor="issues" name="issues" iterator=$issues}
{else}
	{translate key="current.noCurrentIssueDesc"}
{/if}
</div>
{include file="common/footer.tpl"}

