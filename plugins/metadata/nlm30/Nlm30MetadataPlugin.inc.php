<?php

/**
 * @defgroup plugins_metadata_nlm30
 */

/**
 * @file plugins/metadata/nlm30/Nlm30MetadataPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class Nlm30MetadataPlugin
 * @ingroup plugins_metadata_nlm30
 *
 * @brief NLM 3.0 metadata plugin
 */


import('lib.sep.plugins.metadata.nlm30.SEPNlm30MetadataPlugin');

class Nlm30MetadataPlugin extends SEPNlm30MetadataPlugin {
	/**
	 * Constructor
	 */
	function Nlm30MetadataPlugin() {
		parent::SEPNlm30MetadataPlugin();
	}
}

?>
