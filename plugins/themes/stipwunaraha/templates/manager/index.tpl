{**
 * templates/manager/index.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Journal management index.
 *
 *}
{strip}
{assign var="pageTitle" value="manager.journalManagement"}
{include file="common/header-EDITOR017.tpl"}
{/strip}

{if $newVersionAvailable}
<div class="warningMessage">{translate key="site.upgradeAvailable.manager" currentVersion=$currentVersion latestVersion=$latestVersion siteAdminName=$siteAdmin->getFullName() siteAdminEmail=$siteAdmin->getEmail()}</div>
{/if}

<div id="managementPages" class="block pseudoMenu">
<h3>{translate key="manager.managementPages"}</h3>

<ul>
	{if $announcementsEnabled}
		<li><a href="{url op="announcements"}">{translate key="manager.announcements"}</a></li>
	{/if}
	<li><a href="{url op="files"}">{translate key="manager.filesBrowser"}</a></li>
	<li><a href="{url op="importexport"}">{translate key="manager.importExport"}</a></li>
	<li><a href="{url op="sections"}">{translate key="section.sections"}</a></li>
	<li><a href="{url op="languages"}">{translate key="common.languages"}</a></li>
	<li><a href="{url op="groups"}">{translate key="manager.groups"}</a></li>
	<li><a href="{url op="payments"}">{translate key="manager.payments"}</a></li>
	<li><a href="{url op="emails"}">{translate key="manager.emails"}</a></li>
	<li><a href="{url page="rtadmin"}">{translate key="manager.readingTools"}</a></li>
	<li><a href="{url op="reviewForms"}">{translate key="manager.reviewForms"}</a></li>
	<li><a href="{url op="setup"}">{translate key="manager.setup"}</a></li>
	<li><a href="{url op="statistics"}">{translate key="manager.statistics"}</a></li>
	<li><a href="{url op="plugins"}">{translate key="manager.plugins"}</a></li>
	
	{if $publishingMode == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION}
		<li><a href="{url op="subscriptionsSummary"}">{translate key="manager.subscriptions"}</a></li>
	{/if}
	{call_hook name="Templates::Manager::Index::ManagementPages"}
</ul>
</div>


{include file="common/footer.tpl"}
