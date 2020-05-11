[{assign var=aParams value=$basketitem->getPersParams()}]

[{if $aParams.flaeche_aktiv == '1' }]

<p class="persparamBox">
    <strong>Breite: </strong> [{$aParams.breite}] m<br />
    <strong>Höhe: </strong> [{$aParams.hoehe}] m<br />
    <strong>Fläche: </strong> [{$basketitem->getFlaeche($aParams)}] m²
    <strong>Gewicht: </strong> [{$basketitem->getMaterialWeight()}] 
</p>

[{elseif $aParams.areacalc_active == '1' }]
[{*$aParams|var_dump*}]

    <strong>Breite: </strong> [{$aParams.breite}] m<br />
    <strong>Höhe: </strong> [{$aParams.hoehe}] m<br />
    <strong>Fläche: </strong> [{$aParams.hoehe*$aParams.breite}] m²<br />
    <strong>Material: </strong> [{$basketitem->getMaterialName($aParams.MaterialTypesSelect)}]
    [{if $aParams.areacalc_opt1 == '1'}]<strong>Edelstahlprofilschine: </strong> ja<br />[{/if}] 
 [{if $aParams.areacalc_opt2 == '1'}]<strong>S - vor Sturz: </strong> ja[{/if}] 

[{else}]
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


[{/if}] 