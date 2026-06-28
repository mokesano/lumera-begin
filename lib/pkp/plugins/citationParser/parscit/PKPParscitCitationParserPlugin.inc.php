<?php

/**
 * @defgroup plugins_citationParser_parscit
 */

/**
 * @file plugins/citationParser/parscit/SEPParscitCitationParserPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPParscitCitationParserPlugin
 * @ingroup plugins_citationParser_parscit
 *
 * @brief Cross-application ParsCit citation parser
 */


import('classes.plugins.Plugin');

class SEPParscitCitationParserPlugin extends Plugin {
	/**
	 * Constructor
	 */
	function SEPParscitCitationParserPlugin() {
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
		return 'ParscitCitationParserPlugin';
	}

	/**
	 * @see SEPPlugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.citationParser.parscit.displayName');
	}

	/**
	 * @see SEPPlugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.citationParser.parscit.description');
	}
}

?>
