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
if(side _unit == independent || side _unit == west) exitWith {};
if(isNull _unit) exitWith {}; //Not valid
if(_time < 1) exitwith {}; //Not Valid

[_unit,player,false] remoteExec ["tanoarpg_fnc_wantedBounty", 2, false];

if(isNull _unit) exitWith {systemChat "isNull _unit"}; //Not valid
detach _unit;

[_unit,false,_time] remoteExec ["tanoarpg_fnc_jail", _unit, false];

//Log it
[player, _unit, 3, "[ARRESTED]", "Spieler festgenommen"] remoteExec ["TEX_FNC_LOGIT", 2];
[0,format[(localize "STR_NOTF_Arrested_1"), _unit getVariable["realname",name _unit], profileName]] remoteExec ["tanoarpg_fnc_broadcast", -2, false];