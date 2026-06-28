<?php

/**
 * @file classes/announcement/AnnouncementTypeDAO.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class AnnouncementTypeDAO
 * @ingroup announcement
 * @see AnnouncementType
 *
 * @brief Operations for retrieving and modifying AnnouncementType objects.
 */

import('classes.announcement.AnnouncementType');
import('lib.sep.classes.announcement.SEPAnnouncementTypeDAO');

class AnnouncementTypeDAO extends SEPAnnouncementTypeDAO {
	/**
	 * Constructor
	 */
	function AnnouncementTypeDAO() {
		parent::SEPAnnouncementTypeDAO();
	}

	/**
	 * @see SEPAnnouncementTypeDAO::newDataObject
	 */
	function newDataObject() {
		return new AnnouncementType();
	}
}

?>
