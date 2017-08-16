/*
	File: fn_kickGang.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Removes the selected member from the gang
*/

private ["_display","_info","_uid","_active"];

if (life_gang_rank > 2) exitWith {hint "You are not high enough in rank to send an invitation.";};
disableSerialization;

_display = findDisplay 9620;
_info = lbData[9621,lbCurSel (9621)];
_info = call compile _info;
_uid = _info select 0;

_active = objNull;
{
	if(getPlayerUID _x == _uid) exitWith {_active = _x;};
} foreach allPlayers;

ctrlEnable [9622, false];
ctrlEnable [9624, false];
ctrlEnable [9625, false];
ctrlEnable [9630, false];

hint format["Removing player from the gang..."];
if (!isNull _active) then { [[],"life_fnc_leaveGang",_active,false] spawn life_fnc_MP; }
else { [[_uid,"0",3],"ASY_fnc_gangMember",false,false] spawn life_fnc_MP; };

sleep 2;

[false] spawn life_fnc_gangManagement;