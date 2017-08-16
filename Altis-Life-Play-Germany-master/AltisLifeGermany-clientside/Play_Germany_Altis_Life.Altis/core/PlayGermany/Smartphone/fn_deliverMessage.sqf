#include <macro.h>
/*
File: fn_deliverMessage.sqf
Author: Felix 'Ithron' C.

This file is written for Play Germany.
Do not remove this comment or use this system without my permission.
 
Description:
Handles the message delivery / queueing to the recipient.
*/
private["_msg","_from","_fromName","_fromId","_msgType"];

_msg = [_this,0,"",[""]] call BIS_fnc_param;
_from = [_this, 1, objNull,[objNull]] call BIS_fnc_param;
_msgType = [_this,2,0,[0]] call BIS_fnc_param;

if (isNull _from) exitWith {
    diag_log "DEBUG fn_deliverMessage.sqf: _from is null";
};

_fromName = _from GVAR["realname",name _from];
_fromId = getPlayerUID _from;

if (_msg == "") exitWith {
    //diag_log "DEBUG: _msg is empty";
};

if(!("ItemRadio" in (assignedItems player))) exitWith
{
    hint "Da du kein Handy besitzt hast du eine Nachricht eines anderen Spielers verpasst.";
    [[1,"Die Nachricht konnte nicht zugestellt werden, da der Empfänger kein Smartphone hat."],"life_fnc_broadcast",_from,false] spawn life_fnc_MP;
};


if(!([] call PG_fnc_providerAvailable)) exitWith {
    hint "Da du keine SIM Karte besitzt hast du eine Nachricht eines anderen Spielers verpasst.";
    [[1,"Die Nachricht konnte nicht zugestellt werden, da der Empfänger keine SIM Karte hat."],"life_fnc_broadcast",_from,false] spawn life_fnc_MP;
};

// check connection state
tmp_networkAvailable = [] call PG_fnc_providerNetworkAvailable;

//diag_log format["DEBUG: tmp_networkAvailable: %1", tmp_networkAvailable];

if (!tmp_networkAvailable) then {
    //diag_log "DEBUG: wait for tmp_networkAvailable";
    
	while {!tmp_networkAvailable} do {
    	sleep 5;
    	tmp_networkAvailable = [] call PG_fnc_providerNetworkAvailable;
	};
    //diag_log "DEBUG: wait finished";
};

[_msg,_fromName,_fromId,_msgType] call PG_fnc_receiveMessage;