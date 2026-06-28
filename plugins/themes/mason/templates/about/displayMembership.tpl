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

<div id="displayMembership" class="member">
<h4>{$group->getLocalizedTitle()}</h4>
{assign var=groupId value=$group->getId()}

    <ul class="editorialTeam">
        {foreach from=$memberships item=member}
        	{assign var=user value=$member->getUser()}
        	<div id="group" class="member"><li><a href="{url op="editorialTeamBio" path=$user->getId()}">{$user->getFullName()|escape},</a>{if $user->getLocalizedAffiliation()} <em>{$user->getLocalizedAffiliation()|escape}{/if}{if $user->getCountry()}{assign var=countryCode value=$user->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}</em></li>
    	</div>
		{/foreach}
	</ul>
</div>

{include file="common/footer.tpl"}

