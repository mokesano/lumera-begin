<?php

/**
 * @defgroup plugins_citationOutput_apa
 */

/**
 * @file plugins/citationOutput/apa/SEPApaCitationOutputPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPApaCitationOutputPlugin
 * @ingroup plugins_citationOutput_apa
 *
 * @brief Cross-application APA citation style plugin
 */


import('classes.plugins.Plugin');

class SEPApaCitationOutputPlugin extends Plugin {
	/**
	 * Constructor
	 */
	function SEPApaCitationOutputPlugin() {
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
		return 'ApaCitationOutputPlugin';
	}

	/**
	 * @see SEPPlugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.citationOutput.apa.displayName');
	}

	/**
	 * @see SEPPlugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.citationOutput.apa.description');
	}
}

?>
