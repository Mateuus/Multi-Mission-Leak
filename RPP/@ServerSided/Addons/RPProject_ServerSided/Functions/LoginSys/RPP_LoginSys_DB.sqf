/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_LoginSys_DB.sqf

Description:
Login System DB
*/

["RPP_DB_Login_Client_LoadData", {
	[[player], "RPP_DB_Login_Server_DataCheck",false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Login_Client_LoadData";

["RPP_DB_Login_Server_DataCheck", {
	private ["_player","_playerUID","_databasePull"];

	_player = _this select 0;
	_playerUID = getPlayerUID _player;

	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT EXISTS(SELECT RPP_UID FROM LoginSystem WHERE RPP_UID = '%1')']", _playerUID];
	[[_databasePull], "RPP_DB_Login_Client_DataCheckAcc", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Login_Server_DataCheck";

["RPP_DB_Login_Client_DataCheckAcc", {
	private ["_return"];
	_return = _this select 0;
	_return = call compile _return;
	_return = (_return select 0) select 0;
	
	RPP_DB_User_Exist = _return;
	//systemChat format ["Debug: %1",RPP_DB_User_Exist];

	if ("0" in RPP_DB_User_Exist) then {
		RPP_DBChecked = true;
		[] call RPP_DB_Login_Client_CreateUser;
	}
	else
	{
		RPP_DBChecked = true;
		[] call RPP_DB_Login_Client_LoadStats;
	};
}] call RPP_Function;
publicVariable "RPP_DB_Login_Client_DataCheckAcc";

["RPP_DB_Login_Client_CreateUser", {
	[[
	player,
	name player,RPP_LoginSys_Password,RPP_LoginSys_DOB_D,
	RPP_LoginSys_DOB_M,RPP_LoginSys_DOB_Y,RPP_LoginSys_IsNewPlayer
	], "RPP_DB_Login_Server_CreateUser", false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Login_Client_CreateUser";

["RPP_DB_Login_Server_CreateUser", {
	_player = _this select 0;
	RPP_LoginSys_Username = _this select 1;
	RPP_LoginSys_Password = _this select 2;
	RPP_LoginSys_DOB_D = _this select 3;
	RPP_LoginSys_DOB_M = _this select 4;
	RPP_LoginSys_DOB_Y = _this select 5;
	RPP_LoginSys_IsNewPlayer = _this select 6;

	_PlayerUID = getPlayerUID _player;
	"Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'INSERT into LoginSystem 

(
RPP_UID,RPP_LoginSys_Username,RPP_LoginSys_Password,RPP_LoginSys_DOB_D,
RPP_LoginSys_DOB_M,RPP_LoginSys_DOB_Y,RPP_LoginSys_IsNewPlayer
) 

VALUES 

('%1','%2','%3','%4','%5','%6','%7')']",

_PlayerUID, RPP_LoginSys_Username,RPP_LoginSys_Password,RPP_LoginSys_DOB_D,
RPP_LoginSys_DOB_M,RPP_LoginSys_DOB_Y,RPP_LoginSys_IsNewPlayer
];

	[[], "RPP_DB_Login_Client_LoadStats", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Login_Server_CreateUser";

["RPP_DB_Login_Client_LoadStats", {
	[[player], "RPP_DB_Login_Server_LoadStats", false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Login_Client_LoadStats";

["RPP_DB_Login_Server_LoadStats", {
	private ["_player","_playerUID","_databasePull"]; 

	_player = _this select 0;
	_playerUID = getPlayerUID _player;
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT 

	RPP_LoginSys_Username,RPP_LoginSys_Password,RPP_LoginSys_DOB_D,
	RPP_LoginSys_DOB_M,RPP_LoginSys_DOB_Y,RPP_LoginSys_IsNewPlayer

	FROM LoginSystem WHERE RPP_UID = '%1'']", _playerUID];

	[[_databasePull], "RPP_DB_Login_Client_GetStats", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Login_Server_LoadStats";

["RPP_DB_Login_Client_GetStats", {
	private ["_return"];

	_return = _this select 0;
	_return = call compile _return;
	_return = (_return select 0) select 0;

	[_return] call RPP_DB_Login_Client_SetStats;

	//debug
}] call RPP_Function;
publicVariable "RPP_DB_Login_Client_GetStats";

["RPP_DB_Login_Client_SetStats", {
	private ["_statsArray"];
	_statsArray = _this select 0;
	_RPP_LoginSys_Username = _statsArray select 0;
	_RPP_LoginSys_Password = _statsArray select 1;
	_RPP_LoginSys_DOB_D = _statsArray select 2;
	_RPP_LoginSys_DOB_M = _statsArray select 3;
	_RPP_LoginSys_DOB_Y = _statsArray select 4;
	_RPP_LoginSys_IsNewPlayer = _statsArray select 5;

	RPP_LoginSys_Username = name player;
	RPP_LoginSys_Password = _RPP_LoginSys_Password;
	RPP_LoginSys_DOB_M = _RPP_LoginSys_DOB_M;

	if (!(_RPP_LoginSys_DOB_D == "Empty")) then {
		RPP_LoginSys_DOB_D = call compile (_RPP_LoginSys_DOB_D);
		RPP_LoginSys_DOB_Y = call compile (_RPP_LoginSys_DOB_Y);
	} else {
		RPP_LoginSys_DOB_D = call compile (_RPP_LoginSys_DOB_D);
		RPP_LoginSys_DOB_Y = call compile (_RPP_LoginSys_DOB_Y);
	};
	
	RPP_LoginSys_IsNewPlayer = call compile (_RPP_LoginSys_IsNewPlayer);


	RPP_Login_StatsLoaded = true;
}] call RPP_Function;
publicVariable "RPP_DB_Login_Client_SetStats";

["RPP_DB_Login_Client_UpdateStats", {
	[[player,name player,RPP_LoginSys_Password,
	RPP_LoginSys_DOB_D,RPP_LoginSys_DOB_M,RPP_LoginSys_DOB_Y,RPP_LoginSys_IsNewPlayer
	], "RPP_DB_Login_Server_UpdateStats", false] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Login_Client_UpdateStats";

["RPP_DB_Login_Server_UpdateStats", {
	_player = _this select 0;
	_playerUID = getPlayerUID _player;

	RPP_LoginSys_Username = _this select 1;
	RPP_LoginSys_Password = _this select 2;
	RPP_LoginSys_DOB_D = _this select 3;
	RPP_LoginSys_DOB_M = _this select 4;
	RPP_LoginSys_DOB_Y = _this select 5;
	RPP_LoginSys_IsNewPlayer = _this select 6;

	_statsSaved = false;

	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'UPDATE LoginSystem SET 

	RPP_LoginSys_Username=('%2'),RPP_LoginSys_Password=('%3'),RPP_LoginSys_DOB_D=('%4'),
	RPP_LoginSys_DOB_M=('%5'),RPP_LoginSys_DOB_Y=('%6'),RPP_LoginSys_IsNewPlayer=('%7')

	WHERE RPP_UID = '%1' ']",
		_playerUID,RPP_LoginSys_Username,RPP_LoginSys_Password,
		RPP_LoginSys_DOB_D,RPP_LoginSys_DOB_M,RPP_LoginSys_DOB_Y,RPP_LoginSys_IsNewPlayer
	];

	_statsSaved = true; 

	[[_statsSaved], "RPP_DB_Login_Client_SaveCheck", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Login_Server_UpdateStats";

["RPP_DB_Login_Client_SaveCheck", {
	_statsSaved = _this;
	[] call RPP_DB_Login_Client_LoadStats;
}] call RPP_Function;
publicVariable "RPP_DB_Login_Client_SaveCheck";