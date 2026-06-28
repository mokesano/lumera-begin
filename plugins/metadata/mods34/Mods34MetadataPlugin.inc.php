<?php

/**
 * @defgroup plugins_metadata_mods34
 */

/**
 * @file plugins/metadata/mods34/Mods34MetadataPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class Mods34MetadataPlugin
 * @ingroup plugins_metadata_mods34
 *
 * @brief MODS 3.4 metadata plugin
 */


import('lib.sep.plugins.metadata.mods34.SEPMods34MetadataPlugin');

class Mods34MetadataPlugin extends SEPMods34MetadataPlugin {
	/**
	 * Constructor
	 */
	function Mods34MetadataPlugin() {
		parent::SEPMods34MetadataPlugin();
	}
}

?>
