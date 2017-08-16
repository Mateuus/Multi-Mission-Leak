/*
	Filename: init_lhm_admin.sqf

	Author: Blackd0g
*/

// Condition to wait till session is loaded //
waitUntil {!isNil "lhm_session_completed" and !(isNull (findDisplay 46))};

// Check for Adminstatus
if((call lhm_adminlevel) > 0) then {

	/*
		Setup Admin Variables
	*/
	debugMonitor = false;
	player_isAdmin = false;
	lhm_adminPath = "addons\admin_menu\";
	serverFPS = 0;
	fnc_adminKeyHandler = compile preprocessFileLineNumbers (lhm_adminPath + "adminKeyHandler.sqf");

	[] call VAS_fnc_mainInit;
	[] call VVS_fnc_mainInit;

	// Start Main Thread
	(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call fnc_adminKeyHandler"];
	diag_log "::LHM Client:: Admin Stuff loaded";
};


