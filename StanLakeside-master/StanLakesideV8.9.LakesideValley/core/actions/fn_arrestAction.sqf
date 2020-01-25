/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNil "_unit") exitwith {}; //Not Valid
if(isNull _unit) exitWith {}; //Not valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable ["restrained", false])) exitWith {}; //He's not restrained.
if(!((side _unit) in [civilian,east,independent])) exitWith {}; //Not a civ

[_unit,player,false] remoteExecCall ["life_fnc_wantedBounty",2];

detach _unit;
[_unit,false] remoteExec ["life_fnc_jail",_unit];
closeDialog 0;
