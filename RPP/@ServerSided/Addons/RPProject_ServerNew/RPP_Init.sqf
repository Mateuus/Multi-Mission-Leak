#include "\RPProject_ServerNew\macros.hpp"
/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Init.sqf

Description:
Loading the server sided files and load them back to the client
*/

RPP_ServerNew_init = {
	RPP_SRV_READY = false;
	RPP_extDB_Error = "";
	publicVariable "RPP_SRV_READY";
	
	private ["_Functions","_folder","_sqf"];
	_Functions =
	[
		//Folder, Script file name

		//extDB
		["extDB","RPP_extDB"],
		["extDB","RPP_extDB_Loops"],
		["extDB","RPP_extDB_Police"],
		["extDB","RPP_extDB_Vehicle"],
		["extDB","RPP_extDB_House"],
		["extDB","RPP_extDB_Company"],
		["extDB","RPP_extDB_Gang"],

		//Housing
		["Housing","RPP_Housing_Cfg"],
		["Housing","RPP_Housing"],

		//Functions
		["Functions","RPP_Duty"]
	];

	_folder = "";
	_sqf = "";

	{
		_folder = _x select 0;
		_sqf = _x select 1;

		if (!(_folder == "")) then {
			[] execVM format ["\RPProject_ServerNew\%1\%2.sqf",_folder,_sqf];
		} else {
			[] execVM format ["\RPProject_ServerNew\%1.sqf",_sqf];
		};
	} foreach _Functions;

	diag_log "======================================";
	diag_log "======== RPProject_DB Loaded. ========";
	diag_log "============ By: Repentz ============";
	diag_log "======================================";

	if(isNil {uiNamespace getVariable "RPP_SQL_ID"}) then {
		RPP_SQL_ID = round(random(9999));
		CONSTVAR(RPP_SQL_ID);
		uiNamespace setVariable ["RPP_SQL_ID", RPP_SQL_ID];
		try {
			_result = "extDB2" callExtension format["9:ADD_DATABASE:%1",'RPP'];
			if(!(EQUAL(_result,"[1]"))) then {throw "extDB2: Error with Adding Database Connection"};
			_result = "extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:%2:SQL_RAW_V2:%1:ADD_QUOTES",call RPP_SQL_ID,'RPP'];
			if(!(EQUAL(_result,"[1]"))) then {throw "extDB2: Error with Database Protocol"};
		} catch {
			diag_log _exception;
			RPP_extDB_Error = [true, _exception];
		};
		publicVariable "RPP_extDB_Error";
		if(RPP_extDB_Error isEqualType []) exitWith {};
		"extDB2" callExtension "9:LOCK";
		diag_log "extDB2: Connected to Database";
	} else {
		RPP_SQL_ID = uiNamespace getVariable "RPP_SQL_ID";
		CONSTVAR(RPP_SQL_ID);
		diag_log "extDB2: Still Connected to Database";
	};

	if(RPP_extDB_Error isEqualType []) exitWith {};

	RPP_SRV_READY = true;
	publicVariable "RPP_SRV_READY";

	diag_log "======================================";
	diag_log "======================================";
};

[] call RPP_ServerNew_init;