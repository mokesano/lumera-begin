{**
 * templates/about/reviewer.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display group membership information.
 *
 *}
{strip}
{assign var="pageTitle" value="about.displayMemberships"}
{include file="common/header-people.tpl"}
{/strip}

<div id="group" class="editor reviewer">
<h5 class="editors">{$group->getLocalizedTitle()}</h5>
{assign var=groupId value=$group->getId()}

    <ul class="editorialTeam">
        {foreach from=$memberships item=member}
        	{assign var=user value=$member->getUser()}
        	<div id="editor-publication" class="member editor reviewer">
				<div id="editorProfile" class="publication-editor">
				    {assign var="profileImage" value=$user->getSetting('profileImage')}
				    {if $profileImage}
				    <img class="editor-image" height="{$profileImage.height|escape}" width="{$profileImage.width|escape}" alt="{$user->getFullName()|escape}" src="{$sitePublicFilesDir}/{$profileImage.uploadName}" />
				    {/if}
				</div>        	    
        	    <div class="editor-name">
        	        {if $user->getLocalizedBiography()}<a href="{url op="editorialTeamBio" path=$user->getId()}">{$user->getFullName()|escape}</a>
        	        {else}
        	        {$user->getFullName()|escape}
        	        {/if}
				</div>
				
				{if $user->getLocalizedAffiliation()}
				<div class="editor-affiliation">{$user->getLocalizedAffiliation()|escape}{/if}{if $user->getCountry()}{assign var=countryCode value=$user->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}</div>
			</div>
		{/foreach}
	</ul>
	
</div>

{include file="common/footer.tpl"}
