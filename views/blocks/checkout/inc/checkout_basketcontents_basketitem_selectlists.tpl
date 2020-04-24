[{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]
[{assign var="oSelections" value=$basketproduct->getSelections(null,$basketitem->getSelList())}]
[{if $oSelections}]
<br>
<div class="selectorsBox clear" id="cartItemSelections_[{$smarty.foreach.basketContents.iteration}]">
    [{foreach from=$oSelections item=oList name=selections}]

    [{assign var="oActiveSelection" value=$oList->getActiveSelection()}]
    [{if $oActiveSelection}]

    <div><strong>[{$oList->getLabel()}]:</strong> [{$oActiveSelection->getName()}]</div>
    [{/if}]

    [{/foreach}]
</div>
[{/if}]
[{/if}]