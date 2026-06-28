<?php

/**
 * @file pages/announcement/AnnouncementHandler.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class AnnouncementHandler
 * @ingroup pages_announcement
 *
 * @brief Handle requests for public announcement functions.
 */


import('lib.sep.pages.announcement.SEPAnnouncementHandler');

class AnnouncementHandler extends SEPAnnouncementHandler {
	/**
	 * Constructor
	 **/
	function AnnouncementHandler() {
		parent::SEPAnnouncementHandler();
		$this->addCheck(new HandlerValidatorJournal($this));
	}

	/**
	 * @see SEPAnnouncementHandler::_getAnnouncementsEnabled()
	 */
	function _getAnnouncementsEnabled($request) {
		$journal =& $request->getJournal();
		return $journal->getSetting('enableAnnouncements');
	}

	/**
	 * @see SEPAnnouncementHandler::_getAnnouncements()
	 */
	function &_getAnnouncements($request, $rangeInfo = null) {
		$journal =& $request->getJournal();

		$announcementDao =& DAORegistry::getDAO('AnnouncementDAO');
		$announcements =& $announcementDao->getAnnouncementsNotExpiredByAssocId(ASSOC_TYPE_JOURNAL, $journal->getId(), $rangeInfo);

		return $announcements;
	}

	/**
	 * @see SEPAnnouncementHandler::_getAnnouncementsIntroduction()
	 */
	function _getAnnouncementsIntroduction($request) {
		$journal =& $request->getJournal();
		return $journal->getLocalizedSetting('announcementsIntroduction');
	}

	/**
	 * @see SEPAnnouncementHandler::_announcementIsValid()
	 */
	function _announcementIsValid($request, $announcementId) {
		$journal =& $request->getJournal();
		$announcementDao =& DAORegistry::getDAO('AnnouncementDAO');
		return ($announcementId != null && $announcementDao->getAnnouncementAssocId($announcementId) == $journal->getId());
	}
}

?>
