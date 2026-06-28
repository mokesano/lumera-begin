<?php

/**
 * @file classes/help/Help.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class Help
 * @ingroup help
 *
 * @brief Provides methods for translating help topic keys to their respected topic
 * help ids.
 */

import('lib.sep.classes.help.SEPHelp');

class Help extends SEPHelp {
	/**
	 * Constructor.
	 */
	function Help() {
		parent::SEPHelp();
		import('classes.help.CLAHelpMappingFile');
		$mainMappingFile = new CLAHelpMappingFile();
		$this->addMappingFile($mainMappingFile);
	}
}

?>
