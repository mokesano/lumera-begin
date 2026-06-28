{**
 * templates/about/journalSponsorship.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal / Journal Sponsorship.
 *
 *}
{strip}
{assign var="pageTitle" value="about.journalSponsorship"}
{include file="common/header-other.tpl"}
{/strip}

{if not(empty($publisherNote) && empty($publisherInstitution))}
<div id="publisher" class="block">
    <header class="c-anchored-heading"><h3>{translate key="common.publisher"}</h3><a class="c-anchored-heading__helper" href="#navbarMenu">Back to top</a>
    </header>

{if $publisherNote}<p>{$publisherNote|nl2br}</p>{/if}

<p><a href="{$publisherUrl}">{$publisherInstitution|escape}</a></p>
</div>
<div class="separator"></div>
{/if}

{if not (empty($sponsorNote) && empty($sponsors))}
<div id="sponsors" class="block">
    <header class="c-anchored-heading"><h3>{translate key="about.sponsors"}</h3><a class="c-anchored-heading__helper" href="#navbarMenu">Back to top</a>
    </header>

{if $sponsorNote}<p>{$sponsorNote|nl2br}</p>{/if}

{if $sponsors}
  <ul>
    {foreach from=$sponsors item=sponsor}
      {if $sponsor.url}
        <li><a href="{$sponsor.url|escape}">{$sponsor.institution|escape}</a></li>
        {else}
        <li>{$sponsor.institution|escape}</li>
        {/if}
      {/foreach}
  </ul>
{/if}
</div>
<div class="separator"></div>
{/if}

{if !empty($contributorNote) || (!empty($contributors) && !empty($contributors[0].name))}
<div id="contributors" class="block">
    <header class="c-anchored-heading"><h3>{translate key="about.contributors"}</h3><a class="c-anchored-heading__helper" href="#navbarMenu">Back to top</a>
    </header>

{if $contributorNote}<p>{$contributorNote|nl2br}</p>{/if}

{if $contributors}
  <ul>
    {foreach from=$contributors item=contributor}
      {if $contributor.name}
        {if $contributor.url}
          <li><a href="{$contributor.url|escape}">{$contributor.name|escape}</a></li>
          {else}
          <li>{$contributor.name|escape}</li>
          {/if}
        {/if}
      {/foreach}
  </ul>
{/if}
</div>
{/if}

{include file="common/footer.tpl"}

