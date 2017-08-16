scriptName "_master";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: _master.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "_master.sqf"

#include "_config.sqf"

// -- Disable serialization
disableSerialization;

try {
	// -- Parameters
	params [
		["_parameters", [displayNull], [[]]],
		["_mode", "", [""]]
	];

	// -- Evaluate if valid parameters are passed
	if (count _parameters < 1) throw "Not enough parameters given";

	// -- Display or control
	private _caller = _parameters select 0;
	private _display = displayNull;

	switch (typeName _caller) do
	{
		case "DISPLAY":
		{
			["Control was DISPLAY"] call BIS_fnc_log;
			_display = _caller;
		};

		case "CONTROL": {
			["Control was CONTROL"] call BIS_fnc_log;
			_display = ctrlParent _caller;
		};

		default
		{
			throw "Caller isn't display or control";
		};
	};

	// -- No display found
	if (_display == displayNull) throw "Assosiated display cannot be found";

	// -- Fetch IDC
	private _iddString = [str _display, ((str _display) find "#") + 1] call BIS_fnc_trimString;

	// -- Get all configs
	private _configsOfDialogs = ( format ["((configName _x) find '%1' == 0)", _dialogPrefix]) configClasses missionConfigFile;
	_configsOfDialogs append (( format ["((configName _x) find '%1' == 0)", _dialogPrefix]) configClasses (missionConfigFile >> "RscTitles"));

	// -- Fetch config name of corresponding IDC
	private _configName = "";
	{
		if (str (getNumber (_x >> "IDD")) == _iddString) then {
			_configName = configName _x;
		};
	} forEach _configsOfDialogs;

	if (_configName == "") throw "Config name of display could not be found";

	["GUI event request found to be executed in config " + _configName + " with IDD " + _iddString + " in dialog master script file " + format ["%1_script", _configName]] call BIS_fnc_log;

	// -- Execute master file
	[_mode, _parameters, _display] spawn (missionNamespace getVariable [format ["%1_script", _configName], {}]);
} catch {
	[format ["[%1] %2", __filename, _exception]] call BIS_fnc_error;
};