/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Electric.sqf

Description:
Control the Electric
*/
["RPP_Electric_ErrorRun_Loop", {
	if (!(isServer)) exitWith {};
	[] spawn {
		while {true} do {
			sleep 600; //wait 10 min before it may or may not make a problem with the electricy
			_Chance = round(random 100);
			if (RPP_isElectric) then {
		  		if (_Chance < 70) then {
		  			_GetError = RPP_Electric_Errors call bis_fnc_selectRandom;
		  			if (_GetError in RPP_Electric_Error) then {
		  				_GetError = RPP_Electric_Errors call bis_fnc_selectRandom;
		  			};
		  			if (_GetError in RPP_Electric_Error) then {
		  				_GetError = RPP_Electric_Errors call bis_fnc_selectRandom;
		  			};
		  			if (!(_GetError in RPP_Electric_Error)) then {
		  				RPP_Electric_Error = RPP_Electric_Error + [_GetError];
		  				publicVariable "RPP_Electric_Error";
		  				RPP_isElectric_Broken = true;
		  				publicVariable "RPP_isElectric_Broken";
		  			};
		  		};
		  	};
		  	sleep 10;
		};
	};

	[] spawn {
		while {true} do {
			if (!(RPP_isElectric_off)) then {
				_WireCut = "Wires cut";
				_Burning = "Burning";
				_Hot = "Too hot";
				_WiresMissing = "Wires missing";

				if (_WireCut in RPP_Electric_Error) then {
					[] call RPP_Electric_WireCut;
				};
				if (_Burning in RPP_Electric_Error) then {
					[] call RPP_Electric_WireCut;
				};
				if (_Hot in RPP_Electric_Error) then {
					[] call RPP_Electric_WireCut;
				};
				if (_WiresMissing in RPP_Electric_Error) then {
					[] call RPP_Electric_WireCut;
				};
			};

			sleep 10;
		};
	};
}] call RPP_Function;
publicVariable "RPP_Electric_ErrorRun_Loop";

["RPP_Electric_PlaySound", {
	if (!(isServer)) exitWith {};
	[] spawn {
		while {true} do {
			if (RPP_isElectric) then {
				//Repentz[RPP_PowerGenerator,"RPP_PowerGenerator"] call RPP_PlaySound_Global_Object;
			};
			sleep 12;
		};
	};
}] call RPP_Function;
publicVariable "RPP_Electric_PlaySound";

[] call RPP_Electric_PlaySound;

[] call RPP_Electric_ErrorRun_Loop;

["RPP_Electric_WireCut", {
	[] spawn {
		if (RPP_isElectric_off) exitWith {};

		_Area = getMarkerPos "RPP_PowerArea_1";
		{
			_x setHit ["light_1_hitpoint", 0.97];
			_x setHit ["light_2_hitpoint", 0.97];
			_x setHit ["light_3_hitpoint", 0.97];
			_x setHit ["light_4_hitpoint", 0.97];
		} forEach nearestObjects [_Area, [
			"Lamps_base_F",
			"PowerLines_base_F",
			"PowerLines_Small_base_F"
		], 1000];	

		RPP_isElectric = false;
		publicVariable "RPP_isElectric";
		if (RPP_isElectric_off) exitWith {};

		sleep 0.4;
		{
			_x setHit ["light_1_hitpoint", 0];
			_x setHit ["light_2_hitpoint", 0];
			_x setHit ["light_3_hitpoint", 0];
			_x setHit ["light_4_hitpoint", 0];
		} forEach nearestObjects [_Area, [
			"Lamps_base_F",
			"PowerLines_base_F",
			"PowerLines_Small_base_F"
		], 1000];

		RPP_isElectric = true;
		publicVariable "RPP_isElectric";
		if (RPP_isElectric_off) exitWith {};

		sleep 0.2;
		{
			_x setHit ["light_1_hitpoint", 0.97];
			_x setHit ["light_2_hitpoint", 0.97];
			_x setHit ["light_3_hitpoint", 0.97];
			_x setHit ["light_4_hitpoint", 0.97];
		} forEach nearestObjects [_Area, [
			"Lamps_base_F",
			"PowerLines_base_F",
			"PowerLines_Small_base_F"
		], 1000];

		RPP_isElectric = false;
		publicVariable "RPP_isElectric";
		if (RPP_isElectric_off) exitWith {};

		sleep 1;
		{
			_x setHit ["light_1_hitpoint", 0];
			_x setHit ["light_2_hitpoint", 0];
			_x setHit ["light_3_hitpoint", 0];
			_x setHit ["light_4_hitpoint", 0];
		} forEach nearestObjects [_Area, [
			"Lamps_base_F",
			"PowerLines_base_F",
			"PowerLines_Small_base_F"
		], 1000];

		RPP_isElectric = true;
		publicVariable "RPP_isElectric";
	};
}] call RPP_Function;
publicVariable "RPP_Electric_WireCut";

["RPP_Electric_Dialog",{
	createDialog "RPP_PowerGenerator";

	lbAdd [1500, "=== Power Generator Errors ==="];
	lbAdd [1500, ""];
	{
		lbAdd [1500, format ["%1",_x]];
	} foreach RPP_Electric_Error;

	lbAdd [1500, ""];

	lbAdd [1500, "=== Power Generator Log ==="];
	lbAdd [1500, ""];
	lbAdd [1500, format ["Power Status: %1",RPP_Electric_Status]];
	{
		_error = _x;
		lbAdd [1500, format ["%1",_error]];
	} foreach RPP_Electric_Log;

	buttonSetAction [1600, "[] call RPP_Electric_DeActivate;"];
	buttonSetAction [1601, "[] call RPP_Electric_Activate;"];
	buttonSetAction [1602, "[] call RPP_Electric_Repair;"];
}] call RPP_Function;
publicVariable "RPP_Electric_Dialog";

["RPP_Electric_DeActivate", {
	private ["_Area","_log","_msg"];
	if (!(RPP_isElectric)) exitWith {
		_msg = "The Power is already off";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	RPP_isElectric = false;
	RPP_isElectric_off = true;
	publicVariable "RPP_isElectric_off";
	publicVariable "RPP_isElectric";

	_Area = getMarkerPos "RPP_PowerArea_1";
	{
		_x setHit ["light_1_hitpoint", 0.97];
		_x setHit ["light_2_hitpoint", 0.97];
		_x setHit ["light_3_hitpoint", 0.97];
		_x setHit ["light_4_hitpoint", 0.97];
	} forEach nearestObjects [_Area, [
		"Lamps_base_F",
		"PowerLines_base_F",
		"PowerLines_Small_base_F"
	], 1000];
	RPP_Electric_Status = "NOT ACTIVE";
	publicVariable "RPP_Electric_Status";

	_log = format ["Electricity was turned off by %1, Time: %2",name player,date];
	RPP_Electric_Log = RPP_Electric_Log + [_log];
	publicVariable "RPP_Electric_Log";

	_msg = "The Electricity was turned off!";
	[_msg] call RPP_Message_Global;

	closeDialog 1;
	[] call RPP_Electric_Dialog;
}] call RPP_Function;
publicVariable "RPP_Electric_DeActivate";

["RPP_Electric_Activate", {
	private ["_Area","_log","_msg"];
	if (RPP_isElectric) exitWith {
		_msg = "The Electricity is already on";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	
	RPP_isElectric = true;
	RPP_isElectric_off = false;
	publicVariable "RPP_isElectric_off";
	publicVariable "RPP_isElectric";

	_Area = getMarkerPos "RPP_PowerArea_1";
	{
		_x setHit ["light_1_hitpoint", 0];
		_x setHit ["light_2_hitpoint", 0];
		_x setHit ["light_3_hitpoint", 0];
		_x setHit ["light_4_hitpoint", 0];
	} forEach nearestObjects [_Area, [
		"Lamps_base_F",
		"PowerLines_base_F",
		"PowerLines_Small_base_F"
	], 1000];

	RPP_Electric_Status = "ACTIVE";
	publicVariable "RPP_Electric_Status";

	_log = format ["Electricity was turned on by %1, Time: %2",name player,date];
	RPP_Electric_Log = RPP_Electric_Log + [_log];
	publicVariable "RPP_Electric_Log";

	_msg = "The Electricity was turned on!";
	[_msg] call RPP_Message_Global;

	closeDialog 1;
	[] call RPP_Electric_Dialog;
}] call RPP_Function;
publicVariable "RPP_Electric_Activate";

["RPP_Electric_Repair", {
	[] spawn {
		if (RPP_isElectric) exitWith {
			_msg = "The Electricity is already on please turn it off before you repair it or you will die!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (!(RPP_isElectric_Broken)) exitWith {
			_msg = "The Power Generator is not broken.";
			_color = RPP_Yellow;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (RPP_Reparing_Electric) exitWith {
			_msg = "Someone is already reparing it.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		RPP_Reparing_Electric = true;
		publicVariable "RPP_Reparing_Electric";
		private ["_progress_p","_ui","_progress","_pgText","_msg","_color"];
		disableSerialization;
		5 cutRsc ["RPP_ProgressBar","PLAIN"];
		_progress_p = 0.01;
		_ui = uiNameSpace getVariable "RPP_ProgressBar";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		while {true} do {
			_pgText ctrlSetText "Reparing Power Generator...";
			_progress progressSetPosition _progress_p;
			sleep 1;
			_progress_p = _progress_p + 0.01;
			if (player getVariable "RPP_Handcuff") exitWith {
				_msg = "You failed to Repair it";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				RPP_Reparing_Electric = false;
				publicVariable "RPP_Reparing_Electric";
				5 cutText ["","PLAIN"];
			};
			if (player getVariable "RPP_Revive") exitWith {
				_msg = "You failed to repair it";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				RPP_Reparing_Electric = false;
				publicVariable "RPP_Reparing_Electric";
				5 cutText ["","PLAIN"];
			};
			if (player getVariable "RPP_Tased") exitWith {
				_msg = "You failed to Repair it";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				RPP_Reparing_Electric = false;
				publicVariable "RPP_Reparing_Electric";
				5 cutText ["","PLAIN"];
			};
			if (player distance RPP_PowerGenerator > 5) exitWith {
				_msg = "You are to far away from the Power Generator";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				RPP_Reparing_Electric = false;
				publicVariable "RPP_Reparing_Electric";
				5 cutText ["","PLAIN"];
			};
			if (!(RPP_isElectric_off)) exitWith {
				_msg = "You failed to repair it because you started the Power";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				RPP_Reparing_Electric = false;
				publicVariable "RPP_Reparing_Electric";
				5 cutText ["","PLAIN"];
			};
			if (_progress_p >= 1) exitWith {
				_pgText ctrlSetText "Power Generator Repaired!";
				sleep 1;
				5 cutText ["","PLAIN"];
				RPP_isElectric_Broken = false;
				publicVariable "RPP_isElectric_Broken";
				RPP_Electric_Error = [];
				publicVariable "RPP_Electric_Error";
				_log = format ["%1 repaired the Power Generator, Time: %2",name player,date];
				RPP_Electric_Log = RPP_Electric_Log + [_log];
				_msg = format ["%1 just Repaired the Power Generator",name player];
				[_msg] call RPP_Message_Global;
				_paid = 450;
				[_paid] call RPP_AntiCheat_AddMoney;
				_msg = format ["You got paid %1$ for your work",_paid];
				_color = RPP_Green;
				[_msg,_color] call RPP_MessageSystem;
				RPP_Reparing_Electric = false;
				publicVariable "RPP_Reparing_Electric";
			};
		};
	};
}] call RPP_Function;
publicVariable "RPP_Electric_Repair";