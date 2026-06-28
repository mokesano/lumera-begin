{**
 * templates/about/editorialTeamBoard.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal index.
 *
 *}
{strip}
{assign var="pageTitle" value="about.editorialTeam"}
{include file="common/header-people.tpl"}
{/strip}

{call_hook name="Templates::About::EditorialTeam::Information"}

{foreach from=$groups item=group}
<div id="group" class="block member listAdMenu">
	<h5>{$group->getLocalizedTitle()}</h5>
	{assign var=groupId value=$group->getId()}
	{assign var=members value=$teamInfo[$groupId]}

	<ul class="editorialTeam">
		{foreach from=$members item=member}
			{assign var=user value=$member->getUser()}
			<div id="editor-publication" class="member editor">
				<div id="editorProfile" class="publication-editor" style="float: right;">
				    {assign var="profileImage" value=$user->getSetting('profileImage')}
				    {if $profileImage}
				    <img class="editor-image" height="{$profileImage.height|escape}" width="{$profileImage.width|escape}" alt="{$user->getFullName()|escape}" src="{$sitePublicFilesDir}/{$profileImage.uploadName}" />
				    {/if}
				</div>
			    
			    <div class="editor-name">
			        {if $user->getLocalizedBiography()}<a href="{url op="editorialTeamBio" path=$user->getId()}">{$user->getFullName()|escape}</a>
			        {else}
			        {$user->getFullName()|escape}{/if}
				</div>
				
			    {if $user->getLocalizedAffiliation()}
			    <div class="editor-affiliation">{$user->getLocalizedAffiliation()|escape}{/if}{if $user->getCountry()}{assign var=countryCode value=$user->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}
			    
			    {if $user->getData('orcid')}
			    <div class="editor-mail"><a href="mailto:{$user->getEmail()|escape}">Email {$user->getFullName()|escape}</a></div>{/if}
			    </div>{/if}
			    
			    <div class="clearfix"></div>
			</div>
		{/foreach}{* $members *}
	</ul>
</div>
{/foreach}{* $groups *}

{include file="common/footer.tpl"}
