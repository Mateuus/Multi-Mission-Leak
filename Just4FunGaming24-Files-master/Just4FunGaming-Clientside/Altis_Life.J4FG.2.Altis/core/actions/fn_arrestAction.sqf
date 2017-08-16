/*
    File: fn_arrestAction.sqf

    Description:
    Arrests the targeted person.
*/
private["_unit","_id","_time"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_time = [_this,1,15] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(side _unit != civilian) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid
if(_time < 5 || _time > 60) exitwith {};
if(isNull _unit) exitWith {}; //Not valid
detach _unit;

[_unit, _time] remoteExec ["XY_fnc_jail", _unit];
[_unit, player] remoteExec ["XY_fnc_wantedBounty", 2];

[0, format[localize "STR_NOTF_Arrested_1", _unit getVariable["realName", name _unit], profileName]] remoteExec [ "XY_fnc_broadcast" ];