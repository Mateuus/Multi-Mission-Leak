#include "\hst_life_core\script_macros.hpp"
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
_visaID = _this select 1;
if(isNil "_target" || isNil "_visaID") exitWith {};
if(isNull _target || _visaID < 0) exitWith {};
if(isNil "hst_life_core_idCards") exitWith {};
_array = [];
{
	if(_visaID == _x select 0) exitWith {
		_array = _x;
		hst_life_core_idCards set [_forEachIndex, -1];
	};
} forEach hst_life_core_idCards;
if(count _array != 0) then {
	hst_life_core_idCards = hst_life_core_idCards - [-1];
	[_target, _array] remoteExec ["hst_life_core_fnc_visaGet", -2];
};