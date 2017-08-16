scriptName "fn_loadPreview";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_loadPreview.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_loadPreview.sqf"

disableSerialization;

_ctrl = param[0,controlNull,[controlNull]];
_index = param[1,-1,[1]];

if (isNull _ctrl) exitWith {};
if (_index == -1) exitWith {};

_poolIndex = _ctrl lbValue _index;
_class = _ctrl lbData _index;

// Fake main data to adjust preview
_originalData = (vehicle player) getVariable ["mav_tuning",[]];
_originalDataCopy = +_originalData;
diag_log format ["orig %1", _originalDataCopy];
if (count _originalDataCopy < 1) exitWith {};

_masterConfig = [typeof (vehicle player)] call mav_tuning_fnc_getMasterConfig;

_subConfig = getArray(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _masterConfig >> _class >> "pool");
_subConfig = _subConfig select _poolIndex;
mav_tuning_previewData = nil;

if (_class == "RawModifications") exitWith {
	_toEdit = _originalDataCopy select 0;
	_toEdit set [_poolIndex, if ((_toEdit select _poolIndex) == 0) then {1} else {0}];
	_originalDataCopy set [0, _toEdit];
	[_originalDataCopy,vehicle player] spawn mav_tuning_fnc_loadVehicleModification;
	mav_tuning_previewData = _originalDataCopy;
};

if (_class == "Colors") exitWith {
	if (_subConfig != "RGB") then {
		_originalDataCopy set [1, getText(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _masterConfig >> _class >> _subConfig >> "texture")];
		_originalDataCopy set [5, getText(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _masterConfig >> _class >> _subConfig >> "material")];

		[_originalDataCopy,vehicle player] spawn mav_tuning_fnc_loadVehicleModification;
		mav_tuning_previewData = _originalDataCopy;
	} else {
		[(vehicle player) getVariable ["mav_tuning",[]], vehicle player] spawn mav_tuning_fnc_loadVehicleModification;
	};
};

if (_class == "Wheels") exitWith {
	if (_subConfig == "BulletProof") then {
		_originalDataCopy set [2, 1];
		mav_tuning_previewData = _originalDataCopy;
	};
};

if (_class == "Nitro") exitWith {
	_originalDataCopy set [3, getNumber(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _masterConfig >> _class >> _subConfig >> "timesUseable")];
	[_originalDataCopy,vehicle player] spawn mav_tuning_fnc_loadVehicleModification;
	mav_tuning_previewData = _originalDataCopy;
};

// This doesnt appear to be anything that needs loading, but lets load just so people cant exploit this
[(vehicle player) getVariable ["mav_tuning",[]], vehicle player] spawn mav_tuning_fnc_loadVehicleModification;