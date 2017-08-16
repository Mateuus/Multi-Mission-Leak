scriptName "fn_getTuningFromDB";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_getTuningFromDB.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_getTuningFromDB.sqf"

_vehicleID = param[0,-1,[-1]];
_vehicle = param[1,objNull,[objNull]];
_delay = param[2,0,[0]];
if (!isServer && hasInterface) exitWith {};
if (_vehicleID == -1) exitWith {};

sleep _delay;

_vehicle setVariable ["vehicleID",_vehicleID, true];

_query = format["SELECT tuning_data FROM vehicles WHERE id='%1'",_vehicleID];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

if (count _queryResult > 0) then {
	_result = _queryResult select 0;

	if (count _result > 0) then {
		_resultConverted = call compile ([false,(_result select 0)] call mav_tuning_fnc_tuning_prepareString);
		if (count _resultConverted == 0) then {
			[_vehicle] call mav_tuning_fnc_applyDefaults;
			_resultConverted = _vehicle getVariable ["mav_tuning",[]];
		};
		_vehicle setVariable ["mav_tuning", _resultConverted, true];
		[_resultConverted, _vehicle, 1] spawn mav_tuning_fnc_loadVehicleModification;
	};
};