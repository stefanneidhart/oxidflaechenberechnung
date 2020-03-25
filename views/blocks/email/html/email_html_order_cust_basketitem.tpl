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
                            [{if $basketitem->getChosenSelList()}]
                                <ul>
                                    [{foreach from=$basketitem->getChosenSelList() item=oList}]
                                        <li style="padding: 3px;">[{$oList->name}] [{$oList->value}]</li>
                                    [{/foreach}]
                                </ul>
                            [{/if}]
                            [{if $basketitem->getPersParams()}]
                                <ul>
                                    [{foreach key=sVar from=$basketitem->getPersParams() item=aParam}]
				   [{if $sVar != 'flaeche_aktiv' }]
                                        <li style="padding: 3px;">[{$sVar}] : [{$aParam}]</li>
					[{/if}]
                                    [{/foreach}]
                                </ul>
                            [{/if}]
                            <br>
                            <p>
                                <b>[{oxmultilang ident="PRODUCT_NO" suffix="COLON"}] [{$basketproduct->oxarticles__oxartnum->value}]</b>
                            </p>
                            [{if $oViewConf->getShowGiftWrapping()}]
                                [{assign var="oWrapping" value=$basketitem->getWrapping()}]
                                <p>
                                    <b>[{oxmultilang ident="GIFT_WRAPPING"}]:&nbsp;</b>
                                    [{if !$basketitem->getWrappingId()}]
                                        [{oxmultilang ident="NONE"}]
                                    [{else}]
                                        [{$oWrapping->oxwrapping__oxname->value}]
                                    [{/if}]
                                </p>
                            [{/if}]

                            [{if $blShowReviewLink}]
                                <p>
                                    <a href="[{$oConf->getShopURL()}]index.php?shp=[{$shop->oxshops__oxid->value}]&amp;anid=[{$basketitem->getProductId()}]&amp;cl=review&amp;reviewuserhash=[{$user->getReviewUserHash($user->getId())}]" style="" target="_blank">[{oxmultilang ident="PRODUCT_REVIEW"}]</a>
                                </p>
                            [{/if}]
                        </p>
                    </td>
                    <td align="right">
                        <p>
                            <b>[{if $basketitem->getFUnitPrice()}][{$basketitem->getFUnitPrice()}] [{$currency->sign}][{/if}]</b>
                            [{if !$basketitem->isBundle()}]
                                [{assign var=dRegUnitPrice value=$basketitem->getRegularUnitPrice()}]
                                [{assign var=dUnitPrice value=$basketitem->getUnitPrice()}]
                                [{if $dRegUnitPrice->getPrice() > $dUnitPrice->getPrice()}]
                                <br><s>[{$basketitem->getFRegularUnitPrice()}]&nbsp;[{$currency->sign}]</s>
                                [{/if}]
                            [{/if}]
                        </p>

                        [{if $basketitem->aDiscounts}]
                            <p>
                                <em>[{oxmultilang ident="DISCOUNT"}]
                                    [{foreach from=$basketitem->aDiscounts item=oDiscount}]
                                      <br>[{$oDiscount->sDiscount}]
                                    [{/foreach}]
                                </em>
                            </p>
                        [{/if}]

                        [{if $basketproduct->oxarticles__oxorderinfo->value}]
                            [{$basketproduct->oxarticles__oxorderinfo->value}]
                        [{/if}]
                    </td>
                    <td align="right">
                        <b>[{$basketitem->getAmount()}]</b>
                    </td>
                    <td align="right">[{$basketitem->getVatPercent()}]%</td>
                    <td align="right">
                        <b>[{$basketitem->getFTotalPrice()}] [{$currency->sign}]</b>
                    </td>
                </tr>