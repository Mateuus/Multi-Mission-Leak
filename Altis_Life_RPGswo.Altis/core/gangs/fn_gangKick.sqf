#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours...
*/
private["_unit","_unitID","_members"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint "Du musst jemanden zum Kicken auswählen!"};
_members = grpPlayer getVariable ["gang_members",[]];
_data = call compile format["%1",getSelData(2621)]; // [""76561197989745324"",""[MS-13] Forty Vogel"",0]
_isOwner = ((getPlayerUID player) == (grpPlayer getVariable ["gang_owner",""]));
_currentRank = 0;
_ownRank = 0;
_uid = (_data select 0);
_name = (_data select 1);
_currentRank = (_data select 2);
_isOnline = [_uid] call DWEV_fnc_isUIDActive;
_unit = objNull;

if(_uid == getPlayerUID player) exitWith {hint "Du kannst dich nicht selbst Kicken!"};

{
	if ((getPlayerUID player) IN _x) exitWith
	{
		_ownRank = (_x select 2);
	};
	false;
} count _members;

if (_ownRank < 2) exitWith {hint "Das Kicken von Spielern aus der Gang ist erst ab SERGEANT möglich"};

if ((_currentRank >= _ownRank) && !_isOwner) exitWith {_exit = true; _exitMessage = "Du kannst Spieler die deinen oder einen hoeheren Rang haben nicht entlassen";};

{
	if (_uid IN _x) exitWith {_members deleteAt _forEachIndex};
} forEach _members;

grpPlayer setVariable ["gang_members",_members,true];

if (_isOnline) then
{
	{
		if (_uid == (getPlayerUID _x)) exitWith {_unit = _x;};
	} count playableUnits; 
	
	[_unit,grpPlayer] remoteExec ["DWF_fnc_clientGangKick",_unit];	
};

[_uid] remoteExec ["DWF_fnc_leaveGang",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

hint format ["Du hast %1 aus der Gang entlassen",_name];

[] call DWEV_fnc_gangMenu;