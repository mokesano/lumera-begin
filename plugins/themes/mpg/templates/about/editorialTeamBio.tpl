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
    {assign var="profileImage" value=$user->getSetting('profileImage')}
	{if $profileImage}
	<div id="profile-image" class="editor">
		<img height="auto" width="170" alt="{translate key="user.profile.profileImage"}" src="{$sitePublicFilesDir}/{$profileImage.uploadName}" />
	</div>
	{/if}

{if $user->getLocalizedBiography()}	
<div class="editor-bio">{$user->getLocalizedBiography()|nl2br|strip_unsafe_html}</div>
{/if}

<div class="editor-person u-font-serif">
    
    {if count($editors) == 1}
    <h4 class="person u-font-sans">{translate key="user.role.editor"}, {$currentJournal->getLocalizedTitle()|strip_tags|escape}</h4>
	{else}
		<h4 class="person u-font-sans">{translate key="user.role.editors"}, {$currentJournal->getLocalizedTitle()|strip_tags|escape}</h4>
	{/if}
	
	<div class="affiliation-editor u-font-serif">
    {if $user->getLocalizedAffiliation()}
    <h5 class="person u-font-serif">{$user->getLocalizedAffiliation()|escape}{assign var=needsComma value=1}{/if}{if $country}{if $needsComma}, {/if}{$country|escape}</h5>
	{/if}
	
	{if $user->getData('orcid')}
	{translate key="user.orcid"} link: <a title="View Orcid ID profile" href="{$user->getData('orcid')|escape}" target="_blank" class="fax u-font-serif">{$user->getData('orcid')|escape}</a>{/if}
	
	{if $user->getData('scopus')}/
	{translate key="user.scopus"}: <a title="View Scopus ID profile" href="https://www.scopus.com/authid/detail.uri?authorId={$user->getData('scopus')|escape}" target="_blank" class="scopus u-font-serif">{$user->getData('scopus')|escape}</a>{/if}
    
    {if $user->getData('sinta')}/
    {translate key="user.sinta"}: <a title="View Sinta ID profile" href="http://sinta2.ristekdikti.go.id/authors/detail?id={$user->getData('sinta')|escape}&view=overview" target="_blank" class="sinta u-font-serif">{$user->getData('sinta')|escape}</a>{/if}
	</div>    
</div>

</div><!-- content -->
</div><!-- mainContent -->

{include file="common/footer.tpl"}
