{**
 * templates/article/footer.tpl
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article View -- Footer component.
 *}


</div><!-- main -->
</article>

{if $defineTermsContextId}
<script type="text/javascript">
{literal}
<!--
	// Open "Define Terms" context when double-clicking any text
	function openSearchTermWindow(url) {
		var term;
		if (window.getSelection) {
			term = window.getSelection();
		} else if (document.getSelection) {
			term = document.getSelection();
		} else if(document.selection && document.selection.createRange && document.selection.type.toLowerCase() == 'text') {
			var range = document.selection.createRange();
			term = range.text;
		}
		if (term != ""){
			if (url.indexOf('?') > -1) openRTWindowWithToolbar(url + '&defineTerm=' + term);
			else openRTWindowWithToolbar(url + '?defineTerm=' + term);
		}
	}

	if(document.captureEvents) {
		document.captureEvents(Event.DBLCLICK);
	}

	// Make sure to only open the reading tools when double clicking within the galley
	if (document.getElementById('inlinePdfResizer')) {
		context = document.getElementById('inlinePdfResizer');
	}
	else if (document.getElementById('content')) {
		context = document.getElementById('content');
	}
	else {
		context = document;
	}

	context.ondblclick = new Function("openSearchTermWindow('{/literal}{url page="rt" op="context" path=$articleId|to_array:$galleyId:$defineTermsContextId escape=false}{literal}')");
// -->
{/literal}
</script>
{/if}

{get_debug_info}
{if $enableDebugStats}{include file=$pqpTemplate}{/if}
 
</div>

<div id="footer">
	<div id="footer-wunaraha" class="wunaraha" role="navigation">
		<span class="strapline">We brings your life with scientific documents at your fingertips</span>
	</div>
	<div id="footer-legal">
		<div id="legal" role="contentinfo">
			<a target="_blank" rel="noreferrer noopener" href="//www.stipwunaraha.ac.id">
				<img src="{$baseUrl}/public/site/images/cosire-foother.svg" alt="Stipwunara Research Media (SRM)" width="auto" height="32">
			</a>
			<span id="footer-copyright">© Coastal and Isles Research Indonesia unless otherwise stated. Part of <a target="_blank" rel="noreferrer noopener" href="//www.stipwunaraha.ac.id">Stipwunaraha Research Media</a>.</span>
		</div>
	</div>
	
	<div id="footer-branding"><img src="{$baseUrl}/public/site/images/cosire-foother.svg" alt="COSIRE Indonesia Logo" width="auto" height="33px"></div>

	<div id="google-analytics-account" style="display: none;">UA-110581662-2</div>

</div> <!-- container -->

</body>
</html>
