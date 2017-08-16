if("ItemRadio" in assignedItems player) then {
    createDialog "Life_cell_phone";
    enableRadio true;
    } else {
    hint parseText format ["<t size=1.30' font='puristaMedium' align='center' color='#0D82DF'>No CellPhone</t><br/><br/><t size='0.90 'font='puristaLight' align='left'>You must have have a cellphone (Radio) to use this. You can buy cellphone in a general store</t><br/&gt"];
    enableRadio false;
};