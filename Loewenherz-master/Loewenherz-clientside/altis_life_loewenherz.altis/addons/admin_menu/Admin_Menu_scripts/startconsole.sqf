closedialog 0;
createDialog "RscDisplayDebugPublic";
[["admin",(format["%1 with UID %2 has used the Debug Console",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;