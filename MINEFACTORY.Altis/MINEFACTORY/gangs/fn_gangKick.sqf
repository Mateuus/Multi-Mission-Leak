#include "..\..\script_macros.hpp"
/*
	File: fn_gangKick.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours...
*/
private["_unit","_unitID","_members"];
disableSerialization;

if(EQUAL((lbCurSel 2621),-1)) exitWith {hint  "Du musst einen Spieler auswählen, um ihn kicken zu können!"};
_unit = call compile format["%1",CONTROL_DATA(2621)];

if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint  "Du kannst dich nicht selbst kicken!"};

_unitID = getPlayerUID _unit;
_members = grpPlayer GVAR "gang_members";
if(isNil "_members") exitWith {};
if(!(EQUAL(typeName _members,"ARRAY"))) exitWith {};

SUB(_members,[_unitID]);
grpPlayer SVAR ["gang_members",_members,true];

[_unit,grpPlayer] remoteExec ["TON_fnc_clientGangKick",_unit]; //Boot that bitch!

if(life_HC_isActive) then {
	[4,grpPlayer] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
} else {
	[4,grpPlayer] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
};

[] call life_fnc_gangMenu;