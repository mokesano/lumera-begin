<?php

/**
 * @file classes/announcement/AnnouncementDAO.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class AnnouncementDAO
 * @ingroup announcement
 * @see Announcement
 *
 * @brief Operations for retrieving and modifying Announcement objects.
 */


import('classes.announcement.Announcement');
import('lib.sep.classes.announcement.SEPAnnouncementDAO');

class AnnouncementDAO extends SEPAnnouncementDAO {
	/**
	 * Constructor
	 */
	function AnnouncementDAO() {
		parent::SEPAnnouncementDAO();
	}

	/**
	 * @see SEPAnnouncementDAO::newDataObject
	 */
	function newDataObject() {
		return new Announcement();
	}
}

?>
