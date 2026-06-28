<?php

/**
 * @defgroup plugins_metadata_nlm30
 */

/**
 * @file plugins/metadata/nlm30/SEPNlm30MetadataPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPNlm30MetadataPlugin
 * @ingroup plugins_metadata_nlm30
 *
 * @brief Abstract base class for NLM 3.0 metadata plugins
 */


import('lib.sep.classes.plugins.MetadataPlugin');

class SEPNlm30MetadataPlugin extends MetadataPlugin {
	/**
	 * Constructor
	 */
	function SEPNlm30MetadataPlugin() {
		parent::MetadataPlugin();
	}


	//
	// Override protected template methods from SEPPlugin
	//
	/**
	 * @see SEPPlugin::getName()
	 */
	function getName() {
		return 'Nlm30MetadataPlugin';
	}

	/**
	 * @see SEPPlugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.metadata.nlm30.displayName');
	}

	/**
	 * @see SEPPlugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.metadata.nlm30.description');
	}
}

?>
