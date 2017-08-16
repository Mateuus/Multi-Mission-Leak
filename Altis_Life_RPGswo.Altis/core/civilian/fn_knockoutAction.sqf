#include "..\..\macros.hpp"
/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Knocks out the target.
*/
private["_target"];
_target = param [0,ObjNull,[ObjNull]];

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};

DWEV_knockout = true;

[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExec ["DWEV_fnc_animSync",-2];

sleep 0.08;
[_target,getMyDName] remoteExec ["DWEV_fnc_knockedOut",_target];

sleep 3;
DWEV_knockout = false;