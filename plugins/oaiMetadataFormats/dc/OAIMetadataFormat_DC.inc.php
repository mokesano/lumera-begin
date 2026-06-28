<?php

/**
 * @defgroup oai_format
 */

/**
 * @file plugins/oaiMetadataFormats/dc/OAIMetadataFormat_DC.inc.php
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class OAIMetadataFormat_DC
 * @ingroup oai_format
 * @see OAI
 *
 * @brief OAI metadata format class -- Dublin Core.
 */
import('lib.sep.plugins.oaiMetadataFormats.dc.SEPOAIMetadataFormat_DC');

class OAIMetadataFormat_DC extends SEPOAIMetadataFormat_DC {

	/**
	 * @see lib/sep/plugins/oaiMetadataFormats/dc/SEPOAIMetadataFormat_DC::toXml()
	 */
	function toXml(&$record, $format = null) {
		$article =& $record->getData('article');
		return parent::toXml($article, $format);
	}
}

?>
