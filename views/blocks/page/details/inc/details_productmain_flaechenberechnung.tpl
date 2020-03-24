[{$smarty.block.parent}]

[{if $oDetailsProduct->oxarticles__flaeche_aktiv->value == 1}]

[{oxstyle include=$oViewConf->getModuleUrl("oxidflaechenberechnung", "out/src/css/sn_calc.css") }]
[{assign var="MaxH" value=$oDetailsProduct->getMaxH()}]
[{assign var="MaxB" value=$oDetailsProduct->getMaxB()}]
[{assign var="Gewicht" value=$oDetailsProduct->getMaxB()}]
[{assign var="Preis" value=$oDetailsProduct->getPrice()}]
[{oxscript include=$oViewConf->getModuleUrl("oxidflaechenberechnung", "out/src/js/sn_calc.js") }]

[{$Preis|var_dump}]

<script type="text/javascript">
<!--
    CH.setMaxH('[{$MaxH}]');
    CH.setMaxB('[{$MaxB}]');
    CH.setMaxGewicht('[{$Gewicht}]');
    CH.setPreis('10');
    CH.init();
//-->
</script>

<div class="PreisKalkulationContainer">    
    <input id="flaeche_aktiv" name="flaeche_aktiv" value="1" autocomplete="off" type="hidden">

    <div class="InputContainer">
	<div class="itemrow HoeheContainer">
	    <label>Höhe:</label>
	    <input id="hoehe" type="text" name="hoehe" value="1" size="3" autocomplete="off" class="textbox">
	</div>	
	<div class="itemrow BreiteContainer">
	    <label>Breite:</label>
	    <input id="breite" type="text" name="breite" value="1" size="3" autocomplete="off" class="textbox">

	</div>		
    </div>
    <div class="ResultContainer">
	<div class="itemrow AreaContainer">
	    <label>Fläche:</label>
	    <div id="AreaResult" class="AreaResult"></div>
	    <input id="flaeche" type="hidden" name="flaeche" value="1" size="3" autocomplete="off" class="textbox">
	</div>

	<div class="itemrow WeightContainer">
	    <input id="CalcWeight" type="hidden" name="CalcWeight" value="1" size="3" autocomplete="off" class="textbox">
	</div>
    </div>
    <div class="db"></div>
</div>

[{/if}]