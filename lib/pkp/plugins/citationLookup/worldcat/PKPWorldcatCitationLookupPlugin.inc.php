<?php

/**
 * @defgroup plugins_citationLookup_worldcat
 */

/**
 * @file plugins/citationLookup/worldcat/SEPWorldcatCitationLookupPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPWorldcatCitationLookupPlugin
 * @ingroup plugins_citationLookup_worldcat
 *
 * @brief Cross-application WorldCat citation lookup plugin
 */


import('classes.plugins.Plugin');

class SEPWorldcatCitationLookupPlugin extends Plugin {
	/**
	 * Constructor
	 */
	function SEPWorldcatCitationLookupPlugin() {
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
		return 'WorldcatCitationLookupPlugin';
	}

	/**
	 * @see SEPPlugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.citationLookup.worldcat.displayName');
	}

	/**
	 * @see SEPPlugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.citationLookup.worldcat.description');
	}
}

?>
