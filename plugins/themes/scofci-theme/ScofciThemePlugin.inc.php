<?php

/**
 * @file plugins/themes/scofci/ScofciThemePlugin.inc.php
 *
 * Copyright (c) scofci.org | Open Journal Systems Premium Themes
 * Studi Center of Coastal and Isle Indonesia
 *
 * Bacground Grid credit by toptal.com
 *
 * SCofCI for Akuatikisle Journal theme stylesheet.
 * Ver 1.0.0.7 (2018-01-11)
 *
 * @class ScofciThemePlugin
 * @ingroup plugins_themes_scofci
 *
 * @brief "Scofci" theme plugin
 */

import('classes.plugins.ThemePlugin');

class ScofciThemePlugin extends ThemePlugin {
	/**
	 * Get the name of this plugin. The name must be unique within
	 * its category.
	 * @return String name of plugin
	 */
	function getName() {
		return 'ScofciThemePlugin';
	}

	function getDisplayName() {
		return 'Scofci Indonesia';
	}

	function getDescription() {
		return 'Light, plain, spacious layout';
	}

	function getStylesheetFilename() {
		return 'scofci.min.css';
	}

	function getLocaleFilename($locale) {
		return null; // No locale data
	}
}

?>
