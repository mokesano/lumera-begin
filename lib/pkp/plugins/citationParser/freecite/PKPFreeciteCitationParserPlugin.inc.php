<?php

/**
 * @defgroup plugins_citationParser_freecite
 */

/**
 * @file plugins/citationParser/freecite/SEPFreeciteCitationParserPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPFreeciteCitationParserPlugin
 * @ingroup plugins_citationParser_freecite
 *
 * @brief Cross-application FreeCite citation parser
 */


import('classes.plugins.Plugin');

class SEPFreeciteCitationParserPlugin extends Plugin {
	/**
	 * Constructor
	 */
	function SEPFreeciteCitationParserPlugin() {
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
		return 'FreeciteCitationParserPlugin';
	}

	/**
	 * @see SEPPlugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.citationParser.freecite.displayName');
	}

	/**
	 * @see SEPPlugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.citationParser.freecite.description');
	}
}

?>
