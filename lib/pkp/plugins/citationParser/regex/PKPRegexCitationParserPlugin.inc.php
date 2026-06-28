<?php

/**
 * @defgroup plugins_citationParser_regex
 */

/**
 * @file plugins/citationParser/regex/SEPRegexCitationParserPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPRegexCitationParserPlugin
 * @ingroup plugins_citationParser_regex
 *
 * @brief Cross-application regular expression based citation parser
 */


import('classes.plugins.Plugin');

class SEPRegexCitationParserPlugin extends Plugin {
	/**
	 * Constructor
	 */
	function SEPRegexCitationParserPlugin() {
		parent::Plugin();
	}


	//
	// Override protected template methods from SEPPlugin
	//
	/**
	 * @see SEPPlugin::register()
	 */
	function register($category, $path) {
		if (!parent::register($category, $path)) return false;
		$this->addLocaleData();
		return true;
	}

	/**
	 * @see SEPPlugin::getName()
	 */
	function getName() {
		return 'RegexCitationParserPlugin';
	}

	/**
	 * @see SEPPlugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.citationParser.regex.displayName');
	}

	/**
	 * @see SEPPlugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.citationParser.regex.description');
	}
}

?>
