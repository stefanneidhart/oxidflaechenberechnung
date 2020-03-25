[{assign var="basketproduct" value=$basketitemlist.$basketindex}]
                <tr valign="top">
                    [{if $oViewConf->getViewThemeParam('blEmailsShowProductPictures')}]
                        <td>
                            <img src="[{$basketproduct->getIconUrl(false)}]" border="0" hspace="0" vspace="0" alt="[{$basketitem->getTitle()|strip_tags}]" align="texttop" style="max-width:80px;">
                        </td>
                    [{/if}]
                    <td>
                        <p>
                            <b>[{$basketitem->getTitle()}]</b>
                            [{if $basketitem->getChosenSelList()}],
                                [{foreach from=$basketitem->getChosenSelList() item=oList}]
                                    [{$oList->name}] [{$oList->value}]&nbsp;
                                [{/foreach}]
                            [{/if}]
                            [{if $basketitem->getPersParams()}]
                                [{foreach key=sVar from=$basketitem->getPersParams() item=aParam}]
                                    ,&nbsp;<em>[{oxmultilang ident=$sVar}] : [{$aParam}]</em>
                                [{/foreach}]
                            [{/if}]
                            <br>[{oxmultilang ident="PRODUCT_NO" suffix="COLON"}] [{$basketproduct->oxarticles__oxartnum->value}]

                            [{if $oViewConf->getShowGiftWrapping()}]
                                [{assign var="oWrapping" value=$basketitem->getWrapping()}]
                                <br><b>[{oxmultilang ident="GIFT_WRAPPING"}]</b>:&nbsp;[{if !$basketitem->getWrappingId()}][{oxmultilang ident="NONE"}][{else}][{$oWrapping->oxwrapping__oxname->value}][{/if}]
                            [{/if}]
                        </p>
                    </td>
                    <td>
                        <p>
                            <b style="white-space:nowrap;">[{if $basketitem->getFUnitPrice()}][{$basketitem->getFUnitPrice()}]&nbsp;[{$currency->sign}][{/if}]</b>
                            [{if !$basketitem->isBundle()}]
                                [{assign var=dRegUnitPrice value=$basketitem->getRegularUnitPrice()}]
                                [{assign var=dUnitPrice value=$basketitem->getUnitPrice()}]
                                [{if $dRegUnitPrice->getPrice() > $dUnitPrice->getPrice()}]
                                    <br><s>[{$basketitem->getFRegularUnitPrice()}]&nbsp;[{$currency->sign}]</s>
                                [{/if}]
                            [{/if}]
                            [{if $basketitem->aDiscounts}]<br><br>
                                <em style="font-size: 7pt;font-weight: normal;">[{oxmultilang ident="DISCOUNT"}]
                                    [{foreach from=$basketitem->aDiscounts item=oDiscount}]
                                        <br>[{$oDiscount->sDiscount}]
                                    [{/foreach}]
                                </em>
                            [{/if}]
                            [{if $basketproduct->oxarticles__oxorderinfo->value}]
                                [{$basketproduct->oxarticles__oxorderinfo->value}]
                            [{/if}]
                        </p>
                    </td>
                    <td>[{$basketitem->getAmount()}]</td>
                    <td>[{$basketitem->getVatPercent()}]%</td>
                    <td>
                        <b>[{$basketitem->getFTotalPrice()}]&nbsp;[{$currency->sign}]</b>
                    </td>
                </tr>