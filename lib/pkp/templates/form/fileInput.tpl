{**
 * templates/form/fileInput.tpl
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * File upload control.
 *}

<div class="sep_form_file_input_container">
	<input type="file" id="{$FBV_id}" name="{$FBV_name}" class="sep_form_upload_field"{if $FBV_disabled} disabled="disabled"{/if} />
	<div class="sep_form_fakeFile">
		<input class="sep_form_fakeInput" {if $FBV_disabled} disabled="disabled"{/if} />
		<input type="button" value="{translate key='navigation.browse'}..." class="button sep_form_fakeButton"{if $FBV_disabled} disabled="disabled"{/if}/>
	</div>
</div>
{if $FBV_submit}<input type="submit" name="{$FBV_submit}" value="{translate key="common.upload"}" class="button sep_form_uploadFile"{if $FBV_disabled} disabled="disabled"{/if} />{/if}
{$FBV_label_content}
