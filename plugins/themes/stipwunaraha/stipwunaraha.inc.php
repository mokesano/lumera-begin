<?php

/**
 * @file plugins/themes/stipwunaraha/Stipwunaraha.inc.php
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class Stipwunaraha
 * @ingroup plugins_themes_premium
 *
 * @brief "stipwunaraha" theme plugin
 */

import('classes.plugins.ThemePlugin');

class stipwunaraha extends ThemePlugin {
	/**
	 * Get the name of this plugin. The name must be unique within
	 * its category.
	 * @return String name of plugin
	 */
	function getName() {
		return 'stipwunaraha';
	}

	function getDisplayName() {
		return 'Stipwunaraha Premium Theme';
	}

	function getDescription() {
		return 'stipwunaraha layout';
	}

	function getLocaleFilename($locale) {
		return null; // No locale data
	}

	function activate(&$templateMgr) {
		$templateMgr->template_dir[0] = Core::getBaseDir() 
										. DIRECTORY_SEPARATOR 
										. 'plugins' 
										. DIRECTORY_SEPARATOR 
										. 'themes' 
										. DIRECTORY_SEPARATOR 
										. 'stipwunaraha' 
										. DIRECTORY_SEPARATOR 
										. 'templates';   
											      
		$templateMgr->compile_id = 'stipwunaraha';
	}
}

?>
