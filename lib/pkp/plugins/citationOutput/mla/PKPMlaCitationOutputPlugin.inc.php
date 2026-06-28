<?php

/**
 * @defgroup plugins_citationOutput_mla
 */

/**
 * @file plugins/citationOutput/mla/SEPMlaCitationOutputPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPMlaCitationOutputPlugin
 * @ingroup plugins_citationOutput_mla
 *
 * @brief Cross-application MLA citation style plugin
 */


import('classes.plugins.Plugin');

class SEPMlaCitationOutputPlugin extends Plugin {
	/**
	 * Constructor
	 */
	function SEPMlaCitationOutputPlugin() {
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
		return 'MlaCitationOutputPlugin';
	}

	/**
	 * @see SEPPlugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.citationOutput.mla.displayName');
	}

	/**
	 * @see SEPPlugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.citationOutput.mla.description');
	}
}

?>
