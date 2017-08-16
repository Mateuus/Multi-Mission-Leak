
/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Knocks out the target.
*/
private ["_knockOutSounds","_sound","_effect"];
_target = param [0,ObjNull,[ObjNull]];

//Error checks
if(isNull _target) exitWith {};
//if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};

lhm_knockout = true;

_effect = [["punch1"],["punch2"],["punch3"],["punch4"]] call BIS_fnc_selectRandom select 0;
[[player,_effect],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp;

[[player,"AwopPercMstpSgthWrflDnon_End2"],"lhm_fnc_animSync",nil,false] call lhm_fnc_mp;

sleep 0.08;

[[_target,profileName],"lhm_fnc_knockedOut",_target,false] call lhm_fnc_mp;

sleep 3;

lhm_knockout = false;