<?php

/**
 * @file plugins/themes/modern-scisle/SCISLETheme.inc.php
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SCISLETheme
 * @ingroup plugins_themes_mpg
 *
 * @brief "modern-scisle" theme plugin
 */

import('classes.plugins.ThemePlugin');

class eserem extends ThemePlugin {
	/**
	 * Get the name of this plugin. The name must be unique within
	 * its category.
	 * @return String name of plugin
	 */
	function getName() {
		return 'eserem';
	}

	function getDisplayName() {
		return 'Eserem Theme';
	}

	function getDescription() {
		return 'eserem layout';
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
										. 'eserem' 
										. DIRECTORY_SEPARATOR 
										. 'templates';   
											      
		$templateMgr->compile_id = 'eserem';
	}
}

?>
