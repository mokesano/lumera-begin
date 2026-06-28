{**
 * templates/controllers/listbuilder/multipleListsListbuilder.tpl
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Displays a MultipleListsListbuilder object
 *}

{assign var=staticId value="component-"|concat:$grid->getId()}
{assign var=gridId value=$staticId|concat:'-'|uniqid}
{assign var=gridActOnId value=$gridId}
{if count($lists) == 2}
	{assign var=widthClass value="sep_helpers_half"}
{elseif count($lists) == 3}
	{assign var=widthClass value="sep_helpers_third"}
{/if}
<script type="text/javascript">
	$(function() {ldelim}
		$('#{$gridId|escape}').sepHandler(
			'$.sep.controllers.listbuilder.MultipleListsListbuilderHandler',
			{ldelim}
				{include file="controllers/listbuilder/listbuilderOptions.tpl"}
				listsId: [
				{foreach from=$lists item=list}
					'{$list->getId()}',
				{/foreach} ]
			{rdelim}
		);
	});
</script>


<div id="{$gridId|escape}" class="sep_controllers_grid sep_controllers_listbuilder formWidget">

	{* Use this disabled input to store LB deletions. See ListbuilderHandler.js *}
	<input disabled="disabled" type="hidden" class="deletions" />

	<div class="wrapper">
		{include file="controllers/grid/gridHeader.tpl"}
		{foreach from=$lists item=list}
			{assign var=listId value=$list->getId()}
			<div class="list_wrapper {$widthClass}">
				{if $grid->getActions($smarty.const.GRID_ACTION_POSITION_ABOVE)}
					{include file="controllers/grid/gridActionsAbove.tpl" actions=$grid->getActions($smarty.const.GRID_ACTION_POSITION_ABOVE) gridId=$gridId}
				{/if}
				{if $list->getTitle()}
					<div class="sep_helpers_align_left sep_helpers_full">
						<span class="h4 no_border sep_helpers_align_left">{$list->getTitle()|translate}</span>
					</div>
				{/if}
				{assign var=gridTableId value=$staticId|concat:"-table-":$listId}
				{include file="controllers/listbuilder/listbuilderTable.tpl gridTableId=$gridTableId rows=$listsRows[$listId]}
			</div>
		{/foreach}
	</div>
</div>
