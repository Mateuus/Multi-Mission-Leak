#include "..\..\script_macros.hpp"
/*
	Author: Kajetan "Kruk" Mruk
	

	Description:
	Execute received remote execution

	Parameter(s):
	_this select 0: STRING - Packet variable name (always "life_fnc_MP_packet")
	_this select 1: ARRAY - Packet value (sent by life_fnc_MP function; see it's description for more details)
	
	Returns:
	BOOL - true if function was executed successfully
*/
_target = _this select 0;
if(isNil "_target") exitWith {};
if(isNull _target) exitWith {};
_ret = [];
_licensesConfigs = "getText(_x >> 'side') isEqualTo 'civ'" configClasses (missionConfigFile >> "Licenses");

{
	_ret pushBack [configName _x,LICENSE_VALUE(configName _x,"civ")];
} foreach _licensesConfigs;
[player,_ret] remoteExecCall ["life_fnc_getLicenses",_target];