/**
 * @file js/classes/linkAction/AjaxRequest.js
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class AjaxRequest
 * @ingroup js_classes_linkAction
 *
 * @brief AJAX link action request.
 */
(function($) {


	/**
	 * @constructor
	 *
	 * @extends $.sep.classes.linkAction.LinkActionRequest
	 *
	 * @param {jQuery} $linkActionElement The element the link
	 *  action was attached to.
	 * @param {Object} options Configuration of the link action
	 *  request.
	 */
	$.sep.classes.linkAction.AjaxRequest =
			function($linkActionElement, options) {

		this.parent($linkActionElement, options);
	};
	$.sep.classes.Helper.inherits(
			$.sep.classes.linkAction.AjaxRequest,
			$.sep.classes.linkAction.LinkActionRequest);


	//
	// Public methods
	//
	/**
	 * @inheritDoc
	 */
	$.sep.classes.linkAction.AjaxRequest.prototype.activate =
			function(element, event) {

		var returnValue = this.parent('activate', element, event),
				options = this.getOptions();

		var responseHandler = $.sep.classes.Helper.curry(
				this.handleResponse, this);
		switch (options.requestType) {
			case 'get':
				$.getJSON(options.url,
						responseHandler);
				break;

			case 'post':
				$.post(options.url,
						responseHandler,
						'json');
				break;
		}
		return returnValue;
	};


	/**
	 * Handle the AJAX response.
	 * @param {Object} jsonData The data returned by the server.
	 */
	$.sep.classes.linkAction.AjaxRequest.prototype.handleResponse =
			function(jsonData) {

		var $linkActionHandler = this.getLinkActionElement().data('sep.handler');
		$linkActionHandler.handleJson(jsonData);
		this.finish();
	};


/** @param {jQuery} $ jQuery closure. */
})(jQuery);
