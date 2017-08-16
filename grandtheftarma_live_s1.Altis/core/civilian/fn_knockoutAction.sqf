/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Knocks out the target.
*/
private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call GTA_fnc_param;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
life_knockout = true;
[[player,"AwopPercMstpSgthWrflDnon_End2"],"life_fnc_animSync",nil,false] call GTA_fnc_remoteExec;
sleep 0.08;
[[_target,profileName],"life_fnc_knockedOut",_target,false] call GTA_fnc_remoteExec;

//--- Add fatigue
player setFatigue ( getFatigue player + 0.3 );

sleep 3;
life_knockout = false;
