<?php

/**
 * @file classes/announcement/AnnouncementType.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class AnnouncementType
 * @ingroup announcement
 * @see AnnouncementTypeDAO, AnnouncementTypeForm
 *
 * @brief Basic class describing an announcement type.
 */

import('lib.sep.classes.announcement.SEPAnnouncementType');

class AnnouncementType extends SEPAnnouncementType {
	/**
	 * Constructor
	 */
	function AnnouncementType() {
		parent::SEPAnnouncementType();
	}
}

?>
