 /*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Client_Actions.sqf

Description:
Client Actions
*/
["RPP_Client_Actions", {
	if (RPP_AdminLevel >= 1) then {
		player addAction ["<t color='#996633'>Admin Menu</t>",{[] call RPP_Admin_OpenDialog}];
		RPP_AntiCheat_Bypass = true;
	};
}] call RPP_Function;
publicVariable "RPP_Client_Actions";