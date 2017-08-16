/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991

	Description:
	Teleport selected player to you.
*/

private ["_unit","_player","_targets"];

if((DS_adminLevel < 4)||(!((getPlayerUID player) in DS_adminList4)))exitWith{closeDialog 0;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};
if(_unit isEqualTo player)exitWith{hint "You can't teleport yourself"};
_player = (name player);

_unit setPos (getPos player);

hint format ["You have teleported %1 to your location",_unit getVariable ["name",name _unit]];

_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
[_player,"Teleport Player"] remoteExecCall ["DS_fnc_DarkSide_ShowAll",_targets];