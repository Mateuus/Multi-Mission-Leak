triggerEvent = ["powerOffline","safezone_kavala"];
PublicVariableServer "triggerEvent";
[["admin",(format["%1 with UID %2 activates the PowerOff-Event",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;