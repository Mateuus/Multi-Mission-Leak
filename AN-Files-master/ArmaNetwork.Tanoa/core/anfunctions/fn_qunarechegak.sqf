/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorObject;
if(isNull _unit) exitWith {};
if(isNil "_unit") exitWith {};
if(player distance _unit > 3) exitWith {};
if(_unit getVariable ["restrained",false]) exitWith {};
if(player isEqualTo _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
_unit setVariable["restrained",true,true];
_unit setVariable["restrainedtype","cop",true];
_unit setVariable["surrender",false,true];
detach player;
[player] remoteExecCall ["life_fnc_restrainCop",_unit];

//[0,format[localize "STR_NOTF_Restrained",_unit getVariable["realname", name _unit], profileName]] remoteExecCall ["life_fnc_brusathusek",west];
