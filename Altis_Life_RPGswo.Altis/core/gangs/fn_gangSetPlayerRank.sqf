#include "..\..\macros.hpp"
/*
	Author: Division Wolf e.V. (MarkusSR1984)
	
	Description:
	Funktion zum Befördern und Degradieren von Gang Mitgliedern
*/
private["_unit","_unitID","_members"];
disableSerialization;

_increaseRank = param [0,true,[false]];
_currentRank = 0;
_newRank = 0;
_exit = false;
_exitMessage = "";
_ownRank = 0;
_isOwner = ((getPlayerUID player) == (grpPlayer getVariable "gang_owner"));
_gangID = grpPlayer getVariable["gang_id",-1];

if((lbCurSel 2621) == -1) exitWith {hint "Du musst den Spieler auswählen dessen Rang du verändern willst"};

_members = grpPlayer getVariable "gang_members";
_data = call compile format["%1",getSelData(2621)];

_uid = (_data select 0);

if (_uid == (grpPlayer getVariable "gang_owner")) exitWith {hint "Der Rang des Gangleaders kann nicht verändert werden"};

_isOnline = [_uid] call DWEV_fnc_isUIDActive;
_unit = objNull;

if(_uid == getPlayerUID player) exitWith {hint "Du kannst deinen Rang nicht selbst ändern!"};


{
	if ((getPlayerUID player) IN _x) exitWith
	{
		_ownRank = (_x select 2);
	};
	false;
} count _members;


{
	if (_uid IN _x) exitWith
	{
			_currentRank = (_x select 2);
			_newRank = (if (_increaseRank) then {_currentRank + 1} else {_currentRank - 1});
			if (_newRank < 0) then {_newRank = 0;};
			if (_newRank > 6) then {_newRank = 6;};

			if ((_currentRank >= _ownRank) && !_increaseRank  && !_isOwner) exitWith {_exit = true; _exitMessage = "Du kannst Spieler die deinen oder einen hoeheren Rang haben nicht degradieren";};
			if ((_newRank >= _ownRank) && _increaseRank && !_isOwner) exitWith {_exit = true; _exitMessage = "Du kannst Spieler maximal bis einen Rang unter deinem befoerdern";};
		
			_x set [2,_newRank];
	};
	

	false;
} count _members;

if (_exit) exitWith {hint _exitMessage;};

grpPlayer setVariable ["gang_members",_members,true];

[_uid,_gangID,_newRank] remoteExec ["DWF_fnc_setPlayerGangRank",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

if (_isOnline) then 
{
	{
		if (_uid == (getPlayerUID _x)) exitWith {_unit = _x;};
	} count playableUnits; 
	
	_unit setUnitRank ([_newRank] call DWEV_fnc_convertArmaRank);
	
	_text = (if (_increaseRank) then {format ["Du wurdest befördert und bist nun %1", ([_newRank] call DWEV_fnc_convertArmaRank)]} else {format ["Du wurdest degradiert und bist nun %1", ([_newRank] call DWEV_fnc_convertArmaRank)]});
	_text remoteExec ["hint",_unit];
};

[] call DWEV_fnc_gangMenu;