<?php

/**
 * @file tools/install.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class installTool
 * @ingroup tools
 *
 * @brief CLI tool for installing CLA.
 */

require(dirname(__FILE__) . '/bootstrap.inc.php');

import('lib.sep.classes.cliTool.InstallTool');

class CLAInstallTool extends InstallTool {
	/**
	 * Constructor.
	 * @param $argv array command-line arguments
	 */
	function CLAInstallTool($argv = array()) {
		parent::InstallTool($argv);
	}

	/**
	 * Read installation parameters from stdin.
	 * FIXME: May want to implement an abstract "CLIForm" class handling input/validation.
	 * FIXME: Use readline if available?
	 */
	function readParams() {
		AppLocale::requireComponents(LOCALE_COMPONENT_SEP_INSTALLER, LOCALE_COMPONENT_APPLICATION_COMMON, LOCALE_COMPONENT_SEP_USER);
		printf("%s\n", __('installer.claInstallation'));

		parent::readParams();

		$this->readParamBoolean('install', 'installer.installApplication');

		return $this->params['install'];
	}

}

$tool = new CLAInstallTool(isset($argv) ? $argv : array());
$tool->execute();

?>
