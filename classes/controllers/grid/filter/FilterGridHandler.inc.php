<?php

/**
 * @file classes/controllers/grid/filter/FilterGridHandler.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class FilterGridHandler
 * @ingroup classes_controllers_grid_filter
 *
 * @brief Handle CLA specific parts of filter grid requests.
 */

import('lib.sep.classes.controllers.grid.filter.SEPFilterGridHandler');

// import validation classes
import('classes.handler.validation.HandlerValidatorJournal');
import('lib.sep.classes.handler.validation.HandlerValidatorRoles');

class FilterGridHandler extends SEPFilterGridHandler {
	/**
	 * Constructor
	 */
	function FilterGridHandler() {
		parent::SEPFilterGridHandler();
		$this->addRoleAssignment(
				array(ROLE_ID_SITE_ADMIN, ROLE_ID_JOURNAL_MANAGER),
				array('fetchGrid', 'addFilter', 'editFilter', 'updateFilter', 'deleteFilter'));
	}


	//
	// Implement template methods from SEPHandler
	//
	/**
	 * @see SEPHandler::authorize()
	 */
	function authorize(&$request, &$args, $roleAssignments) {
		// Make sure the user can change the journal setup.
		import('classes.security.authorization.CLAJournalAccessPolicy');
		$this->addPolicy(new CLAJournalAccessPolicy($request, $roleAssignments));
		return parent::authorize($request, $args, $roleAssignments);
	}
}
