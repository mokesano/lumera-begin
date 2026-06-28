<?php

/**
 * @defgroup plugins_citationOutput_vancouver
 */

/**
 * @file plugins/citationOutput/vancouver/SEPVancouverCitationOutputPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPVancouverCitationOutputPlugin
 * @ingroup plugins_citationOutput_vancouver
 *
 * @brief Cross-application Vancouver citation style plugin
 */


import('classes.plugins.Plugin');

class SEPVancouverCitationOutputPlugin extends Plugin {
	/**
	 * Constructor
	 */
	function SEPVancouverCitationOutputPlugin() {
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
		return 'VancouverCitationOutputPlugin';
	}

	/**
	 * @see SEPPlugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.citationOutput.vancouver.displayName');
	}

	/**
	 * @see SEPPlugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.citationOutput.vancouver.description');
	}
}

?>
