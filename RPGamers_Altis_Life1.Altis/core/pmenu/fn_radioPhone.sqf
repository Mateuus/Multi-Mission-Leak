if("ItemRadio" in assignedItems player) then {
createDialog "life_cell_phone_call";
} else {
["No Cell Phone",5,"orange"] call RPG_Fnc_Msg;
["Buy a cell phone at the general store",5,"gray"] call RPG_Fnc_Msg;
//hint parseText format ["<t size='0.90 'font='puristaLight' align='left'>You can buy a cell phone at the general store.</t><br/&gt"];
};