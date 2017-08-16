#include "..\..\macros.hpp"
/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag","_varName","_Lflag"];
if ((player getVariable["DWEV_paintball_dome",false]) || (player getVariable["DWEV_paintball_arena",false])) exitWith {diag_log "Speichern in der Paintball Arena nicht erlaubt";};
	


_packet = [getPlayerUID player,(getMyName),(side player),dwf_cash,dwf_atmcash];

_array = [];
_flag = switch((side player)) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"WSC"};};
_Lflag = switch((side player)) do {case west: {"p"}; case civilian: {"c"}; case independent: {"m"}; case east: {"w"};};

{
			_var = configName(_x);
			_val = LICENSE_VALUE(_var,_Lflag);
			if (_val) then
			{
				_varName = LICENSE_VARNAME(_var,_Lflag);
				_array pushBack [_varName,_val];
			};
        } forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));


_packet pushBack _array;
[] call DWEV_fnc_saveGear;
_packet pushBack DWEV_gear;

switch ((side player)) do 
{
	case civilian: 
	{
		_packet pushBack DWEV_is_arrested;
	};
};


_packet remoteExec ["DB_fnc_updateRequest",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
