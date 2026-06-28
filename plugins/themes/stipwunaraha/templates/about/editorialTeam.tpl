{**
 * templates/about/editorialTeam.tpl
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

{if count($editors) > 0}
	{foreach from=$editors item=editor}
	{assign var="profileImage" value=$editor->getSetting('profileImage')}
	{if $profileImage}
	<h3 id="Editor-ID{$editor->getId()}" >
		<img id="EditorsID-{$editor->getId()}" height="auto" width="107" title="{$editor->getFullName()|escape}" class="float--left" src="{$sitePublicFilesDir}/{$profileImage.uploadName}" />
	</h3>
	{else}
	<h3 id="Editor-ID{$editor->getId()}" >
		<img id="EditorsID-{$editor->getId()}" class="float--left" title="{$editor->getFullName()|escape}" src="//media.stipwunaraha.ac.id/static/contactPersonM.png" width="107" height="auto" />
	</h3>
	{/if}
	<h3 class="headline-656086398">{if $editor->getLocalizedBiography()}<a href="{url op="editorialTeamBio" path=$editor->getId()}">{$editor->getFullName()|escape}</a>{else}{$editor->getFullName()|escape}{/if}</h3>
		{if $editor->getLocalizedAffiliation()}<p>{$editor->getLocalizedAffiliation()|escape}{/if}{if $editor->getCountry()}{assign var=countryCode value=$editor->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}</p>{/if}
	{if count($editors) == 1}
		<p><strong>Title: </strong>{translate key="user.role.editor"}</p>
	{else}
		<p><strong>Title: </strong>{translate key="user.role.editors"}</p>
	{/if}
	<p><strong>Email: </strong><a href="mailto:{$editor->getEmail()|escape}" target="_self">{$editor->getEmail()|escape}</a></p>
	<p><strong>Area Scope: </strong>{if $editor->getLocalizedGossip()}{$editor->getLocalizedGossip()|escape|default:"&mdash;"}{else}{$editorInterests|escape|default:"&mdash;"}</p>{/if}
	{/foreach}
{/if}

	<h3 class="twoColumnSeparatorLeft--paragraph headline-1159404042"><br></h3>
<div class="editors-area">
	<h3>Area Editors<br></h3>
</div>

{if count($sectionEditors) > 0}
	{foreach from=$sectionEditors item=sectionEditor}
	{assign var="profileImage" value=$sectionEditor->getSetting('profileImage')}
	{if $profileImage}
	<h3 id="Editor-ID{$sectionEditor->getId()}" >
		<img id="Editor-ID{$sectionEditor->getId()}" height="auto" width="107" title="{$sectionEditor->getFullName()|escape}" class="float--left" src="{$sitePublicFilesDir}/{$profileImage.uploadName}" />
	</h3>
	{else}
	<h3 id="Editor-ID{$sectionEditor->getId()}" >
		<img id="Editor-ID{$sectionEditor->getId()}" class="float--left" title="{$sectionEditor->getFullName()|escape}" src="//media.stipwunaraha.ac.id/static/contactPersonM.png" width="107" height="auto" />
	</h3>
	{/if}		
	<h3 class="headline-656086398">{if $sectionEditor->getLocalizedBiography()}<a href="{url op="editorialTeamBio" path=$sectionEditor->getId()}">{$sectionEditor->getFullName()|escape}</a>{else}{$sectionEditor->getFullName()|escape}{/if}</h3>
		{if $sectionEditor->getLocalizedAffiliation()}<p>{$sectionEditor->getLocalizedAffiliation()|escape}{/if}{if $sectionEditor->getCountry()}{assign var=countryCode value=$sectionEditor->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}</p>{/if}
	{if count($sectionEditors) == 1}
		<p><strong>Title: </strong>{translate key="user.role.sectionEditor"}</p>
	{else}
		<p><strong>Title: </strong>{translate key="user.role.sectionEditors"}</p>
	{/if}
	<p><strong>Editorial Area:</strong> {$editorInterests|escape|default:"&mdash;"} </p>
	<p><strong>Area Scope: </strong> {$editorInterests|escape|default:"&mdash;"} </p>
	<h3 class="twoColumnSeparatorLeft--paragraph headline-1159404042"><br></h3>
	{/foreach}
{/if}

{if count($copyEditors) > 0}
<div class="editors-area">
	{if count($copyEditors) == 1}
		<h3>{translate key="user.role.copyeditor"}<br></h3>
	{else}
		<h3>{translate key="user.role.copyeditors"}<br></h3>
	{/if}
</div>
	{foreach from=$copyEditors item=copyEditor}
	<section class="article-body">{if $copyEditor->getLocalizedBiography()}<a href="{url op="editorialTeamBio" path=$copyEditor->getId()}">{$copyEditor->getFullName()|escape}</a>{else}{$copyEditor->getFullName()|escape}{/if},
		{if $copyEditor->getLocalizedAffiliation()}{$copyEditor->getLocalizedAffiliation()|escape}{/if}{if $copyEditor->getCountry()}{assign var=countryCode value=$copyEditor->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}
	</section>
	{/foreach}
	<br>
{/if}

{if count($proofreaders) > 0}
<div class="editors-area">
	{if count($copyEditors) == 1}
		<h3>{translate key="user.role.proofreader"}<br></h3>
	{else}
		<h3>{translate key="user.role.proofreaders"}<br></h3>
	{/if}
</div>
	{foreach from=$proofreaders item=proofreader}
	<section class="article-body">{if $proofreader->getLocalizedBiography()}<a href="{url op="editorialTeamBio" path=$proofreader->getId()}">{$proofreader->getFullName()|escape}</a>{else}{$proofreader->getFullName()|escape}{/if},
		{if $proofreader->getLocalizedAffiliation()}{$proofreader->getLocalizedAffiliation()|escape}{/if}{if $proofreader->getCountry()}{assign var=countryCode value=$proofreader->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}
	</section>
	{/foreach}
	<br>
{/if}

{if count($layoutEditors) > 0}
<div class="editors-area">
	{if count($copyEditors) == 1}
		<h3>{translate key="user.role.layoutEditor"}<br></h3>
	{else}
		<h3>{translate key="user.role.layoutEditors"}<br></h3>
	{/if}
</div>
	{foreach from=$layoutEditors item=layoutEditor}
	<section class="article-body">{if $layoutEditor->getLocalizedBiography()}<a href="{url op="editorialTeamBio" path=$layoutEditor->getId()}">{$layoutEditor->getFullName()|escape}</a>{else}{$layoutEditor->getFullName()|escape}{/if},
		{if $layoutEditor->getLocalizedAffiliation()}{$layoutEditor->getLocalizedAffiliation()|escape}{/if}{if $layoutEditor->getCountry()}{assign var=countryCode value=$layoutEditor->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}
	</section>
	{/foreach}
{/if}

{include file="common/footer.tpl"}

