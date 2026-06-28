/**
 * @defgroup plugins_themes_modern_js
 */
/**
 * @file plugins/themes/modern/js/modernThemeSiteHandler.js
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2000-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class ModernThemeSiteHandler
 * @ingroup plugins_themes_modern_js
 *
 * @brief Site handler that handles the modern theme customizations.
 */
(function($) {

        /** @type {Object} */
        $.sep.plugins = $.sep.plugins || {};
	/** @type {Object} */
	$.sep.plugins.themes = $.sep.plugins.themes || {};
	/** @type {Object} */
	$.sep.plugins.themes.modern = $.sep.plugins.themes.modern || {};

	/**
         * @constructor
         *
         * @extends $.sep.classes.Handler
         */
        $.sep.plugins.themes.modern.ModernThemeSiteHandler = function($site, options) {
		this.parent($site, options);
		
		$("#navbar").insertAfter("#headerTitle");
		if ($("#main").css('margin-right') !== "0px") {
			$("#main").css('margin-right', '9%');
		}
		if ($("#main").css('margin-left') !== "0px") {
                        $("#main").css('margin-left', '9%');
                }

		if ($("#sidebar").children().length == 1) {
			$("#main").css('width', '65%');
		} else {
			$("#main").css('width', '49%');
		}
		
		$('#breadcrumb').insertBefore('#sidebar');
		$('#topBar').remove();
	};
	$.sep.classes.Helper.inherits(
			$.sep.plugins.themes.modern.ModernThemeSiteHandler, 
			$.sep.controllers.SiteHandler);


/** @param {jQuery} $ jQuery closure. */
}(jQuery))
