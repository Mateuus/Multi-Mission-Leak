/*
    Darkside Life

	Author: ColinM9991

	Description:
	Freezes or unfreezes a player
*/

private ["_unit","_player","_targets"];

if((DS_adminLevel < 4)||(!((getPlayerUID player) in DS_adminList4)))exitWith{closeDialog 0;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};
if(_unit isEqualTo player)exitWith{hint "You can't freeze yourself"};

_player = (name player);

if(DS_frozen)then {
	{disableUserInput false;} remoteExec ["BIS_fnc_spawn",_unit];
	hint format ["You have unfrozen %1",_unit getVariable ["name",_unit]];
	DS_frozen = false;
	if(DS_adminLevel < 4)then {
		_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
		[_player,"Unfroze a player"] remoteExecCall ["DS_fnc_DarkSide_ShowAll",_targets];
	};
} else {
	{disableUserInput true;} remoteExec ["BIS_fnc_spawn",_unit];
	hint format ["You have frozen %1",_unit getVariable ["name",_unit]];
	DS_frozen = true;
	if(DS_adminLevel < 4)then {
		_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
		[_player,"Froze a player"] remoteExecCall ["DS_fnc_DarkSide_ShowAll",_targets];
	};
};