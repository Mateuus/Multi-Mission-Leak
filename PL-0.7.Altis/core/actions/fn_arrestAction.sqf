#include "..\..\script_macros.hpp"

/*---------------------------------------------------------------------------
	File: fn_arrestAction.sqf
---------------------------------------------------------------------------*/

params [
	["_unit", objNull, [objNull]]
];

_time = param [1,30]; //das ist auch neu!
if (isNull _unit) exitWith {}; //Not valid
if (isNil "_unit") exitWith {}; //Not Valid
if (!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if (!isPlayer _unit) exitWith {}; //Not a human
if (!(_unit getVariable "restrained")) exitWith {};
if (!((side _unit) in [civilian,independent,east])) exitWith {};
if (isNull _unit) exitWith {};
if(_time < 1) exitwith {};
if (isNull _unit) exitWith {};
detach _unit;
[_unit,false,_time] remoteExecCall ["life_fnc_jail",_unit];

_playerID = getPlayerUID player;
_playerName = name player;
_byPlayerID = getPlayerUID _unit;
_byPlayerName = name _unit;
_type = 3;
[_playerID,_playerName,_byPlayerID,_byPlayerName,_type,""] remoteExecCall ["TON_fnc_copLog", (call life_fnc_HCC)];

[0,"STR_NOTF_Arrested_1",true, [_unit getVariable ["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];