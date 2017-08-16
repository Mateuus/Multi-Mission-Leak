triggerEvent = ["moneyTransport",player];
PublicVariableServer "triggerEvent";
[["admin",(format["%1 with UID %2 activates the moneyTransport-Event",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;