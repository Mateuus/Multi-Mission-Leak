/*
	@version: 2.0
	@file_name: fn_mainInit.sqf
	@file_author: TAW_Tonic
	@file_edit: 9/24/2013
	@file_description: Only called once during the initialization of VAS and uses compileFinal on all VAS functions.
*/
if(isServer) exitWith {};

[] spawn
{
waitUntil {!isNil "LHM_initDone";};
waitUntil{Sleep 2;LHM_initDone};
	if(isNil "VAS_init_complete") then
	{
		private["_handle","_path"];
		VAS_init_timeOnStart = time;
		VAS_init_complete = false;
		waitUntil {!isnil "lhm_adminPath";};
		_path = (lhm_adminPath + "Admin_Menu_scripts\VAS\config.sqf");
		_handle = [] execVM _path;
		waitUntil {!isnil "VAS_pre_weapons_pistols";};
		if(isNil "VAS_fnc_buildConfig") exitWith {diag_log "::VAS:: function VAS_fnc_buildConfig is nil"};
		["CfgWeapons"] call VAS_fnc_buildConfig;
		["CfgMagazines"] call VAS_fnc_buildConfig;
		["CfgVehicles"] call VAS_fnc_buildConfig;
		["CfgGlasses"] call VAS_fnc_buildConfig;
		VAS_init_complete = true;
	}
		else
	{
		VAS_init_timeOnStart = time;
		[] call compile PreprocessFileLineNumbers (lhm_adminPath + "Admin_Menu_scripts\VAS\config.sqf");
		["CfgWeapons"] call VAS_fnc_buildConfig;
		["CfgMagazines"] call VAS_fnc_buildConfig;
		["CfgVehicles"] call VAS_fnc_buildConfig;
		["CfgGlasses"] call VAS_fnc_buildConfig;

		sleep 2.5;
		if(!isNil "vas_r_weapons") then { VAS_init_complete = true; };
	};

};