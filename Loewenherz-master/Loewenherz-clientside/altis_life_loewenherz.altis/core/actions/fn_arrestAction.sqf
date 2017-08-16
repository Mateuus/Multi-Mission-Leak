/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(!((side _unit) in [civilian,independent])) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid


[[_unit,player,false],"lhm_fnc_wantedBounty",false,false] call lhm_fnc_mp;

if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[[_unit,false],"lhm_fnc_jail",_unit,false] call lhm_fnc_mp;
[[0,"STR_NOTF_Arrested_1",true, [_unit getVariable["realname",name _unit], profileName]],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;