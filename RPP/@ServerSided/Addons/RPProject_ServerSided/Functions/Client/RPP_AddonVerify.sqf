/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_AddonVerify.sqf

Description:
Make sure the client us up to date with our addons
*/
["RPP_AddonVerify_Check", {
	systemChat format ["%1 We are checking your addon version please wait...",name player];
	if (!(RPP_ClientAddon_Version isEqualTo RPP_ServerAddon_Version)) then {
		_msg = format ["%1 tried to connect with the wrong Addon Version! Client: %2 | Server: %3",name player,RPP_ClientAddon_Version,RPP_ServerAddon_Version];
		[_msg] call RPP_Message_Global;
		[] spawn {
			while {true} do {
				titleText [ format ["Please update your addons! Client version: %1 | Server version: %2",RPP_ClientAddon_Version,RPP_ServerAddon_Version], "BLACK"];
			 	sleep 10;
			};
		};
	} else {
		systemChat format ["%1 Your addons are up to date!",name player];
		RPP_AddonVerify = true;
	};
}] call RPP_Function;
publicVariable "RPP_AddonVerify_Check";