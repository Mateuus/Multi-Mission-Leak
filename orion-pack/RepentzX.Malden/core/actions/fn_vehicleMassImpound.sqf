#include "..\..\script_macros.hpp"

{
	if (count (crew _x) < 1) then {
		_lastTime = _x getVariable ["",-1];
		if (_lastTime isEqualTo -1) exitWith {};
			_time = 20;
		if (_lastTime < (serverTime - _time)) then {
			[_x,true] remoteExecCall ["TON_fnc_serverVehicleStore",2];
		};
	};
} forEach ([0,0,0] nearEntities[['LandVehicle','Ship','Air','Tank'],1000000]);