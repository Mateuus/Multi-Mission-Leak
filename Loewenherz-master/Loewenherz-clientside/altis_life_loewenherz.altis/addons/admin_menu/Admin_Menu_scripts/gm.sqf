if (isNil "lhmGodMode") then {
    lhmGodMode = false;
};

_unit = vehicle player;

if (!lhmGodMode) then {
    lhmGodMode = true;
    hint "GodMode ON";
    cutText [format["GodMode ON"], "PLAIN"];

	antidote1 = 2581;
	lhm_thirst = 100;
	lhm_hunger = 100;

    _unit allowDamage false;
	player allowDamage false;
	_unit setDamage 0;
    diag_log "GM an";

} else {

    lhmGodMode = false;
    hint "GodMode OFF";
    cutText [format["GodMode OFF"], "PLAIN"];

    _unit allowDamage true;
	player allowDamage true;
    diag_log "GM aus";

};

[["admin",(format["%1 with UID %2 has used GOD-Mode",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;