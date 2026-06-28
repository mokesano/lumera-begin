<?php

/**
 * @defgroup plugins_citationParser_paracite
 */

/**
 * @file plugins/citationParser/paracite/SEPParaciteCitationParserPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPParaciteCitationParserPlugin
 * @ingroup plugins_citationParser_paracite
 *
 * @brief Cross-application ParaCite citation parser
 */


import('classes.plugins.Plugin');

class SEPParaciteCitationParserPlugin extends Plugin {
	/**
	 * Constructor
	 */
	function SEPParaciteCitationParserPlugin() {
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
		return 'ParaciteCitationParserPlugin';
	}

	/**
	 * @see SEPPlugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.citationParser.paracite.displayName');
	}

	/**
	 * @see SEPPlugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.citationParser.paracite.description');
	}
}

?>
