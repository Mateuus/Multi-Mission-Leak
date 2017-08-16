/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Knocks someone out
*/

private["_victim","_targets"];
_victim = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if(((player inArea "safezone")||(player inArea "safezone_1"))&&(playerSide isEqualTo civilian))exitwith{hint "You cant knock somebody out in a safezone";};
if(isNull _victim) exitWith {};
if(player getVariable ["surrender",false])exitwith{};
if(!isPlayer _victim) exitWith {};
if(player distance _victim > 4) exitWith {};
DS_knockout = true;

_targets = allPlayers select {(_x distance player) < 200};
[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExecCall ["DS_fnc_animSync",_targets];

sleep 0.08;
if((random 6) > 3)then {
	_targets = allPlayers select {(_x distance player) < 50};
	[player,"punch"] remoteExecCall ["DS_fnc_playSounds",_targets];
} else {
	player say3D "punch";
};

[_victim,player getVariable["name",name player]] remoteExec ["DS_fnc_koed",_victim];
[10,false] spawn DS_fnc_moralAlter;
sleep 3;
DS_knockout = false;

if((DS_infoArray select 15) == 2)then { [1] call DS_fnc_questCompleted };