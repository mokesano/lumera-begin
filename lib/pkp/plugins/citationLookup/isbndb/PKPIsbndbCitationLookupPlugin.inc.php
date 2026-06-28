<?php

/**
 * @defgroup plugins_citationLookup_isbndb
 */

/**
 * @file plugins/citationLookup/isbndb/SEPIsbndbCitationLookupPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPIsbndbCitationLookupPlugin
 * @ingroup plugins_citationLookup_isbndb
 *
 * @brief Cross-application ISBNdb citation lookup plugin
 */


import('classes.plugins.Plugin');

class SEPIsbndbCitationLookupPlugin extends Plugin {
	/**
	 * Constructor
	 */
	function SEPIsbndbCitationLookupPlugin() {
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
		return 'IsbndbCitationLookupPlugin';
	}

	/**
	 * @see SEPPlugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.citationLookup.isbndb.displayName');
	}

	/**
	 * @see SEPPlugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.citationLookup.isbndb.description');
	}
}

?>
