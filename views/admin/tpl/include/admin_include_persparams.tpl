[{*$persParams|var_dump*}]y

[{foreach key=persParamKey from=$persParams item=persParamValue name=persparams}]
    [{if !$smarty.foreach.persparams.first}]&nbsp;,&nbsp;[{/if}]
    <em>
        [{if $persParams|@count == 1}][{oxmultilang ident="GENERAL_LABEL"}]:[{else}][{$persParamKey}]:[{/if}] [{$persParamValue}]
    </em>
[{/foreach}]