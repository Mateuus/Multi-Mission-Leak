/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_PayCheck.sqf

Description:
Interact with other players
*/
["RPP_PayCheck_Loop", {
	[] spawn {
		private ["_Waittime","_msg","_color"];
		_Waittime = 60; //1 min
		while {true} do {
			sleep 10; //wait 10 seconds before we start the system

			_msg = "10 Minutes until your next paycheck!";
			_color = RPP_Yellow;
			[_msg,_color] call RPP_MessageSystem;

			sleep (_Waittime);
			sleep (_Waittime);
			sleep (_Waittime);
			sleep (_Waittime);
			sleep (_Waittime);

			_msg = "5 Minutes until your next paycheck!";
			_color = RPP_Yellow;
			[_msg,_color] call RPP_MessageSystem;

			sleep (_Waittime);
			sleep (_Waittime);

			_msg = "3 Minutes until your next paycheck!";
			_color = RPP_Yellow;
			[_msg,_color] call RPP_MessageSystem;

			sleep (_Waittime);
			sleep (_Waittime);
			sleep (_Waittime);
			[] call RPP_PayCheck_Pay;
			sleep (_Waittime);
		};
	};
}] call RPP_Function;
publicVariable "RPP_PayCheck_Loop";

["RPP_PayCheck_Pay", {
	if (RPP_isCiv) exitWith {
		[RPP_CivPaycheck] call RPP_AntiCheat_AddBank;

		_msg = format ["You got a paycheck from the Government of $%1 and now have $%2 in your bank account",RPP_CivPaycheck,RPP_Bank];
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (RPP_isCop) exitWith {
		[RPP_CopPaycheck] call RPP_AntiCheat_AddBank;

		_msg = format ["You got a paycheck from the Government of $%1 and now have $%2 in your bank account",RPP_CopPaycheck,RPP_Bank];
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (RPP_isEMT) exitWith {
		[RPP_EMTPaycheck] call RPP_AntiCheat_AddBank;

		_msg = format ["You got a paycheck from the Government of $%1 and now have $%2 in your bank account",RPP_EMTPaycheck,RPP_Bank];
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;
	};
}] call RPP_Function;
publicVariable "RPP_PayCheck_Pay";

["RPP_TaskForceRadio_Check", {
	[] spawn {
		private ["_TFenabled"];
		while {true} do {
			_TFenabled = [] call TFAR_fnc_isTeamSpeakPluginEnabled;
			if (!(_TFenabled)) then {	
				titleText ["Please enable Task Force Radio in your TS3 Plugins! || TS3 -> Settings -> Plugins", "BLACK"];
			};
			sleep 1;
		};
	};
}] call RPP_Function;
publicVariable "RPP_TaskForceRadio_Check";

["RPP_Vehicle_Skill", {
	[] spawn {
		private ["_veh","_driver"];
		while {true} do {
			waitUntil {vehicle player != player};
			sleep 30;
			if (vehicle player != player) then {
				if (speed vehicle player >= 5) then {
					if (RPP_Skill_Vehicle >= 100) then {
						RPP_Skill_Vehicle = 100;
						[] call RPP_MySQL_Client_SendStats;
					} else {
						RPP_Skill_Vehicle = RPP_Skill_Vehicle + 0.1;
						[] call RPP_MySQL_Client_SendStats;
					};
				};
			};
		};
	};
}] call RPP_Function;
publicVariable "RPP_Vehicle_Skill";