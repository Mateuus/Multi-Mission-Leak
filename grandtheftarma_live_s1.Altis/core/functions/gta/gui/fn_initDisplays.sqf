/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if ( !hasInterface ) exitWith {};

{

	{

		if ( getNumber ( _x >> "scriptIsInternal" ) == 0 ) then {

			private [ "_scriptName", "_scriptPath", "_fileName" ];
			_scriptName = getText ( _x >> "scriptName" );
			_scriptPath = getText ( _x >> "scriptPath" );
			if ( _scriptName == "" ) then { _scriptName = configName _x; };
			if ( _scriptPath == "" ) then { _scriptName = "GUI"; };

			//--- Filename (remove GTA prefix for compile)
			_fileName = _scriptName;
			if ( _fileName find "GTA_" > -1 ) then { _fileName = [ _fileName, 4 ] call BIS_fnc_trimString };

			//--- Compile
			missionNamespace setVariable [
				_scriptName + "_script",
				compileFinal (
					format [
						"scriptName '%1'; _fnc_scriptName = '%1';",
						_scriptName
					]
					+
					preprocessFileLineNumbers format [ "%1%2.sqf", getText ( missionConfigFile >> "GTA_CfgScriptPaths" >> _scriptPath ), _fileName ]
				)
			];

		};

	} foreach ( configProperties [ _x, "isClass _x && { isText ( _x >> 'scriptPath' ) }" ] );

} foreach [
	missionConfigFile,
	missionConfigFile >> "RscTitles"
];

true
