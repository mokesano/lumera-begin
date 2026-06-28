/**
 * jqueryValidatorI18n.js
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * short function to map SEP localization strings to the jquery validation plugin localization
 */

/**
 * need a mapping of SEP locale strings to the ones used by the jquery validation plugin
 */
function jqueryValidatorI18n(baseUrl, locale) {
	var scriptPrefix;
	scriptPrefix = baseUrl + "/lib/sep/js/lib/jquery/plugins/validate/localization/messages_";
	switch(locale) {
		//TODO: add all other SEP supported locales
		// French
		case 'fr_FR':
		case 'ca_FR':
			eval($.getScript(scriptPrefix + "fr.js"));
			break;
		// Portuguese
		case 'pt_BR':
			eval($.getScript(scriptPrefix + "ptbr.js"));
			break;
		case 'pt_PT':
			eval($.getScript(scriptPrefix + "ptpt.js"));
			break;
		// Spanish
		case 'es_AR':
		case 'es_ES':
			eval($.getScript(scriptPrefix + "es.js"));
			break;
		default:
			// default to no localization
	}
}
