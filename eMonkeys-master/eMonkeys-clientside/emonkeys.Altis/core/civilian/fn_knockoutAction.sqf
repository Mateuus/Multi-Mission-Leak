/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Knocks out the target.
*/
private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
if(_target getVariable "onkill") exitWith {hint "Man tritt nicht auf schwerverletzte ein";};
eM_knockout = true;

_target say3D "Knockout";

[[player,"AwopPercMstpSgthWrflDnon_End2"],"EMonkeys_fnc_animSync",nil,false] call EMonkeys_fnc_mp;
uisleep 0.08;
[[_target,profileName],"EMonkeys_fnc_knockedOut",_target,false] call EMonkeys_fnc_mp;

uisleep 3;
eM_knockout = false;