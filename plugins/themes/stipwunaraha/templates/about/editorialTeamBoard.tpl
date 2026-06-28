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
{include file="common/header-ABOUT.tpl"}
{/strip}

{call_hook name="Templates::About::EditorialTeam::Information"}

{foreach from=$groups item=group}
<div id="group" class="editor-board pseudoMenu">
	<h5>{$group->getLocalizedTitle()}</h5>

<div class="editor-detail">
	{assign var=groupId value=$group->getId()}
	{assign var=members value=$teamInfo[$groupId]}

	<ul class="editorialTeam">
		{foreach from=$members item=member}
			{assign var=user value=$member->getUser()}
			<div class="member"><li>{if $user->getLocalizedBiography()}<a href="{url op="editorialTeamBio" path=$user->getId()}">{$user->getFullName()|escape}</a>{else}{$user->getFullName()|escape}{/if}{if $user->getLocalizedAffiliation()}, <em>{$user->getLocalizedAffiliation()|escape}{/if}{if $user->getCountry()}{assign var=countryCode value=$user->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}</em></li></div>
		{/foreach}{* $members *}
	</ul>
</div>
</div>
{/foreach}{* $groups *}

{include file="common/footer.tpl"}
