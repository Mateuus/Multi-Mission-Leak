closeDialog 0;
[{[3600] spawn lhm_fnc_purgeStart},"BIS_fnc_spawn",false,false] call lhm_fnc_mp;
[["admin",(format["%1 with UID %2 activates the Purge-Event",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;