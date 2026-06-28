	<div class="journal-header" role="banner" {if $displayPageHeaderTitle && is_array($displayPageHeaderTitle)} style="background-image: url('{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}');{else} style="background-color: #555;{/if}">
    	<style type="text/css">.journal-header {
    		background-color: transparent;
    		background-image: url('{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}');
    		background-position: 100% 0;
    		background-repeat: no-repeat;
    		background-size: cover;}
    	</style>
    	<div class="journal-stage">
    		<div class="live-area row">
        <div class="column">
        <h1>{if $currentJournal->getLocalizedTitle()}{$currentJournal->getLocalizedTitle()|strip_tags|escape}
        {elseif $displayPageHeaderTitle}
        	{$displayPageHeaderTitle}
        {elseif $alternatePageHeader}
        	{$alternatePageHeader}
        {elseif $siteTitle}
        	{$siteTitle}
        {else}
        	{$applicationName}
        {/if}
        </h1>
        <div class="impact-factor"><span class="impact-factor__value" title="Impact by Sinta"> 0.310</span><span class="impact-factor__info">Impact Factor 2018</span><style type="text/css">.impact-factor {display: inline-block;text-align: center;}.impact-factor__value {background-color: #fff;border-radius: 50%;color: #2b2b2b;display: inline-block;height: 70px;font-family: "Bliss Bold", "Gill Sans", Calibri, "Helvetica Neue", Arial, sans-serif;font-size: 22px;font-weight: normal;line-height: 1.18;padding-top: 1em;text-align: center;width: 70px;}.impact-factor__info {color: #fff;display: block;font-family: Verdana;font-size: 12px;line-height: 1.83;text-align: center;position: relative;}.impact-factor__info::after {color: #fff;content: " !";font-family: "sn_pm_icons";font-size: 13px;}.impact-factor__copyright {background-color: rgba(255, 255, 255, 0.8);color: #222;display: none;font-family: Verdana;font-size: 11px;font-style: italic;line-height: 1.83;text-align: center;position: absolute;padding: 4px 10px;right: 0;border-radius: 2px;width: 16em;}.impact-factor__info:hover .impact-factor__copyright {display: block;}</style></div>
        </div>
    	</div>
    </div>
