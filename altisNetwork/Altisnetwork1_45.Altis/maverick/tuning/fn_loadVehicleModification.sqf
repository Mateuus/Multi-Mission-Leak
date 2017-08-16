scriptName "fn_loadVehicleModification";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_loadVehicleModification.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_loadVehicleModification.sqf"

_data = param[0,[],[[]]];
_veh = param[1,objNull,[objNull]];
_delay = param[2,0,[0]];
_type = typeOf _veh;

if (count _data < 1) exitWith {};

diag_log str _data;

sleep _delay;

_masterConfig = [_type] call mav_tuning_fnc_getMasterConfig;

if (_masterConfig != "") then {
	// Raw
	_rawPool = getArray(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _masterConfig >> "RawModifications" >> "pool");
	if (count _rawPool > 0) then {
		{
			_animationPhase = (_data select 0) select _forEachIndex;
			_config = _x;
			_parts = getArray(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _masterConfig >> "RawModifications" >> _config >> "parts");
			{
				_veh animate [_x, _animationPhase];
			} forEach _parts;
		//} forEach (_data select 0); // old bottom header
		} forEach _rawPool;
	};

	// Color
	_veh setObjectTextureGlobal [0, (_data select 1)];

	// Material
	_mat = _data param [5, "maverick\tuning\bin\materials\default.rvmat", [""]];
	_veh setObjectMaterialGlobal [0, _mat];
};