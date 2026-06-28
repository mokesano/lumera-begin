<?php

/**
 * @defgroup plugins_metadata_dc11_schema
 */

/**
 * @file plugins/metadata/dc11/schema/Dc11Schema.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class Dc11Schema
 * @ingroup plugins_metadata_dc11_schema
 * @see SEPDc11Schema
 *
 * @brief CLA-specific implementation of the Dc11Schema.
 */


import('lib.sep.plugins.metadata.dc11.schema.SEPDc11Schema');

class Dc11Schema extends SEPDc11Schema {
	/**
	 * Constructor
	 */
	function Dc11Schema() {
		// Configure the MODS schema.
		parent::SEPDc11Schema(ASSOC_TYPE_ARTICLE);
	}
}
?>
