/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_LoginSys.sqf

Description:
Login system
*/
["RPP_Login_Dialog", {
	private ["_Username","_text"];
	disableSerialization;
	createDialog "RPP_LoginMenu";
	buttonSetAction [1600, "[] call RPP_Login_Login;"];
	buttonSetAction [1601, "[] call RPP_Login_Register;"];
	RPP_AntiCheat_Bypass = true;

	if (!(isServer)) then {
		StayUp = (findDisplay 30045) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];
	};

	_text = uiNameSpace getVariable ["RPP_LoginMenu",displayNull];
	_Username = _text displayCtrl 1002;
	if (RPP_LoginSys_Username isEqualTo "EMPTY") then {
		_Username ctrlSetText "Please Create an Account to play.";
	} else {
		_Username ctrlSetText format["%1",RPP_LoginSys_Username];
	};

	if (isServer) then {
		RPP_AdminLevel = 1;

		RPP_IsEMT = false;
		RPP_IsCop = false;
		RPP_IsCiv = true;
		[] call RPP_Login_Civilian;
	};
}] call RPP_Function;
publicVariable "RPP_Login_Dialog";

["RPP_Login_Login", {
	[] spawn {
		private ["_Password","_DOB_D","_DOB_M","_DOB_Y","_data_D","_data_M","_data_Y","_Wronginfo"];
		_Password = ctrlText 1400;
		_DOB_D = lbCurSel 2100;
		_DOB_M = lbCurSel 2101;
		_DOB_Y = lbCurSel 2102;
		_data_D = lbData [ 2100, ( lbCurSel 2100 ) ];
		_data_M = lbData [ 2101, ( lbCurSel 2101 ) ];
		_data_Y = lbData [ 2102, ( lbCurSel 2102 ) ];
		_Wronginfo = "EMPTY";


		if (_Password isEqualTo "") exitWith {
			_msg = "Login Failed, Please Enter a password.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (_Password isEqualTo _Wronginfo) exitWith {
			_msg = "Login Failed, Wrong password.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (!(_Password isEqualTo RPP_LoginSys_Password)) exitWith {
			_msg = "Login Failed, Wrong password.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};


		_c = true;
		_type = "";

		if (player getVariable "RPP_Police" isEqualTo 1) then {
			if (RPP_CopLevel < 1) then {
				_c = false;
				_type = "Police";
			};
		};
		if (player getVariable "RPP_EMS" isEqualTo 1) then {
			if (RPP_EMTLevel < 1) then {
				_c = false;
				_type = "EMT";
			};
		};

		if (!(_c)) exitWith {
			while {true} do {
				_msg = format ["You are not a whitelisted %1, please pick a new slot!",_type];
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				sleep 2;
				player enableSimulation false;
				player allowDamage false;
				closeDialog 1;
			};
		};
		_msg = "Login Success.";
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;
		_msg = format ["Welcome %1 to RP Project",RPP_LoginSys_Username];
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
		closeDialog 1;

		_msg = format ["%1 Just logged in to RP Project.",RPP_LoginSys_Username];
		[_msg] call RPP_Message_Global;

		RPP_IsEMT = false;
		RPP_IsCop = false;
		RPP_IsCiv = true;

		[] call RPP_Hud;
		[] call RPP_KeyDo;
		[] call RPP_MapMarkers;
		[] call RPP_PayCheck_Loop;
		[] call RPP_Starving_Loop;
		[] call RPP_TaskForceRadio_Check;
		[] call RPP_Vehicle_Skill;
		[] call RPP_extDB_SaveStats;
		[] call RPP_Login_Civilian;
	};
}] call RPP_Function;
publicVariable "RPP_Login_Login";

["RPP_Login_Civilian", {
	player setpos (getMarkerPos "RPP_Civ_Spawn");
	[] call RPP_S_Actions;
	[] call RPP_Client_Actions;
	player allowDamage true;
	player enableSimulation true;

	RPP_AntiCheat_Bypass = false;

	systemChat format ["Welcome %1 (Civilian)",name player];
}] call RPP_Function;
publicVariable "RPP_Login_Civilian";

["RPP_Login_Police", {
	player setpos (getMarkerPos "RPP_Cop_Spawn");
	[] call RPP_S_Actions;
	[] call RPP_Client_Actions;
	player allowDamage true;
	player enableSimulation true;
	[] call RPP_Hud;
	[] call RPP_KeyDo;
	player setVariable ["Coplevel",1,true];

	RPP_AntiCheat_Bypass = false;

	systemChat format ["Welcome %1 (Police)",name player];
}] call RPP_Function;
publicVariable "RPP_Login_Police";

["RPP_Login_EMT", {
	player setpos (getMarkerPos "RPP_EMT_Spawn");
	[] call RPP_S_Actions;
	[] call RPP_Client_Actions;
	player allowDamage true;
	player enableSimulation true;
	[] call RPP_Hud;
	[] call RPP_KeyDo;

	RPP_AntiCheat_Bypass = false;

	systemChat format ["Welcome %1 (EMS)",name player];
}] call RPP_Function;
publicVariable "RPP_Login_EMT";

["RPP_Login_Register", {
	private ["_text","_Username"];
	if (!(RPP_LoginSys_Password isEqualTo "EMPTY")) exitWith {
		["You already got an account.",RPP_Red] call RPP_MessageSystem;
	};
	closeDialog 1;
	disableSerialization;
	createDialog "RPP_LoginMenu_Register";

	RPP_LoginSys_Username = name player;

	buttonSetAction [1600, "[] call RPP_Login_RegisterAcc;"];
	StayUp = (findDisplay 30045) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];
	_text = uiNameSpace getVariable ["RPP_LoginMenu_Register",displayNull];
	_Username = _text displayCtrl 1003;
	_Username ctrlSetText format["%1",RPP_LoginSys_Username];
}] call RPP_Function;
publicVariable "RPP_Login_Register";

["RPP_Login_RegisterAcc", {
	[] spawn {
		private ["_password1","_password2"];
		_password1 = ctrlText 1400;
		_password2 = ctrlText 1401;

		if (_password1 isEqualTo "") exitWith {
			_msg = "::Login System::<br />Missing info: Password field 1";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (_password2 isEqualTo "") exitWith {
			_msg = "::Login System::<br />Missing info: Password field 2";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (!(_password1 == _password2)) exitWith {
			_msg = "::Login System:<br />Missing info: Password 1 dose not match password 2";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};

		/*_hasABannedName = [_name] call RPP_AllowedWords;
		_bool = _hasABannedName select 0;

		if(_bool)exitWith{
			_msg = format["::Login System:<br />You are not allowed to use %1 in your password!",(_hasABannedName select 1)];
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};*/

		systemChat format ["Creating user %1 with the UID %2...",name player,getPlayerUID player];
		[name player, _password1, getPlayerUID player] remoteExec ["RPP_DB_insertLogin", 2];
		systemChat format ["User %1 created with the UID %2.",name player,getPlayerUID player];

		RPP_LoginSys_Password = _password1;
		RPP_LoginSys_IsNewPlayer = false;
		RPP_LoginSys_Username = name player;
		RPP_IsCop = true;
		RPP_Login_StatsLoaded = false;
		_msg = "::Login System::<br />Registering User into the Database...";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		_msg = "::Login System::<br />Registration Complet.";
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;

		_msg = format ["::Login System::<br />%1<br />%2",RPP_LoginSys_Username,RPP_LoginSys_Password];
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		closeDialog 1;
		[] call RPP_Login_Dialog;

		_Random = ["RPP_BetaShirt_Polo","RPP_ILoveRPP_Polo"];
		_select = _Random call bis_fnc_selectrandom;

		player forceAddUniform _select;

		_msg = format ["%1 Just Registrered for the first time, please welcome him.",RPP_LoginSys_Username];
		[_msg] call RPP_Message_Global;
	};
}] call RPP_Function;
publicVariable "RPP_Login_RegisterAcc";
