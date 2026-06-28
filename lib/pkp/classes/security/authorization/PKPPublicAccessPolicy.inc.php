<?php
/**
 * @file classes/security/authorization/SEPPublicAccessPolicy.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPPublicAccessPolicy
 * @ingroup security_authorization
 *
 * @brief Class to control access to handler operations based on an
 *  operation whitelist.
 */

import('lib.sep.classes.security.authorization.HandlerOperationPolicy');

class SEPPublicAccessPolicy extends HandlerOperationPolicy {
	/**
	 * Constructor
	 * @param $request SEPRequest
	 * @param $operations array|string either a single operation or a list of operations that
	 *  this policy is targeting.
	 * @param $message string a message to be displayed if the authorization fails
	 */
	function SEPPublicAccessPolicy(&$request, $operations, $message = 'user.authorization.privateOperation') {
		parent::HandlerOperationPolicy($request, $operations, $message);
	}


	//
	// Implement template methods from AuthorizationPolicy
	//
	/**
	 * @see AuthorizationPolicy::effect()
	 */
	function effect() {
		if ($this->_checkOperationWhitelist()) {
			return AUTHORIZATION_PERMIT;
		} else {
			return AUTHORIZATION_DENY;
		}
	}
}

?>
