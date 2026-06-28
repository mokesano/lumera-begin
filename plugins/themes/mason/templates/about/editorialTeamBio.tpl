{**
 * templates/about/editorialTeamBio.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * View the biography of an editorial team member.
 *
 *}
{strip}
{assign var="pageTitle" value="about.editorialTeamBio"}
{include file="common/header-people.tpl"}
{/strip}

{assign var=pageTitleTranslated value=$user->getFullName()|escape}
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}

<div id="mainContent">
    <header class="c-anchored-heading"><h3>{$pageTitleTranslated}, {translate key="user.role.editor"}</h3><a class="c-anchored-heading__helper" href="#main">Back to top</a>
    </header>

<div id="content">
    <div id="profilePicContent" style="float: left;padding-right: 1.2em; padding-bottom: 1.2em;">
	{assign var="profileImage" value=$user->getSetting('profileImage')}
	{if $profileImage}
		<img height="auto" width="170" alt="{translate key="user.profile.profileImage"}" src="{$sitePublicFilesDir}/{$profileImage.uploadName}" />
	{/if}
	</div>
	
<p>{$user->getLocalizedBiography()|nl2br|strip_unsafe_html}</p>

<p><div><strong>{translate key="user.affiliation"}</strong></div>
	{if $user->getLocalizedAffiliation()}{$user->getLocalizedAffiliation()|escape}{assign var=needsComma value=1}{/if}{if $country}{if $needsComma}, {/if}{$country|escape}{/if}
	<br />
	<br />
	<div>External Profiles link</div>
	{if $user->getData('orcid')}{translate key="user.orcid"}: <a title="View Orcid ID profile" href="{$user->getData('orcid')|escape}" target="_blank" class="fax">{$user->getData('orcid')|escape}</a>{/if}
	
	{if $user->getData('scopus')}{translate key="user.scopus"}: <a title="View Scopus ID profile" href="https://www.scopus.com/authid/detail.uri?authorId={$user->getData('scopus')|escape}" target="_blank" class="scopus">{$user->getData('scopus')|escape}</a>{/if}
    
    {if $user->getData('sinta')}{translate key="user.sinta"}: <a title="View Sinta ID profile" href="http://sinta2.ristekdikti.go.id/authors/detail?id={$user->getData('sinta')|escape}&view=overview" target="_blank" class="sinta">{$user->getData('sinta')|escape}</a>{/if}
</p>

</div><!-- content -->
</div><!-- mainContent -->

{include file="common/footer.tpl"}
