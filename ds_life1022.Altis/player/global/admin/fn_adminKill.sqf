/*
    Darkside Life

	Author: ColinM9991

	Description:
	Force kills a player
*/

private ["_unit","_player","_action","_targets"];

if((DS_adminLevel < 4)||(!((getPlayerUID player) in DS_adminList4)))exitWith{closeDialog 0;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};

_player = (name player);

[] remoteExec ["DS_fnc_adminKillPlayer",_unit];
if(DS_adminLevel < 4)then {
	_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
	[_player,"Script Kill"] remoteExecCall ["DS_fnc_DarkSide_ShowAll",_targets];
};