#include "..\..\macros.hpp"
/*
	Author: Firly
	
	Description:
	Updatet Gangtag
*/
_tag = param[0,"",[""]];
_gangID = grpPlayer getVariable["gang_id",-1];

//Abfragen
_length = count (toArray(_tag));
_chrByte = toArray (_tag);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890-_.!");
if((_length < 2) || (_length > 5)) exitWith {hint "Es sind mindestens 2 und maximal 5 Zeichen erlaubt."};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {hint "Es sind nur Buchstaben und Zahlen und den Zeichen - _ . und ! erlaubt.";};


grpPlayer setVariable["gang_tag",_tag, true];
if (getMyTag != _tag) exitWith {hint "Fehler beim setzen des Gangtags!" };

[5,grpPlayer] remoteExec ["DWF_fnc_updateGang",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

//["Gib den neuen Clantag ein!", "DWEV_fnc_updateGangTag", ((group player) getVariable ["gang_tag","ERROR1"])] call DWEV_fnc_howMuch;