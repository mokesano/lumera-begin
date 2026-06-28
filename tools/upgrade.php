<?php

/**
 * @file tools/upgrade.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class upgradeTool
 * @ingroup tools
 *
 * @brief CLI tool for upgrading CLA.
 *
 * Note: Some functions require fopen wrappers to be enabled.
 */


require(dirname(__FILE__) . '/bootstrap.inc.php');

import('lib.sep.classes.cliTool.UpgradeTool');

class CLAUpgradeTool extends UpgradeTool {
	/**
	 * Constructor.
	 * @param $argv array command-line arguments
	 */
	function CLAUpgradeTool($argv = array()) {
		parent::UpgradeTool($argv);
	}
}

$tool = new CLAUpgradeTool(isset($argv) ? $argv : array());
$tool->execute();

?>
