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
if(life_knockout) exitWith {};
if(_target getvariable["out",true]) exitwith {hint "Give him a break";};

life_knockout = true;
sleep 0.08;
player playMoveNow "AwopPercMstpSgthWrflDnon_End2";
[_target,profileName] remoteExec ["life_fnc_vutatrunerer",_target];
sleep 3;
life_knockout = false;
