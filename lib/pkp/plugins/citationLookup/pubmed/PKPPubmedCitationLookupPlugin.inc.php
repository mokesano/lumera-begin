<?php

/**
 * @defgroup plugins_citationLookup_pubmed
 */

/**
 * @file plugins/citationLookup/pubmed/SEPPubmedCitationLookupPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPPubmedCitationLookupPlugin
 * @ingroup plugins_citationLookup_pubmed
 *
 * @brief Cross-application PubMed citation lookup plugin
 */


import('classes.plugins.Plugin');

class SEPPubmedCitationLookupPlugin extends Plugin {
	/**
	 * Constructor
	 */
	function SEPPubmedCitationLookupPlugin() {
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
		return 'PubmedCitationLookupPlugin';
	}

	/**
	 * @see SEPPlugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.citationLookup.pubmed.displayName');
	}

	/**
	 * @see SEPPlugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.citationLookup.pubmed.description');
	}
}

?>
