<?php
/**
 * @file classes/security/authorization/CLAJournalAccessPolicy.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class CLAJournalAccessPolicy
 * @ingroup security_authorization
 *
 * @brief Class to control access to CLA' journal setup components
 */

import('classes.security.authorization.internal.JournalPolicy');

class CLAJournalAccessPolicy extends JournalPolicy {
	/**
	 * Constructor
	 * @param $request SEPRequest
	 * @param $roleAssignments array
	 */
	function CLAJournalAccessPolicy(&$request, $roleAssignments) {
		parent::JournalPolicy($request);

		// On journal level we don't have role-specific conditions
		// so we can simply add all role assignments. It's ok if
		// any of these role conditions permits access.
		$journalRolePolicy = new PolicySet(COMBINING_PERMIT_OVERRIDES);
		import('lib.sep.classes.security.authorization.RoleBasedHandlerOperationPolicy');
		foreach($roleAssignments as $role => $operations) {
			$journalRolePolicy->addPolicy(new RoleBasedHandlerOperationPolicy($request, $role, $operations));
		}
		$this->addPolicy($journalRolePolicy);
	}
}

?>
