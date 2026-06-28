<?php

/**
 * @defgroup rt_cla
 */

/**
 * @file classes/rt/cla/JournalRT.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class JournalRT
 * @ingroup rt_cla
 *
 * @brief CLA-specific Reading Tools end-user interface.
 */

import('lib.sep.classes.rt.RT');
import('classes.rt.cla.RTDAO');

class JournalRT extends RT {
	var $journalId;
	var $enabled;

	var $sharingEnabled;
	var $sharingUserName;
	var $sharingButtonStyle;
	var $sharingDropDownMenu;
	var $sharingBrand;
	var $sharingDropDown;
	var $sharingLanguage;
	var $sharingLogo;
	var $sharingLogoBackground;
	var $sharingLogoColor;

	function JournalRT($journalId) {
		$this->setJournalId($journalId);
	}

	// Getter/setter methods

	function getJournalId() {
		return $this->journalId;
	}

	function setJournalId($journalId) {
		$this->journalId = $journalId;
	}

	function getSharingEnabled() {
		return $this->sharingEnabled;
	}
	function getSharingUserName() {
		return $this->sharingUserName;
	}
	function getSharingButtonStyle() {
		return $this->sharingButtonStyle;
	}
	function getSharingDropDownMenu() {
		return $this->sharingDropDownMenu;
	}
	function getSharingBrand() {
		return $this->sharingBrand;
	}
	function getSharingDropDown() {
		return $this->sharingDropDown;
	}
	function getSharingLanguage() {
		return $this->sharingLanguage;
	}
	function getSharingLogo() {
		return $this->sharingLogo;
	}
	function getSharingLogoBackground() {
		return $this->sharingLogoBackground;
	}
	function getSharingLogoColor() {
		return $this->sharingLogoColor;
	}

	function setSharingEnabled($sharingEnabled) {
		$this->sharingEnabled = $sharingEnabled;
	}
	
	function setSharingUserName($sharingUserName) {
		$this->sharingUserName = $sharingUserName;
	}
	
	function setSharingButtonStyle($sharingButtonStyle) {
		$this->sharingButtonStyle = $sharingButtonStyle;
	}
	
	function setSharingDropDownMenu($sharingDropDownMenu) {
		$this->sharingDropDownMenu = $sharingDropDownMenu;
	}
	
	function setSharingBrand($sharingBrand) {
		$this->sharingBrand = $sharingBrand;
	}
	
	function setSharingDropDown($sharingDropDown) {
		$this->sharingDropDown = $sharingDropDown;
	}
	
	function setSharingLanguage($sharingLanguage) {
		$this->sharingLanguage = $sharingLanguage;
	}
	
	function setSharingLogo($sharingLogo) {
		$this->sharingLogo = $sharingLogo;
	}
	
	function setSharingLogoBackground($sharingLogoBackground) {
		$this->sharingLogoBackground = $sharingLogoBackground;
	}
	
	function setSharingLogoColor($sharingLogoColor) {
		$this->sharingLogoColor = $sharingLogoColor;
	}
}

?>
