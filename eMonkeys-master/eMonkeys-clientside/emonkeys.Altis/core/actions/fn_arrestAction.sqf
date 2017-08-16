/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id","_time"]; // <-- Replace The Original Line With This
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_time = [_this,1,15] call BIS_fnc_param; //Default jail time 15 <-- Add This Line!

if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(!(side _unit in [east,civilian])) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid
if(_time < 1) exitwith {}; //Not Valid

[[_unit,player,false],"EMonkeys_fnc_wantedBounty",false,false] call EMonkeys_fnc_mp;

if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[[_unit,false,_time],"EMonkeys_fnc_jail",_unit,false] call EMonkeys_fnc_mp; //  <-- Add This Line!
[[0,format["%1 wurde von %2 verhaftet!", _unit getVariable["realname",name _unit], profileName]],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp;