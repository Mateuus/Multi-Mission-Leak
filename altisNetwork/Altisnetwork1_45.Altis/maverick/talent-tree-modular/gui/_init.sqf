scriptName "_init";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: _init.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "_init.sqf"

#include "_config.sqf"

// -- Disable serialization
disableSerialization;

// -- Vars
private _configs = ( format ["((configName _x) find '%1' == 0)", _dialogPrefix]) configClasses missionConfigFile;
_configs append (( format ["((configName _x) find '%1' == 0)", _dialogPrefix]) configClasses (missionConfigFile >> "RscTitles"));

// -- Register master script
missionNamespace setVariable [
	format ["%1_master_script", _dialogPrefix],
	compile preprocessFileLineNumbers "maverick\talent-tree-modular\gui\_master.sqf"
];

// -- Cycle through all configs
{
	try {
		// -- Dialog script location
		private _scriptLocation = getText (_x >> "scriptPath");
		if (_scriptLocation == "") throw format ["Dialog %1 does not implement scriptPath", configName _x];

		// -- Load script
		private _dialogScriptAsString = preprocessFileLineNumbers _scriptLocation;

		// -- Save in missionnamespace
		missionNamespace setVariable [
			format ["%1_script", configName _x],
			compileFinal _dialogScriptAsString
		];

		// -- Log
		[format ["[%1] %2", __filename, "GUI script registered on variable " + format ["%1_script", configName _x]]] call BIS_fnc_log;
	} catch {
		[format ["[%1] %2", __filename, _exception]] call BIS_fnc_error;
	};
} forEach _configs;

// -- Cycle through all precompiled functions
{
	try {
		// -- Function name and location
		_functionLocation = _x select 0;
		_functionName = _x select 1;

		// -- Load script
		private _functionText = preprocessFileLineNumbers _functionLocation;

		// -- Precompile
		missionNamespace setVariable [
			_functionName,
			compile _functionText
		];
	} catch {
		[format ["[%1] %2", __filename, _exception]] call BIS_fnc_error;
	};
} forEach _functionsPrecompiled;