{**
 * templates/user/register.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User registration form.
 *
 *}
{strip}
{assign var="pageTitle" value="user.registered"}
{include file="common/header-welcome.tpl"}
{/strip}

<h1 class="c-anchored-heading">{translate key="user.register"}</h1>

<form id="registerForm" method="post" action="{url op="registerUser"}">
    
    <p>{translate key="user.register.completeForm"}</p>

{if !$implicitAuth}
	{if !$existingUser}
		{url|assign:"url" page="user" op="register" existingUser=1}
		<p>{translate key="user.register.alreadyRegisteredOtherJournal" registerUrl=$url}</p>
	{else}
		{url|assign:"url" page="user" op="register"}
		<p>{translate key="user.register.notAlreadyRegisteredOtherJournal" registerUrl=$url}</p>
		<input type="hidden" name="existingUser" value="1"/>
	{/if}

	<div id="userAccount" class="statement">
	    
	    <h3>{translate key="user.profileRegister"}</h3>
	    
	    </div>

	{include file="common/formErrors.tpl"}

	{if $existingUser}
		<p>{translate key="user.register.loginToRegister"} {$currentJournal->getLocalizedTitle()|strip_tags|escape}.</p>
	{/if}
{/if}{* !$implicitAuth *}

{if $source}
	<input type="hidden" name="source" value="{$source|escape}" />
{/if}

{if ! $implicitAuth}
	<b id="userRegister"><span class="formRequired">{translate key="common.requiredField"}</span></b>
{/if}{* !$implicitAuth *}

    <div class="c-form-field">
        {if count($formLocales) > 1 && !$existingUser}
        {fieldLabel name="formLocale" key="form.formLanguage" class="c-form-field__label"}
            
        {url|assign:"userRegisterUrl" page="user" op="register" escape=false}
		{form_language_chooser form="register" url=$userRegisterUrl}
		
		<div id="instruct" class="statement">
		        <p class="statement">{translate key="form.formLanguage.description"}</p></div>
		
		{/if}{* count($formLocales) > 1 && !$existingUser *}
		</div>

    <div class="p-grid">
    	<div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-md">
        {if !$existingUser}
        {fieldLabel name="email" required="true" key="user.email" class="c-form-field__label"}
        <input class="c-form-field__input" type="email" id="signup-email" name="email" value="{$email|escape}" size="30" maxlength="90" />
        {/if}{* !$existingUser *}    		
        </div>

		<div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-md">		
		{fieldLabel name="confirmEmail" required="true" key="user.confirmEmail" class="c-form-field__label"}
			<input type="text" id="confirmEmail" name="confirmEmail" value="{$confirmEmail|escape}" size="30" maxlength="90" class="c-form-field__input" />
        {if $privacyStatement}<a class="action" href="#registryStatement" style="float:right">{translate key="user.register.privacyStatement"}</a>{/if}
		</div>
    </div>

    <div class="c-form-field">
        {if !$existingUser}
        {fieldLabel name="username" required="true" key="user.username" class="c-form-field__label"}
        <input type="text" name="username" value="{$username|escape}" id="username" size="30" maxlength="90" class="c-form-field__input" />
        {if !$existingUser}
        
        <div id="instruct" class="statement">
            <p class="statement">{translate key="user.register.usernameRestriction"}</p>
            </div>
        </div>

    <div class="p-grid">
        <div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-md">
            {fieldLabel name="password" required="true" key="user.password" class="c-form-field__label"}
            <input type="password" name="password" value="{$password|escape}" id="password" size="20" class="c-form-field__input" />
            </div>
        <div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-md">
            
            {fieldLabel name="password2" required="true" key="user.repeatPassword" class="c-form-field__label"}
            <input type="password" name="password2" id="password2" value="{$password2|escape}" size="20" class="c-form-field__input" />
            </div>
        </div>
    <div id="instruct" class="statement">
        <p class="statement">{translate key="user.register.passwordLengthRestriction" length=$minPasswordLength}</p>
        </div>


	<div class="p-grid">
	{if $captchaEnabled}
	    {if $reCaptchaEnabled}
	    <div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-md">
	        {fieldLabel name="recaptcha_challenge_field" required="true" key="common.captchaField" class="c-form-field__label"}
				{$reCaptchaHtml}
				{else}
				<div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-md">
				{fieldLabel name="captcha" required="true" key="common.captchaField" class="c-form-field__label"}
					<img src="{url page="user" op="viewCaptcha" path=$captchaId}" alt="{translate key="common.captchaField.altText"}" /></div>
		<div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-md">
		    <br />
				<input name="captcha" id="captcha" value="" size="20" maxlength="32" class="c-form-field__input" />
					<input type="hidden" name="captchaId" value="{$captchaId|escape:"quoted"}" />
				<div id="instruct" class="statement">
				    <p class="statement">{translate key="common.captchaField.description"}</p>
					    </div>
					</div>
					
				{/if}
		</div>
	{/if}{* $captchaEnabled *}
	</div>
	
	<div id="registryStatement" class="registry statement">
        {if $privacyStatement}
        <h3 class="registry">{translate key="user.register.privacyStatement"}</h3>
        <p>{$privacyStatement|nl2br}</p>
        {/if}
        </div>
<br />

<h3>{translate key="user.registerInformation"}</h3>

{if ! $implicitAuth}
	<b id="userRegister"><span class="formRequired">{translate key="common.requiredField"}</span></b>
{/if}{* !$implicitAuth *}

	<div class="p-grid">
	    <div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-cmr">
	        {fieldLabel name="firstName" required="true" key="user.firstName" class="c-form-field__label"}
	        <input type="text" id="firstName" name="firstName" value="{$firstName|escape}" size="20" maxlength="40" class="c-form-field__input" />
	        </div>

		<div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-cmr">
			{fieldLabel name="middleName" key="user.middleName" class="c-form-field__label"}
			<input type="text" id="middleName" name="middleName" value="{$middleName|escape}" size="20" maxlength="40" class="c-form-field__input" /></div>

		<div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-cmr">
			{fieldLabel name="lastName" required="true" key="user.lastName" class="c-form-field__label"}
			<input type="text" id="lastName" name="lastName" value="{$lastName|escape}" size="20" maxlength="90" class="c-form-field__input" /></div>
		</div>

    <div class="p-grid">
	    <div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-cmr">
		
			{fieldLabel name="salutation" key="user.salutation" class="c-form-field__label"}
			<input type="text" name="salutation" id="salutation" value="{$salutation|escape}" size="20" maxlength="40" class="c-form-field__input" /></div>

		<div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-cmr">
		    
			{fieldLabel name="initials" key="user.initials" class="c-form-field__label"}
			<input type="text" id="initials" name="initials" value="{$initials|escape}" size="5" maxlength="5" class="c-form-field__input" /></div>

		<div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-cmr">
			
			{fieldLabel name="gender-m" key="user.gender" class="c-form-field__label"}
			<select name="gender" id="gender" size="1" class="selectMenu">
					{html_options_translate options=$genderOptions selected=$gender}</select>
			</div>
		</div>
	<div id="instruct" class="statement">
	    <p class="statement">{translate key="user.salutationDescription"}</p>
	    <p class="statement">{translate key="user.initialsExample"}</p>
	    </div>

    <div class="c-form-field">
		{fieldLabel name="affiliation" required="true" key="user.affiliation" class="c-form-field__label"}
			<textarea id="affiliation" name="affiliation[{$formLocale|escape}]" rows="3" cols="40" class="textArea">{$affiliation[$formLocale]|escape}</textarea>
		<div id="instruct" class="statement">
	    <p class="statement">{translate key="user.affiliation.description"}</p>
            </div>
		</div>

    <div class="c-form-field">
        {fieldLabel name="country" required="true" key="common.country" class="c-form-field__label"}
        <select name="country" id="country" class="selectMenu">
            <option value=""></option>
            {html_options options=$countries selected=$country}
        </select>
	</div>

    <div class="c-form-field">
		{fieldLabel name="signature" key="user.signature" class="c-form-field__label"}
		<textarea name="signature[{$formLocale|escape}]" id="signature" rows="2" cols="40" class="textArea">{$signature[$formLocale]|escape}</textarea>
	</div>
	
	<div class="p-grid">
	    <div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-md">
		{fieldLabel name="phone" key="user.phone" required="true" class="c-form-field__label"}
		<input type="text" name="phone" id="phone" value="{$phone|escape}" size="15" maxlength="24" class="c-form-field__input" /></div>
	</div>

    <div class="c-form-field">
		{fieldLabel name="orcid" key="user.orcid" class="c-form-field__label"}
		<input type="text" id="orcid" name="orcid" value="{$orcid|escape}" size="40" maxlength="255" class="c-form-field__input" />
		<div id="instruct" class="statement">
	    	<p class="statement">{translate key="user.orcid.description"}</p>
        </div>
    </div>

	<div class="c-form-field">
		{fieldLabel name="userUrl" key="user.url" class="c-form-field__label"}
		<input type="text" id="userUrl" name="userUrl" value="{$userUrl|escape}" size="40" maxlength="255" class="c-form-field__input" />
		<div id="instruct" class="statement">
	    <p class="statement">{translate key="user.url.description"}</p>
            </div>
        </div>

    <div class="p-grid">
	    <div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-md">
		{fieldLabel name="scopus" key="user.scopus" class="c-form-field__label"}
		<input type="text" name="fax" id="fax" value="{$fax|escape}" size="15" maxlength="24" class="c-form-field__input" /></div>

		<div class="c-form-field p-grid__col p-grid__col--12-at-xs p-grid__col--6-at-md">
		{fieldLabel name="sinta" key="user.sinta" class="c-form-field__label"}
		<input type="text" name="sinta" id="sinta" value="{$sinta|escape}" size="15" maxlength="10" class="c-form-field__input" /></div>
		</div>
	<div class="c-form-field">
	    <div id="instruct" class="statement">
	    <p class="statement">{translate key="user.scopusSintaiD.description"}</p>
            </div>
        </div>


    <div class="c-form-field">
		{fieldLabel name="mailingAddress" key="common.mailingAddress" class="c-form-field__label"}
		<textarea name="mailingAddress" id="mailingAddress" rows="3" cols="40" class="textArea">{$mailingAddress|escape}</textarea>
		
		<div id="instruct" class="statement">
	    <p class="statement">{translate key="user.mailingAddressdescription"}</p>
            </div>
        </div>

    <div class="c-form-field">
		{fieldLabel name="biography" key="user.biography" class="c-form-field__label"}
		<textarea name="biography[{$formLocale|escape}]" id="biography" rows="15" cols="40" class="textArea">{$biography[$formLocale]|escape}</textarea>
		</div>
	<div class="c-form-field">
		<div id="instruct" class="statement">
	    <p class="statement">{translate key="user.biography.descriptions"}</p>
            </div>
        </div>

<br />

<table class="data" width="100%">
		<tr valign="top">
			<td class="label">{fieldLabel name="sendPassword" key="user.sendPassword"}</td>
			<td class="value">
				<input type="checkbox" name="sendPassword" id="sendPassword" value="1" checked="checked"/> <label for="sendPassword">{translate key="user.sendPassword.description"}</label>
			</td>
		</tr>
</table>

<table class="data" width="100%">
    
    {if count($availableLocales) > 1}
			<tr valign="top">
				<td class="label">{translate key="user.workingLanguages"}</td>
				<td class="value">{foreach from=$availableLocales key=localeKey item=localeName}
				<input type="checkbox" name="userLocales[]" id="userLocales-{$localeKey|escape}" value="{$localeKey|escape}"{if in_array($localeKey, $userLocales)} checked="checked"{/if} /> <label for="userLocales-{$localeKey|escape}">{$localeName|escape}</label><br />
				{/foreach}</td>
			</tr>
		{/if}{* count($availableLocales) > 1 *}
	{/if}{* !$existingUser *}
{/if}{* !$implicitAuth || ($implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL && !$isloggedin) *}
    
    
{if $allowRegReader || $allowRegReader === null || $allowRegAuthor || $allowRegAuthor === null || $allowRegReviewer || $allowRegReviewer === null || ($currentJournal && $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $enableOpenAccessNotification)}
	<tr valign="top">
		<td class="label">{fieldLabel suppressId="true" name="registerAs" key="user.register.registerAs"}</td>
		<td class="value">{if $allowRegReader || $allowRegReader === null}<input type="checkbox" name="registerAsReader" id="registerAsReader" value="1"{if $registerAsReader} checked="checked"{/if} /> <label for="registerAsReader">{translate key="user.role.reader"}</label>: {translate key="user.register.readerDescription"} {$currentJournal->getLocalizedTitle()|strip_tags|escape}.<br />{/if}
		{if $currentJournal && $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $enableOpenAccessNotification}<input type="checkbox" name="openAccessNotification" id="openAccessNotification" value="1"{if $openAccessNotification} checked="checked"{/if} /> <label for="openAccessNotification">{translate key="user.role.reader"}</label>: {translate key="user.register.openAccessNotificationDescription"}<br />{/if}
		{if $allowRegAuthor || $allowRegAuthor === null}<input type="checkbox" name="registerAsAuthor" id="registerAsAuthor" value="1" checked="checked"/> <label for="registerAsAuthor">{translate key="user.role.author"}</label>: {translate key="user.register.authorDescription"} {$currentJournal->getLocalizedTitle()|strip_tags|escape}.<br />{/if}
		{if $allowRegReviewer || $allowRegReviewer === null}<input type="checkbox" name="registerAsReviewer" id="registerAsReviewer" value="1"{if $registerAsReviewer} checked="checked"{/if} /> <label for="registerAsReviewer">{translate key="user.role.reviewer"}</label>: {if $existingUser}{translate key="user.register.reviewerDescriptionNoInterests"}{else}{translate key="user.register.reviewerDescription"}{/if}
		<br /><div id="reviewerInterestsContainer" style="margin-left:25px;">
			<label class="desc">{translate key="user.register.reviewerInterests"}</label>
			{include file="form/interestsInput.tpl" FBV_interestsKeywords=$interestsKeywords FBV_interestsTextOnly=$interestsTextOnly}
		</div>
		</td>
		{/if}
	</tr>
{/if}

</table>

<br />

    

<p><input type="submit" value="{translate key="user.register"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url page="index" escape=false}'" /></p>

</form>

</div>
</div>

{include file="common/footer.tpl"}

