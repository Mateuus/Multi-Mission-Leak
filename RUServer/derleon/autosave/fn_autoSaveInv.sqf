#include "..\lb_script_macros.hpp"
#include "..\..\script_macros.hpp"
/*
    File: fn_autoSaveInv.sqf
    Author: Leon "DerL30N" Beeser"

    Description:
    Used for player automatic sync to the server.
*/
if (!isServer) then {

	while {true} do {

		if (LB_SETTINGS(getNumber,"lockManuelSync") isEqualTo 1) then
		{
			sleep ((LB_SETTINGS(getNumber,"autosaveInterval") - LB_SETTINGS(getNumber,"lockManuelSync")) * 60);
		} else {
			sleep ((LB_SETTINGS(getNumber,"autosaveInterval")) * 60);
		};

		if (LB_SETTINGS(getNumber,"waitforManSave") isEqualTo 1) then
		{
			if (isNil "life_session_time") then { life_session_time = false; };
			waitUntil { (!life_session_time) };
		};

		if (alive player) then
		{
			[false] call SOCK_fnc_updateRequest;

			if (LB_SETTINGS(getNumber,"chatInfo") isEqualTo 1) then
			{
				if (LB_SETTINGS(getNumber,"advancedChatInfo") isEqualTo 1) then
				{
					if (LB_SETTINGS(getNumber,"lockManuelSync") isEqualTo 1) then
					{
						systemChat format["Deine Daten wurden automatisch gespeichert. Manuelles Speichern für %1 min. gesperrt.", (LB_SETTINGS(getNumber,"lockSyncTime"))]; //lockManuelSync
					};
				} else {
					systemChat "Deine Daten wurden automatisch gespeichert.";
				};
			};

			if (LB_SETTINGS(getNumber,"lockManuelSync") isEqualTo 1) then
			{
				life_session_time = true;
				sleep ((LB_SETTINGS(getNumber,"lockSyncTime")) * 60);
				life_session_time = false;
			};
		};
	};
};
