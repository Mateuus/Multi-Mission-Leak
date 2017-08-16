/*
	File: fn_searchVehAction.sqf
*/
private["_vehicle","_data"];
_vehicle = cursorObject;
if((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship") || !(_vehicle isKindOf "Tank")) then {
	_purpose = _vehicle getVariable["purpose",""];
	if(_purpose isEqualTo "truck_mission") then {
		_type = _vehicle getVariable["type","legal"];
		_driver = _vehicle getVariable["driver","Anonymous"];
		if(_type isEqualTo "illegal") then {
			hintSilent format[localize "STR_NOTF_TruckIll",_driver];
		} else {
			hintSilent format[localize "STR_NOTF_TruckLeg",_driver];
		};
	} else {
		_owners = _vehicle getVariable "vehicle_info_owners";
		if(isNil {_owners}) exitWith {hintSilent localize "STR_NOTF_VehCheat"; deleteVehicle _vehicle;};
		life_action_inUse = true;
		hintSilent localize "STR_NOTF_Searching";
		life_action_inUse = false;
		if(player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {hintSilent localize "STR_NOTF_SearchVehFail";};
		_owners = [_owners] call life_fnc_vehicleOwners;
		if(_owners isEqualTo "any<br/>") then {
			_owners = "No owners, impound it<br/>";
		};
		hintSilent parseText format[localize "STR_NOTF_SearchVeh",_owners];
	};
};
