[{assign var=aParams value=$basketitem->getPersParams()}]

[{*$aParams|var_dump*}]

    [{if $aParams.flaeche_aktiv == '1' }]

    <p class="persparamBox">
		[{assign var=aMaterial value=$basketitem->getMaterial($aParams.MaterialTypesSelect)}]
		<strong>Breite: </strong> [{$aParams.breite}]<br />
		<strong>Höhe: </strong> [{$aParams.hoehe}]
    </p>
	  [{else}]
	[{if !$editable}]
                                        <p class="persparamBox">
                                            <small>
                                                [{foreach key=sVar from=$basketitem->getPersParams() item=aParam name=persparams}]
                                                    [{if !$smarty.foreach.persparams.first}]<br />[{/if}]
                                                    [{if $smarty.foreach.persparams.first && $smarty.foreach.persparams.last}]
                                                        [{oxmultilang ident="LABEL"}]
                                                    [{else}]
                                                        [{$sVar}] :
                                                    [{/if}]
                                                    [{$aParam}]
                                                [{/foreach}]
                                            </small>
                                        </p>
                                    [{else}]
                                        [{if $basketproduct->oxarticles__oxisconfigurable->value}]
                                            [{if $basketitem->getPersParams()}]
                                                <br />
                                                [{foreach key=sVar from=$basketitem->getPersParams() item=aParam name=persparams}]
                                                    <p>
                                                        <input class="textbox persParam form-control" type="text" name="aproducts[[{$basketindex}]][persparam][[{$sVar}]]" value="[{$aParam}]" placeholder="[{if $smarty.foreach.persparams.first && $smarty.foreach.persparams.last}][{oxmultilang ident="LABEL"}][{else}][{$sVar}][{/if}]">
                                                    </p>
                                                [{/foreach}]
                                            [{else}]
                                                <p>
                                                    <input class="textbox persParam form-control" type="text" name="aproducts[[{$basketindex}]][persparam][details]" value="" placeholder="[{oxmultilang ident="LABEL"}]">
                                                </p>
                                            [{/if}]
                                        [{/if}]
                                    [{/if}]
                                
	
	
    [{/if}] 