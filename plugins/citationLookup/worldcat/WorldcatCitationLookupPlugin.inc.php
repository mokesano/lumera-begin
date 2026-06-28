<?php

/**
 * @defgroup plugins_citationLookup_worldcat
 */

/**
 * @file plugins/citationLookup/worldcat/WorldcatCitationLookupPlugin.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class WorldcatCitationLookupPlugin
 * @ingroup plugins_citationLookup_worldcat
 *
 * @brief WorldCat citation database connector plug-in.
 */


import('lib.sep.plugins.citationLookup.worldcat.SEPWorldcatCitationLookupPlugin');

class WorldcatCitationLookupPlugin extends SEPWorldcatCitationLookupPlugin {
	/**
	 * Constructor
	 */
	function WorldcatCitationLookupPlugin() {
		parent::SEPWorldcatCitationLookupPlugin();
	}
}

?>
