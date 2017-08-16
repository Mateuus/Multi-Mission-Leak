/*
	File: fn_arrestAction.sqf

	Description:
	Arrests the targeted person.
*/
private["_unit","_id","_time"];
_unit = param [0,ObjNull,[ObjNull]];
_time = param [1,30,[0]];
_arrestReason = param [2,"",[""]];
if(isNull _unit) exitWith {};
if(isNil "_unit") exitwith {};
if(!(_unit isKindOf "Man")) exitWith {};
if(!isPlayer _unit) exitWith {};
if(!(_unit getVariable "restrained")) exitWith {};
if(!((side _unit) in [civilian,independent])) exitWith {};
if(_time < 1) exitwith {};
[getPlayerUID _unit,_unit,player,false] remoteExecCall ["life_fnc_wantedBounty",2];
if(isNull _unit) exitWith {};
detach _unit;
_unit setVariable ["restrained",false,true];
[_unit,(getPlayerUID _unit),_time,_arrestReason] remoteExecCall ["life_fnc_jailSys",2];
[0,format[localize "STR_NOTF_Arrested_1",_unit getVariable["realname", name _unit], profileName]] remoteExecCall ["life_fnc_brusathusek",west];

//hint "Due to being jailed your locker inventory has been seized and destroyed";
[0,LockerInventory,(getPlayerUID _unit)] remoteExecCall ["life_fnc_lockerUpdate",2];
