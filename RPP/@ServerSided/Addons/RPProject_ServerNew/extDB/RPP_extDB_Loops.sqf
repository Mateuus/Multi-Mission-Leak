#include "\RPProject_ServerNew\macros.hpp"
/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_extDB_Loops.sqf

Description:
extDB database loops
*/
["RPP_extDB_Loop_CFG", {
	RPP_extDB_TimeSave = 1; //In minutes (defult 5 minutes)
}] call RPP_Function;
publicVariable "RPP_extDB_Loop_CFG";

["RPP_extDB_SaveStats_execute", {
	[_this select 0] spawn {
		/* LEAVE THIS, DO NOT EDIT UNLESS ADDING SAVINGS */
		private ["_uid"];
		_uid = _this select 0;

		systemChat "Saving stats...";

		diag_log "==================================";
		diag_log "======== Repentz Saving System ========";
		diag_log "==================================";

		/* SAVE STATS */

		[0, RPP_Cash, _uid] remoteExec ["RPP_DB_partialSync", 2];
		sleep 0.2;
		[1, RPP_Bank, _uid] remoteExec ["RPP_DB_partialSync", 2];
		sleep 0.2;
		[2, RPP_License, _uid] remoteExec ["RPP_DB_partialSync", 2];
		sleep 0.2;
		[3, [RPP_Hunger, RPP_Thirst] , _uid] remoteExec ["RPP_DB_partialSync", 2];
		sleep 0.2;
		[] call RPP_saveGear;
		sleep 0.2;
		[5, RPP_Inventory, _uid] remoteExec ["RPP_DB_partialSync", 2];
		sleep 0.2;
		[6,[RPP_Skill_Vehicle, RPP_skill_Crafting, RPP_Skill_Mining, RPP_Skill_Gathering, RPP_Skill_Fishing], _uid] remoteExec ["RPP_DB_partialSync",2];

		diag_log "==================================";
		diag_log "=== Repentz Saving System ===";
		diag_log "==================================";

		systemChat "Stats Saved.";

		/* Finished savings */
	}
}] call RPP_Function;
publicVariable "RPP_extDB_SaveStats_execute";

["RPP_extDB_SaveStats",{
	[] call RPP_extDB_Loop_CFG;

	[] spawn {
		sleep 2;

		systemChat "Saving loop started.";

		while {true} do {
			sleep (RPP_extDB_TimeSave * 60);
			[getPlayerUID player] call RPP_extDB_SaveStats_execute; //Call the save function
		};
	};
}] call RPP_Function;
publicVariable "RPP_extDB_SaveStats";