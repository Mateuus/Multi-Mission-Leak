/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_AntiCheat.sqf

Description:
Anti-Cheat to protect the server!
*/
["RPP_AntiCheat_Loadup", {
	if (RPP_AdminLevel >= 1) exitWith {
		RPP_AntiCheat_AdminBypass = true;
		systemChat "RP Project Anti-Cheat bypass activated.";
	};
	//[] call RPP_AntiCheat_CheckCashValue;
	//[] call RPP_AntiCheat_CheckBankValue;
	//[] call RPP_AntiCheat_Teleport;
	RPP_AntiCheat_Loaded = 1;
	//systemChat "RP Project Anti-Cheat V0.2 Activated"
}] call RPP_Function;
publicVariable "RPP_AntiCheat_Loadup";

["RPP_AntiCheat_AddMoney", {
	[_this select 0] spawn {
		private ["_amount"];
		_amount = _this select 0;
		waituntil{!RPP_AntiCheat_Bypass};
		RPP_AntiCheat_Bypass = true;
		RPP_Cash = RPP_Cash + _amount;
		sleep 1;
		RPP_AntiCheat_Bypass = false;
	};
}] call RPP_Function;
publicVariable "RPP_AntiCheat_AddMoney";

["RPP_AntiCheat_RemoveMoney", {
	[_this select 0] spawn {
		private ["_amount"];
		_amount = _this select 0;
		waituntil{!RPP_AntiCheat_Bypass};
		RPP_AntiCheat_Bypass = true;
		RPP_Cash = RPP_Cash - _amount;
		sleep 1;
		RPP_AntiCheat_Bypass = false;
	};
}] call RPP_Function;
publicVariable "RPP_AntiCheat_RemoveMoney";

["RPP_AntiCheat_AddBank", {
	[_this select 0] spawn {
		private ["_amount"];
		_amount = _this select 0;
		waituntil{!RPP_AntiCheat_Bypass};
		RPP_AntiCheat_Bypass = true;
		RPP_Bank = RPP_Bank + _amount;
		sleep 1;
		RPP_AntiCheat_Bypass = false;
	};
}] call RPP_Function;
publicVariable "RPP_AntiCheat_AddBank";

["RPP_AntiCheat_RemoveBank", {
	[_this select 0] spawn {
		private ["_amount"];
		_amount = _this select 0;
		waituntil{!RPP_AntiCheat_Bypass};
		RPP_AntiCheat_Bypass = true;
		RPP_Bank = RPP_Bank - _amount;
		sleep 1;
		RPP_AntiCheat_Bypass = false;
	};
}] call RPP_Function;
publicVariable "RPP_AntiCheat_RemoveBank";

["RPP_AntiCheat_CheckCashValue", {
	[] spawn {
		while {true} do {
			private ["_oldstats"];
			_oldstats = RPP_Cash;
			sleep 1;
			if (!(RPP_AntiCheat_Bypass)) then {
				if (RPP_Cash > _oldstats) then {
					["Cash spawner"] call RPP_AntiCheat_Detected;
				};
			
				if (RPP_Cash < _oldstats) then {
					["Cash remover"] call RPP_AntiCheat_Detected;
				};
			};
			sleep 0.3;
		};
	};
}] call RPP_Function;
publicVariable "RPP_AntiCheat_CheckCashValue";

["RPP_AntiCheat_CheckBankValue", {
	[] spawn {
		while {true} do {
			private ["_oldstats"];
			_oldstats = RPP_Bank;
			sleep 1;
			if (!(RPP_AntiCheat_Bypass)) then {
				if (RPP_Bank > _oldstats) then {
					["Bank spawner"] call RPP_AntiCheat_Detected;
				};
				if (RPP_Bank < _oldstats) then {
					["Bank remover"] call RPP_AntiCheat_Detected;
				};
			};
			sleep 0.3;
		};
	};
}] call RPP_Function;
publicVariable "RPP_AntiCheat_CheckBankValue";

["RPP_AntiCheat_Teleport", {
	[] spawn {
		while {true} do {
			private ["_pos1","_pos2","_getpos"];
			if (!(RPP_AntiCheat_Bypass)) then {
				_pos1 = getpos vehicle player;
				sleep 1;
				_pos2 = getpos vehicle player;
				_getpos = _pos1 distance _pos2;

				if (_getpos > 500) exitWith {
					["Teleport"] call RPP_AntiCheat_Detected;
				};
			};
		};
	};
}] call RPP_Function;
publicVariable "RPP_AntiCheat_Teleport";

["RPP_AntiCheat_Detected", {
	private ["_Cheat","_p"];
	_Cheat = _this select 0;
	_p = player;

	//Let's strip the cheater :D
	removeAllWeapons _p;
	removeAllActions _p;
	removeAllItems _p;
	removeHeadgear _p;
	removeUniform _p;
	removeVest _p;
	_p enableSimulation false;
	//disableUserInput true; //Enable only when server is live.

	[] call RPP_AntiCheat_SpamCheater;
	[_Cheat,_p] call RPP_AntiCheat_Tell;

	for '_i' from 1 to 3 do {
		_msg = format ["!!!!! Anti-Cheat !!!!!  %1 Was detected using %2",name _p,_cheat];
		[_msg] call RPP_Server_Log;
	};
}] call RPP_Function;
publicVariable "RPP_AntiCheat_Detected";

["RPP_AntiCheat_SpamCheater", {
	[] spawn {
		while {true} do {
			hint format ["%1 You have been detected in the RP Project Anti-Cheat system!",name player];
			systemChat format ["%1 is a cheating cunt.",name player];
		};
	};
}] call RPP_Function;
publicVariable "RPP_AntiCheat_SpamCheater";

["RPP_AntiCheat_Tell", {
	private ["_cheat","_player"];
	_cheat = _this select 0;
	_player = _this select 1;
	[[_cheat,_player], "RPP_AntiCheat_TellServer", true] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_AntiCheat_Tell";

["RPP_AntiCheat_TellServer", {
	private ["_cheat","_player"];
	_cheat = _this select 0;
	_player = _this select 1;

	for '_i' from 1 to 5 do {
		systemChat format ["::RP Project Anti-Cheat:: %1 Was detected in the RP Project Anti-Cheat system for using %2, please report this to an admin.",name _player, _cheat];
	};
}] call RPP_Function;
publicVariable "RPP_AntiCheat_TellServer";