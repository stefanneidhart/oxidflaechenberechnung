[{if $oViewConf->showSelectLists()}]
<div class="SelectListContainer">		 
    [{assign var="snSelections" value=$oDetailsProduct->getSelections()}]

    [{if $snSelections}]
    [{foreach from=$snSelections item=oList name=selections}]
    <div class="snSelect">
	[{*include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"*}]

	[{assign var="sSelType" value="seldrop"}]		
	[{assign var="iKey" value=$smarty.foreach.selections.index}]	
	[{assign var="sFieldName" value="sel"}]	
	[{assign var="oSelections" value=$oList->getSelections()}]

	[{if $oSelections}]
	<div class="form-group dropDown">
	    [{if !$blHideLabel}]
            <p class="variant-label"><strong>[{$oSelectionList->getLabel()}][{oxmultilang ident="COLON"}]</strong></p>
	    [{/if}]
	    <div class="dropdown">
		<button type="button" class="btn btn-outline-dark btn-sm dropdown-toggle" data-toggle="dropdown">
		    [{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
		    [{if $oActiveSelection}]
                    <span class="float-left">[{$oActiveSelection->getName()}]</span>
		    [{elseif !$blHideDefault}]
                    <span class="float-left">
                        [{if $sFieldName == "sel"}]
			[{oxmultilang ident="PLEASE_CHOOSE"}]
                        [{else}]
			[{$oSelectionList->getLabel()}] [{oxmultilang ident="CHOOSE_VARIANT"}]
                        [{/if}]
                    </span>
		    [{/if}]
		</button>
		[{if $editable !== false}]
                <input type="hidden" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" value="[{if $oActiveSelection}][{$oActiveSelection->getValue()}][{/if}]">
                <ul class="dropdown-menu [{$sJsAction}][{if $sFieldName != "sel"}] vardrop[{/if}]" role="menu">
                    [{if $oActiveSelection && !$blHideDefault}]
		    <li class="dropdown-menu-item">
			<a href="#" rel="" class="dropdown-menu-link">
			    [{if $sFieldName == "sel"}]
			    [{oxmultilang ident="PLEASE_CHOOSE"}]
			    [{else}]
			    [{oxmultilang ident="CHOOSE_VARIANT"}]
			    [{/if}]
			</a>
		    </li>
                    [{/if}]
                    [{foreach from=$oSelections item=oSelection}]
		    <li class="dropdown-menu-item[{if $oSelection->isDisabled()}] disabled js-disabled[{/if}]">
			<a href="[{$oSelection->getLink()}]" data-selection-id="[{$oSelection->getValue()}]" class="dropdown-menu-link[{if $oSelection->isActive()}] active[{/if}]">[{$oSelection->getName()}]</a>
		    </li>
                    [{/foreach}]
                </ul>
		[{/if}]
	    </div>
	</div>
	[{/if}]	
    </div>
    [{/foreach}]
    [{/if}]
</div>
[{/if}]