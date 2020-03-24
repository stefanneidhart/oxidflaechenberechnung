[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign}]


[{if $readonly }]
[{assign var="readonly" value="readonly disabled"}]
[{else}]
[{assign var="readonly" value=""}]
[{/if}]

<form name="transfer" id="transfer" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="maincontrollerflaechenberechnung">
    <input type="hidden" name="fnc" value="">
    <input type="hidden" name="voxid" value="[{ $oxid }]">
    <input type="hidden" name="editlanguage" value="[{ $editlanguage }]">
</form>


<form name="myedit" id="myedit" action="[{ $oViewConf->getSelfLink() }]" method="post">

    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="cl" value="maincontrollerflaechenberechnung">
    <input type="hidden" name="fnc" value="save">
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="voxid" value="[{ $oxid }]">
    <input type="hidden" name="oxparentid" value="[{ $oxparentid }]">
    <input type="hidden" name="editval[article__oxid]" value="[{ $oxid }]">

    <table>
	<tr>
	    <td>Flächenberechnung aktivieren: </td>
	    <td>   
		<input class="edittext" onClick="Javascript:document.myedit.submit()" type="checkbox" name="editval[oxarticles__flaeche_aktiv]" value='1' [{if $edit->oxarticles__flaeche_aktiv->value == 1}]checked[{/if}] [{ $readonly }]>
	    </td>
	</tr>
	<tr>
	    <td>Preis je qm</td>
	    <td class="edittext">
		<input type="text" class="editinput" size="8" maxlength="[{$edit->oxarticles__oxprice->fldmax_length}]" name="editval[oxarticles__oxprice]" value="[{$edit->oxarticles__oxprice->value}]" [{$readonly}]>
	    </td>
	</tr>
	<tr>
	    <td>Maximale-Höhe</td>
	    <td>				
		<input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__flaeche_hoehe_max->fldmax_length}]" name="editval[oxarticles__flaeche_hoehe_max]" value="[{$edit->oxarticles_flaeche_hoehe_max->value}]"  [{ $readonly }]>
	    </td>
	</tr>	
	<tr>
	    <td>Maximale-Breite</td>
	    <td>				
		<input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__flaeche_breite_max->fldmax_length}]" name="editval[oxarticles__flaeche_breite_max]" value="[{$edit->oxarticles__flaeche_breite_max->value}]"  [{ $readonly }]>
	    </td>
	</tr>		
		<tr>
	    <td>Gewicht in Gramm je qm</td>
	    <td>				
		<input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__flaeche_gewicht->fldmax_length}]" name="editval[oxarticles__flaeche_gewicht]" value="[{$edit->oxarticles__flaeche_breite_max->value}]"  [{ $readonly }]>
	    </td>
	</tr>
	<tr>
	    <td></td>
	    <td>
		<input type="submit" class="edittext" name="save" value="speichern" [{ $readonly }]>
	    </td>
	</tr>
    </table>


</form>


[{$edit->oxarticles__AREACALC}]

[{include file="bottomnaviitem.tpl"}]

[{include file="bottomitem.tpl"}]
