<?php

/**
 * @file classes/file/SEPPublicFileManager.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPPublicFileManager
 * @ingroup file
 *
 * @brief Wrapper class for uploading files to a site/journal's public directory.
 */


import('lib.sep.classes.file.FileManager');

class SEPPublicFileManager extends FileManager {

	/**
	 * Constructor
	 */
	function SEPPublicFileManager() {
		parent::FileManager();
	}

	/**
	 * Get the path to the site public files directory.
	 * @return string
	 */
	function getSiteFilesPath() {
		return Config::getVar('files', 'public_files_dir') . '/site';
	}

	/**
	 * Upload a file to the site's public directory.
	 * @param $fileName string the name of the file in the upload form
	 * @param $destFileName string the destination file name
	 * @return boolean
	 */
	function uploadSiteFile($fileName, $destFileName) {
		return $this->uploadFile($fileName, $this->getSiteFilesPath() . '/' . $destFileName);
	}

	/**
	 * Delete a file from the site's public directory.
	 * @param $fileName string the target file name
	 * @return boolean
	 */
	function removeSiteFile($fileName) {
		return $this->deleteFile($this->getSiteFilesPath() . '/' . $fileName);
	}
}

?>
