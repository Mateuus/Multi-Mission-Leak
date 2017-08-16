#include "..\script_macros.hpp"
/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Knocks out the target.
*/
private "_target";
_target = param [0,ObjNull,[ObjNull]];

if(_target distance (getMarkerPos "Safe_Kav") < 200 ) exitWith {hint "In einer SafeZone kanst du keine Leute ausrauben";};
if(_target distance (getMarkerPos "Safe_Reb") < 200 ) exitWith {hint "In einer SafeZone kanst du keine Leute ausrauben";};
if(_target distance (getMarkerPos "Safe_Reb_1") < 200 ) exitWith {hint "In einer SafeZone kanst du keine Leute ausrauben";};
if(_target distance (getMarkerPos "Safe_Schwarzmarkt") < 200 ) exitWith {hint "In einer SafeZone kanst du keine Leute ausrauben";};
if(_target distance (getMarkerPos "Event_Admin") < 250 ) exitWith {hint "In einer SafeZone kanst du keine Leute ausrauben";};


//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
ES_knockout = true;
[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExec ["ES_fnc_animSync",0];
sleep 0.08;
[_target,profileName] remoteExec ["ES_fnc_knockedOut",_target];

sleep 3;
ES_knockout = false;