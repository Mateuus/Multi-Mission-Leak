/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorObject;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
//if(side _unit == west) exitWith {}; // LHM
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

_unit setVariable["restrained",true,true];
[[player], "lhm_fnc_restrain", _unit, false] call lhm_fnc_mp;
[[player,"cuff"],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp; // LHM
[[0,"STR_NOTF_Restrained",true,[_unit getVariable["realname", name _unit], profileName]],"lhm_fnc_broadcast",west,false] call lhm_fnc_mp;
