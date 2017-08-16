/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_PoliceCrime_DB.sqf

Description:
Database for police
*/

["RPP_DB_PoliceCrime_Client_LoadData", {
	[[player], "RPP_DB_PoliceCrime_Server_DataCheck",false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Client_LoadData";

["RPP_DB_PoliceCrime_Server_DataCheck", {
	private ["_player","_playerUID","_databasePull"];

	_player = _this select 0;
	_playerUID = "Server_PD_DB";

	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT EXISTS(SELECT RPP_UID FROM CrimeDB WHERE RPP_UID = '%1')']", _playerUID];
	[[_databasePull], "RPP_DB_PoliceCrime_Client_DataCheckAcc", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Server_DataCheck";

["RPP_DB_PoliceCrime_Client_DataCheckAcc", {
	private ["_return"];
	_return = _this select 0;
	_return = call compile _return;
	_return = (_return select 0) select 0;
	
	RPP_DB_User_Exist = _return;
	//systemChat format ["Debug: %1",RPP_DB_User_Exist];

	if ("0" in RPP_DB_User_Exist) then {
		RPP_DBChecked = true;
		[] call RPP_DB_PoliceCrime_Client_CreateUser;
		if (RPP_Server_Police_DB_Saving) exitWith {
			[] spawn {
				waituntil {!RPP_Server_Police_DB_Saving};
				[] call RPP_DB_PoliceCrime_Client_LoadStats;
			};
		};
		RPP_Server_Police_DB_Saving = true;
		publicVariable "RPP_Server_Police_DB_Saving";
	}
	else
	{
		RPP_DBChecked = true;
		[] call RPP_DB_PoliceCrime_Client_LoadStats;
	};
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Client_DataCheckAcc";

["RPP_DB_PoliceCrime_Client_DeleteCrime", {
	private ["_plate","_databasePull"]; 
	_UID = _this select 0;
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'DELETE FROM CrimeDB WHERE RPP_UID = '%1'']", _UID];
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Client_DeleteCrime";

["RPP_DB_PoliceCrime_Client_CreateUser", {
	_id = _this select 0;
	_name = _this select 1;
	_reason = _this select 2;
	_submitby = _this select 3;
	_race = _this select 4;
	[[_id,_name,_reason,_submitby,_Race], "RPP_DB_PoliceCrime_Server_CreateUser", false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Client_CreateUser";

["RPP_DB_PoliceCrime_Server_CreateUser", {
	_id = _this select 0;
	_name = _this select 1;
	_reason = _this select 2;
	_submitby = _this select 3;
	_race = _this select 4;

	"Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'INSERT into CrimeDB 

(
	RPP_UID,RPP_Crime_Name,RPP_Crime_Reason,
	RPP_Crime_SubmitBy,RPP_Crime_Race
) 

VALUES 

('%1','%2','%3','%4','%5')']",

_id, _name,_reason,_submitby,_race
];

	[[], "RPP_DB_PoliceCrime_Client_LoadStats", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Server_CreateUser";

["RPP_DB_PoliceCrime_Client_LoadStats", {
	[[player], "RPP_DB_PoliceCrime_Server_LoadStats", false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Client_LoadStats";

["RPP_DB_PoliceCrime_Server_LoadStats", {
	private ["_player","_playerUID","_databasePull"]; 

	_player = _this select 0;
	_playerUID = "Server_PD_DB";
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT DISTINCT * FROM CrimeDB']", _playerUID];

	[[_databasePull], "RPP_DB_PoliceCrime_Client_GetStats", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Server_LoadStats";

["RPP_DB_PoliceCrime_Client_GetStats", {
	private ["_return"];

	_return = _this select 0;
	_return = call compile _return;
	//_return = (_return select 0) select 0;

	[_return] call RPP_DB_PoliceCrime_Client_SetStats;

	//debug
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Client_GetStats";

["RPP_DB_PoliceCrime_Client_SetStats", {
	private ["_statsArray"];
	_statsArray = _this select 0;
	_Listbox = [];
	_t = [];
	_t = _t + [_statsArray];
	_t = (_t select 0) select 0;

	if ("Error" in _statsArray) exitWith {
		hint "Database return error";

		RPP_Server_Police_DB_Saving = false;
		publicVariable "RPP_Server_Police_DB_Saving";
		RPP_PoliceDB_StatsLoaded = true;
	};

	lbClear 1500;
	{
		_RPP_uid = _x select 1;
		_name = _x select 2;

		if (_RPP_uid in _Listbox) exitWith {};
		_Listbox = _Listbox + [_RPP_uid];

		_data = lbAdd [1500, format ["%1",_name]];
		lbSetData [1500, _data, _RPP_uid];
	} foreach _t;

	RPP_Server_Police_DB_Saving = false;
	publicVariable "RPP_Server_Police_DB_Saving";
	RPP_PoliceDB_StatsLoaded = true;
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Client_SetStats";

["RPP_DB_PoliceCrime_Server_ViewLoadStats", {
	private ["_player","_playerUID","_databasePull"]; 

	_player = _this select 0;
	_RPP_UID = _this select 1;
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT * FROM CrimeDB WHERE RPP_UID = '%1'']", _RPP_UID];


	[[_databasePull], "RPP_DB_PoliceCrime_Client_ViewGetStats", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Server_ViewLoadStats";

["RPP_DB_PoliceCrime_Client_ViewGetStats", {
	private ["_return"];

	_return = _this select 0;
	_return = call compile _return;
	_return = (_return select 0) select 0;

	[_return] call RPP_DB_PoliceCrime_Client_ViewSetStats;
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Client_ViewGetStats";

["RPP_DB_PoliceCrime_Client_ViewSetStats", {
	private ["_statsArray"];
	_statsArray = _this select 0;
	_id = _statsArray select 1;
	_name = _statsArray select 2;
	_reason = _statsArray select 3;
	_submitby = _statsArray select 4;
	_Race = _statsArray select 5;

	/*_Listbox = [];
	_t = [];
	_t = _t + [_statsArray];
	_t = (_t select 0) select 0;*/

	if ("Error" in _statsArray) exitWith {
		hint "Database return error";

		RPP_Server_Police_DB_Saving = false;
		publicVariable "RPP_Server_Police_DB_Saving";
		RPP_PoliceDB_StatsLoaded = true;
	};


	lbClear 1501;
	lbAdd [1501, format ["Name: %1",_name]];
	lbAdd [1501, format ["Race: %1",_Race]];
	lbAdd [1501, format ["Description: %1",_reason]];
	lbAdd [1501, format ["Reporting Officer: %1",_submitby]];
	lbAdd [1501, format ["ID: %1",_id]];

	RPP_Server_Police_DB_Saving = false;
	publicVariable "RPP_Server_Police_DB_Saving";
	RPP_PoliceDB_StatsLoaded = true;
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Client_ViewSetStats";

["RPP_DB_PoliceCrime_Client_UpdateStats", {
	if (isServer) exitWith {};
	[] spawn {
		waitUntil {!RPP_Server_Police_DB_Saving};
		RPP_Server_Police_DB_Saving = true;
		publicVariable "RPP_Server_Police_DB_Saving";
		[[player,RPP_Crime,RPP_WantedList], "RPP_DB_PoliceCrime_Server_UpdateStats", false] spawn BIS_fnc_MP;
	};
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Client_UpdateStats";

["RPP_DB_PoliceCrime_Server_UpdateStats", {
	_player = _this select 0;
	_playerUID = "Server_PD_DB";

	RPP_Crime = [_this select 1] call RPP_ArrToSQL;;
	RPP_WantedList = [_this select 2] call RPP_ArrToSQL;;

	_statsSaved = false;

	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'UPDATE CrimeDB SET 

	RPP_Crime='%2',RPP_WantedList='%3'

	WHERE RPP_UID = '%1' ']",
		_playerUID,RPP_Crime,RPP_WantedList
	];

	_statsSaved = true; 

	[[_statsSaved], "RPP_DB_PoliceCrime_Client_SaveCheck", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Server_UpdateStats";

["RPP_DB_PoliceCrime_Client_SaveCheck", {
	_statsSaved = _this;
	[] call RPP_DB_PoliceCrime_Client_LoadStats;
}] call RPP_Function;
publicVariable "RPP_DB_PoliceCrime_Client_SaveCheck";