[{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]
[{assign var="oSelections" value=$basketproduct->getSelections(null,$basketitem->getSelList())}]
[{if $oSelections}]
<div class="selectorsBox clear" id="cartItemSelections_[{$smarty.foreach.basketContents.iteration}]">
    [{foreach from=$oSelections item=oList name=selections}]
    

    
    <input type="hidden" name="aproducts[[{$basketindex}]][sel][[{$smarty.foreach.selections.index}]]" value="[{$oActiveSelection->getValue()}]">
    <div>[{$oList->getLabel()}]: [{$oActiveSelection->getName()}]</div>
    
    [{/foreach}]
</div>
[{/if}]
[{/if}]