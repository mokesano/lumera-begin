<?php

/**
 * @defgroup plugins_metadata_mods34
 */

/**
 * @file plugins/metadata/mods34/SEPMods34MetadataPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPMods34MetadataPlugin
 * @ingroup plugins_metadata_mods34
 *
 * @brief Abstract base class for MODS metadata plugins
 */


import('lib.sep.classes.plugins.MetadataPlugin');

class SEPMods34MetadataPlugin extends MetadataPlugin {
	/**
	 * Constructor
	 */
	function SEPMods34MetadataPlugin() {
		parent::MetadataPlugin();
	}


	//
	// Override protected template methods from SEPPlugin
	//
	/**
	 * @see SEPPlugin::getName()
	 */
	function getName() {
		return 'Mods34MetadataPlugin';
	}

	/**
	 * @see SEPPlugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.metadata.mods34.displayName');
	}

	/**
	 * @see SEPPlugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.metadata.mods34.description');
	}
}

?>
