<?php
/**
 * @defgroup notification_form
 */

/**
 * @file classes/notification/form/NotificationSettingsForm.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPNotificationSettingsForm
 * @ingroup notification_form
 *
 * @brief Form to edit notification settings.
 */


import('lib.sep.classes.form.Form');

class SEPNotificationSettingsForm extends Form {
	/**
	 * Constructor.
	 */
	function SEPNotificationSettingsForm() {
		parent::Form('notification/settings.tpl');

		// Validation checks for this form
		$this->addCheck(new FormValidatorPost($this));
	}

	/**
	 * Display the form.
	 */
	function display(&$request) {
		$context =& $request->getContext();
		$user = $request->getUser();
		$userId = $user->getId();

		$notificationSubscriptionSettingsDao =& DAORegistry::getDAO('NotificationSubscriptionSettingsDAO');
		$blockedNotifications = $notificationSubscriptionSettingsDao->getNotificationSubscriptionSettings('blocked_notification', $userId, $context->getId());
		$emailSettings = $notificationSubscriptionSettingsDao->getNotificationSubscriptionSettings('emailed_notification', $userId, $context->getId());

		$templateMgr =& TemplateManager::getManager();
		$templateMgr->assign('blockedNotifications', $blockedNotifications);
		$templateMgr->assign('emailSettings', $emailSettings);
		$templateMgr->assign('titleVar', __('common.title'));
		$templateMgr->assign('userVar', __('common.user'));
		return parent::display();
	}
}

?>
