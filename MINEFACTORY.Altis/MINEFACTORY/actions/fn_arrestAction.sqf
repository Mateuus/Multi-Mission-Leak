#include "..\..\script_macros.hpp"
/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id","_time"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_time = [_this,1,30] call BIS_fnc_param;

if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(side _unit != civilian) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid
if(_time < 1) exitwith {}; //Not Valid


[getPlayerUID _unit,_unit,player,false] remoteExecCall ["HC_fnc_wantedBounty",HC_Life];

if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[_unit,false,_time] remoteExec ["life_fnc_jail",_unit];
[0,format[( "%1 wurde von %2 verhaftet"), _unit getVariable["realname",name _unit], profileName]] remoteExec ["life_fnc_broadcast",RCLIENT];
