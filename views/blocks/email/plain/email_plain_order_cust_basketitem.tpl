[{assign var="basketproduct" value=$basketitemlist.$basketindex}]
[{$basketproduct->oxarticles__oxtitle->getRawValue()|strip_tags}][{if $basketproduct->oxarticles__oxvarselect->value}], [{$basketproduct->oxarticles__oxvarselect->value}][{/if}]
[{if $basketitem->getChosenSelList()}][{foreach from=$basketitem->getChosenSelList() item=oList}]

[{$oList->name}] [{$oList->value}]

[{/foreach}][{/if}]
[{if $basketitem->getPersParams()}]
[{foreach key=sVar from=$basketitem->getPersParams() item=aParam}]

[{$sVar}] : [{$aParam}]
[{/foreach}]
[{/if}]
[{if $oViewConf->getShowGiftWrapping()}]
[{assign var="oWrapping" value=$basketitem->getWrapping()}]

[{oxmultilang ident="GIFT_WRAPPING"}] [{if !$basketitem->getWrappingId()}][{oxmultilang ident="NONE"}][{else}][{$oWrapping->oxwrapping__oxname->value}][{/if}]
[{/if}]
[{if $basketproduct->oxarticles__oxorderinfo->value}]
[{$basketproduct->oxarticles__oxorderinfo->getRawValue()}]
[{/if}]

[{assign var=dRegUnitPrice value=$basketitem->getRegularUnitPrice()}]
[{assign var=dUnitPrice value=$basketitem->getUnitPrice()}]
[{oxmultilang ident="UNIT_PRICE"}] [{$basketitem->getFUnitPrice()}] [{$currency->name}] [{if !$basketitem->isBundle()}][{if $dRegUnitPrice->getPrice() > $dUnitPrice->getPrice()}] ([{$basketitem->getFRegularUnitPrice()}] [{$currency->sign}]) [{/if}][{/if}]

[{oxmultilang ident="QUANTITY"}] [{$basketitem->getAmount()}]
[{oxmultilang ident="VAT"}] [{$basketitem->getVatPercent()}]%
[{oxmultilang ident="TOTAL"}] [{$basketitem->getFTotalPrice()}] [{$currency->name}]