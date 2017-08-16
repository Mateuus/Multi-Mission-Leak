/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Admin.sqf

Description:
admin menu
*/
["RPP_Admin_Commands", {
	RPP_AdminCommands =
	[
		["Teleport","[] call RPP_Admin_Teleport;"],
		["Spawn 50,000$","[] call RPP_Admin_SpawnCash;"],
		["Show Server FPS (ON/OFF)","[] call RPP_Admin_Go_ShowFPS;"],
		["Recompile Server (FOR TESTING ONLY)","[] call RPP_Admin_RecompileS;"],
		["Add Driver License","[] call RPP_Admin_DriverLicenses;"],
		["Repair","[] call RPP_Admin_Repair"],
		["Self Heal","[] call RPP_Admin_Heal"],
		["Vehicle Global Repair","[] call RPP_Admin_GlobalRepair"],
		["Force Server Saving","[] call RPP_Admin_GlobalSave"]
	];
	publicVariable "RPP_AdminCommands";
}] call RPP_Function;
publicVariable "RPP_Admin_Commands";

[] call RPP_Admin_Commands;

["RPP_Admin_OpenDialog", {
	createDialog "RPP_AdminMenu";
	buttonSetAction [1600, "[] call RPP_Admin_Process;"];
	buttonSetAction [1601, "[] call RPP_Admin_Command;"];

	{
		lbAdd [1500, format ["%1",_x select 0]];
	} foreach RPP_AdminCommands;
}] call RPP_Function;
publicVariable "RPP_Admin_OpenDialog";

["RPP_Admin_Command", {
	private ["_Code"];
	_Code = ctrlText 1400;
	if (_Code isEqualTo "") exitWith {
		_msg = "Please Type in a code.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	call compile format ["%1",_Code];
}] call RPP_Function;
publicVariable "RPP_Admin_Command";

["RPP_Admin_Process", {
	private ["_Array","_call"];
	if (lbCurSel 1500 isEqualTo -1) exitWith {
		_msg = "Please select a command.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_Array = RPP_AdminCommands select (lbCurSel 1500);
	_call = _Array select 1;

	if (_call isEqualTo "") exitWith {
		_msg = "Still a work in progress.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	call compile format ["%1",_call];
}] call RPP_Function;
publicVariable "RPP_Admin_Process";

["RPP_Admin_Go_ShowFPS", {
	if (!(RPP_Admin_ShowFPS)) then {
		RPP_Admin_ShowFPS = true;
		[] call RPP_Admin_Return_FPS;
	} else {
		RPP_Admin_ShowFPS = false;
	};
}] call RPP_Function;
publicVariable "RPP_Admin_Go_ShowFPS";

["RPP_Admin_Server_GetFPS", {
	private ["_p","_fps"];
	_p = _this select 0;
	_fps = round diag_fps;
	[[_fps], "RPP_Admin_Client_GetFPS",_p] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_Admin_Server_GetFPS";

["RPP_Admin_Return_FPS", {
	[] spawn {
		while {RPP_Admin_ShowFPS} do {
			[[player], "RPP_Admin_Server_GetFPS", false] call BIS_FNC_MP;
			sleep 1;
		};
	};
}] call RPP_Function;
publicVariable "RPP_Admin_Return_FPS";

["RPP_Admin_Client_GetFPS", {
	private ["_fps"];
	_fps = _this select 0;
	hintSilent format ["Server FPS: %1",_fps];
}] call RPP_Function;
publicVariable "RPP_Admin_Client_GetFPS";

["RPP_Admin_Teleport", {
	_msg = "Click on your map where you want to Teleport to!";
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
	onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true;";
}] call RPP_Function;
publicVariable "RPP_Admin_Teleport";

["RPP_Admin_SpawnCash", {
	private ["_amount"];
	_amount = 50000;
	[_amount] call RPP_AntiCheat_AddMoney;
	_msg = "50,000$ Added into your inventory.";
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Admin_SpawnCash";

["RPP_Admin_RecompileS", {
	[] call RPP_Server_init;
	_msg = "Server is now recompiled!";
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Admin_RecompileS";

["RPP_Admin_DriverLicenses", {
	RPP_License = RPP_License + ["Driver License"];
	_msg = "Driver Licenses Added!";
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Admin_DriverLicenses";

["RPP_Admin_Repair", {
	vehicle player setDamage 0;
}] call RPP_Function;
publicVariable "RPP_Admin_Repair";

["RPP_Admin_Heal", {
	player setDamage 0;
}] call RPP_Function;
publicVariable "RPP_Admin_Heal";

["RPP_Admin_GlobalRepair", {
	[[], "RPP_Admin_Repair", true] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_Admin_GlobalRepair";

["RPP_Admin_GlobalSave", {
	[[player], "RPP_Admin_ForceGlobalSave", true] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_Admin_GlobalSave";

["RPP_Admin_ForceGlobalSave", {
	private ["_admin","_name_Admin","_time","_players"];
	
	_admin = _this select 0;
	_name_Admin = name _admin;

	systemChat format ["ADMIN SAVE: Admin %1 Is doing a Force Server Save please wait...",_name_Admin];
	systemChat "CLIENT SAVING: Saving Data...";

	_time = time;
	RPP_StatsLoaded = false;
	RPP_PoliceDB_StatsLoaded = false;
	RPP_VehicleDB_StatsLoaded = false;

	[] call RPP_MySQL_Client_SendStats;

	_players = 0;
	{
		_players = _players + 1;
	} foreach playableUnits;

	waitUntil {RPP_StatsLoaded};

	systemChat format ["CLIENT SAVING: Server Saved %1 Clients Data.",_players];

	systemChat format ["STAT SAVING: Server Saving taken: %1 Seconds to save.",time - _time];

	systemChat "ADMIN SAVE: Finished!";
}] call RPP_Function;
publicVariable "RPP_Admin_ForceGlobalSave";