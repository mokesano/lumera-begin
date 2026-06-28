/**
 * editor_plugin_src.js
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 */

(function() {
	tinymce.create('tinymce.plugins.SEPMultilingualPopover', {
		init : function(ed, url) {
			var t = this;
			if(top.$.sep.controllers.form.MultilingualInputHandler.receiveEditorEvent) {
				ed.onInit.add(function(ed) { t.blurEvent(ed); });

				ed.onEvent.add(function(ed, event) {
					top.$.sep.controllers.form.MultilingualInputHandler.receiveEditorEvent(ed.editorId, event);
				});
			}
		},

		blurEvent : function(ed) {
			tinyMCE.dom.Event.add(ed.getWin(), "blur", function(event) {
					top.$.sep.controllers.form.MultilingualInputHandler.receiveEditorEvent(ed.editorId, event);
				});
			},

		getInfo : function() {
			return {
				longname : 'SEPMultilingualPopover',
				author : 'Sangia Editorial Project',
				authorurl : 'http://sep.sfu.ca',
				infourl : 'http://sep.sfu.ca',
				version : tinymce.majorVersion + "." + tinymce.minorVersion
			};
		}
	});

	// Register plugin
	tinymce.PluginManager.add('sepmultilingualpopover', tinymce.plugins.SEPMultilingualPopover);
})();
