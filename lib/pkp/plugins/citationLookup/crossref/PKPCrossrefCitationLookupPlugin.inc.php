<?php

/**
 * @defgroup plugins_citationLookup_crossref
 */

/**
 * @file plugins/citationLookup/crossref/SEPCrossrefCitationLookupPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPCrossrefCitationLookupPlugin
 * @ingroup plugins_citationLookup_crossref
 *
 * @brief Cross-application CrossRef citation lookup plugin
 */


import('classes.plugins.Plugin');

class SEPCrossrefCitationLookupPlugin extends Plugin {
	/**
	 * Constructor
	 */
	function SEPCrossrefCitationLookupPlugin() {
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
		return 'CrossrefCitationLookupPlugin';
	}

	/**
	 * @see SEPPlugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.citationLookup.crossref.displayName');
	}

	/**
	 * @see SEPPlugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.citationLookup.crossref.description');
	}
}

?>
