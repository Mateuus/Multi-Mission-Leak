#include "..\script_macros.hpp"
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

[_unit,player,false] remoteExec ["ES_fnc_wantedBounty",2];

if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[_unit,false] remoteExec ["ES_fnc_jail",_unit];
[0,"STR_NOTF_Arrested_1",true, [_unit getVariable ["realname",name _unit], profileName]] remoteExec ["ES_fnc_broadcast",-2];

["Verhaften"] call ES_fnc_xp_add;

_toLog = format ["Name: %1 (%2) hat Spieler: %3 (%4) ins Gefängnis gesteckt", player getVariable["realname",name player], getPlayerUID player, _unit getVariable["realname",name _unit], getPlayerUID _unit];
["JAIL_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];