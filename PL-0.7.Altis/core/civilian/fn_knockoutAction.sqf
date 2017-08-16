#include "..\..\script_macros.hpp"
/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Knocks out the target.
*/
private "_target";
_target = param [0,ObjNull,[ObjNull]];

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
life_knockout = true;
[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExecCall ["life_fnc_animSync",RCLIENT];
player say3D "ko";
sleep 0.08;
[_target,profileName] remoteExec ["life_fnc_knockedOut",_target];


_playerID = getPlayerUID player;
_playerName = name player;
_onPlayerID = getPlayerUID _target;
_onPlayerName = name _target;
_type = 6;
[_playerID,_playerName,_onPlayerID,_onPlayerName,_type,""] remoteExecCall ["TON_fnc_actionLog", (call life_fnc_HCC)];

sleep 3;
life_knockout = false;
