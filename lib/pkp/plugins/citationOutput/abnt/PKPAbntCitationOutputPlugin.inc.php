<?php

/**
 * @defgroup plugins_citationOutput_abnt
 */

/**
 * @file plugins/citationOutput/abnt/SEPAbntCitationOutputPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPAbntCitationOutputPlugin
 * @ingroup plugins_citationOutput_abnt
 *
 * @brief Cross-application ABNT citation style plugin
 */


import('classes.plugins.Plugin');

class SEPAbntCitationOutputPlugin extends Plugin {
	/**
	 * Constructor
	 */
	function SEPAbntCitationOutputPlugin() {
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
		return 'AbntCitationOutputPlugin';
	}

	/**
	 * @see SEPPlugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.citationOutput.abnt.displayName');
	}

	/**
	 * @see SEPPlugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.citationOutput.abnt.description');
	}
}

?>
