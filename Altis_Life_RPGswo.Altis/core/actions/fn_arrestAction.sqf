#include "..\..\macros.hpp"
/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id","_time"];
_unit = param [0,ObjNull,[ObjNull]];
_time = param [1,15];
if((player distance _unit > 3)) exitWith {};
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(side _unit != civilian) exitWith {hint "Du kannst Einsatzkräfte nicht einsperren. Sollte die Einsatzkraft etwas verbotenes getan haben, melde es bitte einen Admin!"}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid
if(_time < 1) exitwith {};

[_unit,player,false] remoteExec ["DWEV_fnc_wantedBounty", 2];

if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[_unit,false,_time] remoteExec ["DWEV_fnc_jail", _unit];

[0,"%1 wurde von %2 eingesperrt.",true, [getPlayerDName(_unit), getMyDName]] remoteExec ["DWEV_fnc_broadcast", -2];