<?php

/**
 * @file classes/file/SEPFileDAO.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPFileDAO
 * @ingroup file
 * @see SEPFile
 *
 * @brief Abstract base class for retrieving and modifying SEPFile
 * objects and their decendents
 */

define('INLINEABLE_TYPES_FILE', Core::getBaseDir() . DIRECTORY_SEPARATOR . 'lib' . DIRECTORY_SEPARATOR . 'sep' . DIRECTORY_SEPARATOR . 'registry' . DIRECTORY_SEPARATOR . 'inlineTypes.txt');

class SEPFileDAO extends DAO {
	/**
	 * @var array a private list of MIME types that can be shown inline
	 *  in the browser
	 */
	var $_inlineableTypes;

	/**
	 * Constructor
	 */
	function SEPFileDAO() {
		return parent::DAO();
	}


	//
	// Public methods
	//
	/**
	 * Check whether a file may be displayed inline.
	 * @param $sepFile SEPFile
	 * @return boolean
	 */
	function isInlineable($file) {
		// Retrieve MIME types.
		if (!isset($this->_inlineableTypes)) {
			$this->_inlineableTypes = array_filter(file(INLINEABLE_TYPES_FILE), create_function('&$a', 'return ($a = trim($a)) && !empty($a) && $a[0] != \'#\';'));
		}

		// Check the MIME type of the file.
		return in_array($file->getFileType(), $this->_inlineableTypes);
	}
}

?>
