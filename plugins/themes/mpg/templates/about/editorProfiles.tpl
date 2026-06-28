{**
 * templates/about/editorProfiles.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * View the biography of an editorial team member.
 *
 *}
{strip}
{assign var="pageTitle" value="about.editorProfiles"}
{include file="common/header-people.tpl"}
{/strip}

{assign var=pageTitleTranslated value=$user->getFullName()|escape}
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}

<div id="editorProfile" class="block">
    <h2>{translate key="about.editorProfile"}</h2>
</div>

<div id="main-profiles">
{assign var=pageTitleTranslated value=$user->getFullName()|escape}
    <header class="c-anchored-heading"><h3>{$editor->getFullName()|escape}, Editor</h3><a class="c-anchored-heading__helper" href="#navbarMenu">Back to top</a>
    </header>
</div>

<div id="profilePicContent" style="float: left;padding-right: 1.2em;">
	{assign var="profileImage" value=$user->getSetting('profileImage')}
	{if $profileImage}
		<img height="{$profileImage.height|escape}" width="{$profileImage.width|escape}" alt="{translate key="user.profile.profileImage"}" src="{$sitePublicFilesDir}/{$profileImage.uploadName}" />
	{/if}
</div>

<p>{$user->getLocalizedBiography()|nl2br|strip_unsafe_html}</p>

<p>
	{if $user->getData('orcid')}<a title="View ORCID ID profile" href="{$user->getData('orcid')|escape}" target="_blank" class="orcid"><img src="{$baseUrl}/public/site/images/orcid_16x16.svg" style="height:34px" alt="orcid" /></a>{/if}
    {if $user->getUrl()} <a title="View Google Scholar profile" href="{$user->getUrl()|escape}" target="_blank"><img src="{baseUrl}/public/site/images/scholar.svg" style="height:36px" alt="scholar" /></a>{/if}
    {if $user->getData('fax')}<a title="View Scopus ID profile" href="https://www.scopus.com/authid/detail.uri?authorId={$user->getData('fax')|escape}" target="_blank" class="fax"><img src="{baseUrl}/public/site/images/scopus-brand.svg" style="height:34px" alt="scopus" /></a>{/if}
    {if $user->getData('phone')}<a title="View Sinta ID profile" href="http://sinta2.ristekdikti.go.id/authors/detail?id={$user->getData('phone')|escape}&view=overview" target="_blank" class="phone"><img src="{baseUrl}/public/site/images/sinta-brand.svg" style="height:35px" alt="sinta" /></a>{/if}
</p>

{include file="common/footer.tpl"}

