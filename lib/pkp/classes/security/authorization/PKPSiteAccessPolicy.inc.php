<?php
/**
 * @file classes/security/authorization/SEPSiteAccessPolicy.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPSiteAccessPolicy
 * @ingroup security_authorization
 *
 * @brief Class to that makes sure that a user is logged in.
 */


define('SITE_ACCESS_ALL_ROLES', 0x01);

import('lib.sep.classes.security.authorization.PolicySet');

class SEPSiteAccessPolicy extends PolicySet {
	/**
	 * Constructor
	 *
	 * @param $request SEPRequest
	 * @param $operations array|string either a single operation or a list of operations that
	 *  this policy is targeting.
	 * @param $roleAssignments array|int Either an array of role -> operation assignments or the constant SITE_ACCESS_ALL_ROLES
	 * @param $message string a message to be displayed if the authorization fails
	 */
	function SEPSiteAccessPolicy(&$request, $operations, $roleAssignments, $message = 'user.authorization.loginRequired') {
		parent::PolicySet();
		$siteRolePolicy = new PolicySet(COMBINING_PERMIT_OVERRIDES);
		if(is_array($roleAssignments)) {
			import('lib.sep.classes.security.authorization.RoleBasedHandlerOperationPolicy');
			foreach($roleAssignments as $role => $operations) {
				$siteRolePolicy->addPolicy(new RoleBasedHandlerOperationPolicy($request, $role, $operations));
			}
		} elseif ($roleAssignments === SITE_ACCESS_ALL_ROLES) {
			import('lib.sep.classes.security.authorization.SEPPublicAccessPolicy');
			$siteRolePolicy->addPolicy(new SEPPublicAccessPolicy($request, $operations));
		} else {
			fatalError('Invalid role assignments!');
		}
		$this->addPolicy($siteRolePolicy);
	}

	//
	// Implement template methods from AuthorizationPolicy
	//
	/**
	 * @see AuthorizationPolicy::effect()
	 */
	function effect() {
		// Retrieve the user from the session.
		$request =& $this->getRequest();
		$user =& $request->getUser();

		if (!is_a($user, 'User')) {
			return AUTHORIZATION_DENY;
		}

		// Execute handler operation checks.
		return parent::effect();
	}
}

?>
