<?php

/**
 * @defgroup plugins_metadata_mods34_schema
 */

/**
 * @file plugins/metadata/mods34/schema/Mods34Schema.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class Mods34Schema
 * @ingroup plugins_metadata_mods34_schema
 * @see SEPMods34Schema
 *
 * @brief CLA-specific implementation of the Mods34Schema.
 */


import('lib.sep.plugins.metadata.mods34.schema.SEPMods34Schema');

class Mods34Schema extends SEPMods34Schema {
	/**
	 * Constructor
	 */
	function Mods34Schema() {
		// Configure the MODS schema.
		parent::SEPMods34Schema(ASSOC_TYPE_ARTICLE);
	}
}
?>
