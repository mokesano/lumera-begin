{**
 * templates/about/contact.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal / Journal Contact.
 *
 *}
{strip}
{assign var="pageTitle" value="about.journalContact"}
{include file="common/header-people.tpl"}
{/strip}
<div id="contact">
{if !empty($journalSettings.mailingAddress)}
<div id="mailingAddress" class="block">
<h3>{translate key="common.mailingAddress"} of Journal</h3>
<p>
	{$journalSettings.mailingAddress|nl2br}
</p>
<p><iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3975.896258799155!2d122.72090431426494!3d-4.787835396522983!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2da2358184ab89b5%3A0xbe227579b055d5d0!2sSTIP+WUNA!5e0!3m2!1sen!2sid!4v1517141344126" width="100%" height="300" frameborder="0"></iframe></p>
</div>
{/if}

{if not ($currentJournal->getLocalizedSetting('contactTitle') == '' && $currentJournal->getLocalizedSetting('contactAffiliation') == '' && $currentJournal->getLocalizedSetting('contactMailingAddress') == '' && empty($journalSettings.contactPhone) && empty($journalSettings.contactFax) && empty($journalSettings.contactEmail))}
<div id="principalContact" class="block">
<h3>{translate key="about.contact.principalContact"}</h3>
<p>
	{if !empty($journalSettings.contactName)}
		<strong>{$journalSettings.contactName|escape}</strong><br />
	{/if}

	{assign var=s value=$currentJournal->getLocalizedSetting('contactTitle')}
	{if $s}{$s|escape}<br />{/if}

	{assign var=s value=$currentJournal->getLocalizedSetting('contactAffiliation')}
	{if $s}{$s|escape}<br />{/if}

	{assign var=s value=$currentJournal->getLocalizedSetting('contactMailingAddress')}
	{if $s}{$s|nl2br}{/if}

	{if !empty($journalSettings.contactPhone)}
		{translate key="about.contact.phone"}: {$journalSettings.contactPhone|escape}<br />
	{/if}
	{if !empty($journalSettings.contactFax)}
		{translate key="about.contact.fax"}: {$journalSettings.contactFax|escape}<br />
	{/if}
	{if !empty($journalSettings.contactEmail)}
		{translate key="about.contact.email"}: {mailto address=$journalSettings.contactEmail|escape encode="hex"}<br />
	{/if}
</p>
</div>
{/if}

{if not (empty($journalSettings.supportName) && empty($journalSettings.supportPhone) && empty($journalSettings.supportEmail))}
<div id="supportContact" class="block">
<h3>{translate key="about.contact.supportContact"}</h3>
<p>
	{if !empty($journalSettings.supportName)}
		<strong>{$journalSettings.supportName|escape}</strong><br />
	{/if}
	{if !empty($journalSettings.supportPhone)}
		{translate key="about.contact.phone"}: {$journalSettings.supportPhone|escape}<br />
	{/if}
	{if !empty($journalSettings.supportEmail)}
		{translate key="about.contact.email"}: {mailto address=$journalSettings.supportEmail|escape encode="hex"}<br />
	{/if}
</p>
</div>
{/if}
</div>
{include file="common/footer.tpl"}

