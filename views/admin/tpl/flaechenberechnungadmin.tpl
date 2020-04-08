[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign}]

<script type="text/javascript">
    <!--
    function editThis( sID )
    {
        var oTransfer = top.basefrm.edit.document.getElementById( "transfer" );
        oTransfer.oxid.value = sID;
        oTransfer.cl.value = top.basefrm.list.sDefClass;
 
        //forcing edit frame to reload after submit
        top.forceReloadingEditFrame();
 
        var oSearch = top.basefrm.list.document.getElementById( "search" );
        oSearch.oxid.value = sID;
        oSearch.actedit.value = 0;
        oSearch.submit();
    }
    [{if !$oxparentid}]
    window.onload = function ()
    {
        [{if $updatelist == 1}]
        top.oxid.admin.updateList('[{$oxid}]');
        [{/if}]
        var oField = top.oxid.admin.getLockTarget();
        oField.onchange = oField.onkeyup = oField.onmouseout = top.oxid.admin.unlockSave;
    }
        [{/if}]
    //-->
</script>

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
	    <td>Label-Höhe</td>
	    <td>				
		<input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__flaeche_hoehe_label->fldmax_length}]" name="editval[oxarticles__flaeche_hoehe_label]" value="[{$edit->oxarticles__flaeche_hoehe_label->value}]"  [{ $readonly }]>
	    </td>
	</tr>	

	<tr>
	    <td>Label-Breite</td>
	    <td>				
		<input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__flaeche_breite_label->fldmax_length}]" name="editval[oxarticles__flaeche_breite_label]" value="[{$edit->oxarticles__flaeche_breite_label->value}]"  [{ $readonly }]>
	    </td>
	</tr>		
	
	<tr>
	    <td>Maximale-Höhe</td>
	    <td>				
		<input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__flaeche_hoehe_max->fldmax_length}]" name="editval[oxarticles__flaeche_hoehe_max]" value="[{$edit->oxarticles__flaeche_hoehe_max->value}]"  [{ $readonly }]>
	    </td>
	</tr>	
	
	<tr>
	    <td>Minimale-Höhe</td>
	    <td>				
		<input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__flaeche_hoehe_min->fldmax_length}]" name="editval[oxarticles__flaeche_hoehe_min]" value="[{$edit->oxarticles__flaeche_hoehe_min->value}]"  [{ $readonly }]>
	    </td>
	</tr>	

	<tr>
	    <td>Maximale-Breite</td>
	    <td>				
		<input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__flaeche_breite_max->fldmax_length}]" name="editval[oxarticles__flaeche_breite_max]" value="[{$edit->oxarticles__flaeche_breite_max->value}]"  [{ $readonly }]>
	    </td>
	</tr>		
	<tr>
	    <td>Minimale-Breite</td>
	    <td>				
		<input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__flaeche_breite_min->fldmax_length}]" name="editval[oxarticles__flaeche_breite_min]" value="[{$edit->oxarticles__flaeche_breite_min->value}]"  [{ $readonly }]>
	    </td>
	</tr>	
	
		<tr>
	    <td>Gewicht in Gramm je qm</td>
	    <td>				
		<input type="text" class="editinput" size="20" maxlength="[{$edit->oxarticles__flaeche_gewicht->fldmax_length}]" name="editval[oxarticles__flaeche_gewicht]" value="[{$edit->oxarticles__flaeche_gewicht->value}]"  [{ $readonly }]>
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
