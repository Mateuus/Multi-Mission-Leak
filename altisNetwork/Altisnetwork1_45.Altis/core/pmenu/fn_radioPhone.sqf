if("ItemRadio" in assignedItems player) then {
createDialog "Life_cell_phone";
} else {
hint parseText format ["<t size='0.90 'font='puristaLight' align='left'>You can buy a cell phone at the general store.</t><br/&gt"];
};