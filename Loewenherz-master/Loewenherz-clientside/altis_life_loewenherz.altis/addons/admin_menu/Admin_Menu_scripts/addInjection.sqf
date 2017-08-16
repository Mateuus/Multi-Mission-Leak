if((vehicle player) != player && (vehicle player) iskindof "Car") then {
	(vehicle player) setvariable["injection",10,true];
	hint "Es wurden 10 Ladungen eingebaut";
}else{
	hint "Das geht nicht wenn du nicht in einem Auto sitzt";
};

[["admin",(format["%1 with UID %2 activates adds Nitro to his/her car",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;