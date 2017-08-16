/*
	File: fn_arrestAction.sqf

	Description:
	Arrests the targeted person.
*/
private["_unit","_id","_time"];
_unit = param [0,ObjNull,[ObjNull]];
_time = param [1,30];
if(isNull _unit) exitWith {};
if(isNil "_unit") exitwith {};
if(!(_unit isKindOf "Man")) exitWith {};
if(!isPlayer _unit) exitWith {};
if(!(_unit getVariable "restrained")) exitWith {};
if(!((side _unit) in [civilian,independent])) exitWith {};
if(isNull _unit) exitWith {};
if(_time < 1) exitwith {};

[[getPlayerUID _unit,_unit,player,false],"life_fnc_wantedBounty",false,false] call life_fnc_MP;

if(isNull _unit) exitWith {};
detach _unit;
[[_unit,false,_time],"life_fnc_jail",_unit,false] call life_fnc_MP;
[[0,"STR_NOTF_Arrested_1",true, [_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",true,false] call life_fnc_MP;
