<?php

/**
 * @file classes/core/SEPProfiler.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SEPProfiler
 * @ingroup core
 *
 * @brief Basic shell class used to wrap the PHP Quick Profiler Class
 */


require_once('./lib/sep/lib/pqp/classes/PhpQuickProfiler.php');

class SEPProfiler {

	/** @var $profiler object instance of the PQP profiler */
	var $profiler;

	/**
	 * Constructor.
	 */
	function SEPProfiler() {
		$this->profiler = new PhpQuickProfiler(PhpQuickProfiler::getMicroTime());
	}

	/**
	 * Gather information to be used to display profiling
	 * @return array of stored profiling information
	 */
	function getData() {
		$profiler =& $this->profiler;
		$profiler->db = new SEPDBProfiler();

		$profiler->gatherConsoleData();
		$profiler->gatherFileData();
		$profiler->gatherMemoryData();
		$profiler->gatherQueryData();
		$profiler->gatherSpeedData();

		return $profiler->output;
	}
}

class SEPDBProfiler {

	/** @var $queryCount property to wrap DB connection query count */
	var $queryCount;

	/**
	 * Constructor.
	 */
	function SEPDBProfiler() {
		$dbconn =& DBConnection::getInstance();

		$this->queryCount = $dbconn->getNumQueries();
		$this->queries =& Registry::get('queries', true, array());
	}
}

?>
