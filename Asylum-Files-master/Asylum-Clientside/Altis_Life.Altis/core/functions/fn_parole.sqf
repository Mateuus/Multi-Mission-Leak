/*
	File: fn_parole.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Queries and begins parole
*/

_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

if (player getVariable ["parole",0] > 0) exitWith {};

_start = time;
_handle = [format["<t align='center'>Go on parole? Criminal action will allow your tracking.</t>", name _unit]] spawn life_fnc_confirmMenu;
waitUntil {scriptDone _handle || time - _start > 90};
if(!life_confirm_response) exitWith { [[[0,1,2], format["%1 refused parole", profileName]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP; };

[[[0,1,2], format["%1 accepted parole!", profileName]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
[[life_wanted,life_wanted],"life_fnc_bountyReceive",_unit,false] call life_fnc_MP;
serv_wanted_remove = [player];
publicVariableServer "serv_wanted_remove";
[[0,1], "You are now on parole! Parole lasts one hour and any criminal action will alert police and activate your tracking bracelet. A parole violation is an automatic maximum prison sentance. You behave!"] call life_fnc_broadcast;

sleep 4;
player setVariable ["parole", time + (60 * 60), true];
player setVariable ["paroleViolated", false, true];
[] call life_fnc_hudUpdate;