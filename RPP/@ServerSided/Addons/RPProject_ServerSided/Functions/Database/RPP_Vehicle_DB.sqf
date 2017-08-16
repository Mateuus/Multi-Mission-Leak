/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Vehicle_DB.sqf

Description:
Database for vehicles
*/

["RPP_DB_Vehicle_Client_LoadData", {
	_veh = _this select 0;
	_player = _This select 1;
	_class = _veh getVariable "RPP_Vehicle_Class";
	_ID = _veh getVariable "RPP_Vehicle_ID";
	_Owners = _veh getVariable "RPP_Vehicles_Buyer";
	//_type = _veh getVariable "RPP_Vehicle_isVeh";
	_Trunk = _veh getVariable "RPP_Vehicle_Trunk";
	_MaxWeight = _veh getVariable "RPP_Vehicle_MaxWeight";
	_Weight = _veh getVariable "RPP_Vehicle_Weight";
	_LicPlate = _veh getVariable "RPP_Vehicle_Licenseplate";
	_LicPlate_String = _veh getVariable "RPP_LicensePlate_String";

	//[[_player,_veh], "RPP_DB_Vehicle_Server_DataCheck",false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Vehicle_Client_LoadData";

["RPP_DB_Vehicle_Server_DataCheck", {
	private ["_player","_playerUID","_databasePull"];

	_player = _this select 0;
	RPP_Vehicle_SAVING = _this select 1;
	_LicPlate_String = RPP_Vehicle_SAVING getVariable "RPP_LicensePlate_String";

	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT EXISTS(SELECT RPP_Vehicles_LicensePlate_String FROM VehicleDB WHERE RPP_Vehicles_LicensePlate_String = '%1')']", _LicPlate_String];
	[[_databasePull,RPP_Vehicle_SAVING], "RPP_DB_Vehicle_Client_DataCheckAcc", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Vehicle_Server_DataCheck";

["RPP_DB_Vehicle_Client_DataCheckAcc", {
	private ["_return"];
	_return = _this select 0;
	_return = call compile _return;
	_return = (_return select 0) select 0;
	RPP_Vehicle_SAVING = _this select 1;
	
	RPP_DB_User_Exist = _return;

	[] call RPP_DB_Vehicle_Client_CreateUser;
}] call RPP_Function;
publicVariable "RPP_DB_Vehicle_Client_DataCheckAcc";

["RPP_DB_Vehicle_Client_CreateUser", {
	RPP_Vehicle_SAVING = _this select 0;
	_class = RPP_Vehicle_SAVING getVariable "RPP_Vehicle_Class";
	_ID = RPP_Vehicle_SAVING getVariable "RPP_Vehicle_ID";
	hint format ["Test: %1 | %2",_class,_ID];
	_Owners = RPP_Vehicle_SAVING getVariable "RPP_Vehicles_Buyer";
	_Trunk = RPP_Vehicle_SAVING getVariable "RPP_Vehicle_Trunk";
	_MaxWeight = RPP_Vehicle_SAVING getVariable "RPP_Vehicle_MaxWeight";
	_Weight = RPP_Vehicle_SAVING getVariable "RPP_Vehicle_Weight";
	_LicPlate = RPP_Vehicle_SAVING getVariable "RPP_Vehicle_Licenseplate";
	_LicPlate_String = RPP_Vehicle_SAVING getVariable "RPP_LicensePlate_String";
	[[player,_class,_ID,_Owners,_Trunk,_MaxWeight,_Weight,_LicPlate,_LicPlate_String], "RPP_DB_Vehicle_Server_CreateUser", false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Vehicle_Client_CreateUser";

["RPP_DB_Vehicle_Server_CreateUser", {
	_player = _this select 0;
	_class = _this select 1;
	_ID = _this select 2;
	_Owners = _this select 3;
	_Trunk = _this select 4;
	_MaxWeight = _this select 5;
	_Weight = _this select 6;
	_LicPlate = _this select 7;
	_LicPlate_String = _this select 8;
	_uid = getPlayerUID _player;

	"Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'INSERT into VehicleDB 

(
RPP_UID,RPP_Vehicles_Name,RPP_Vehicles_ID,
RPP_Vehicles_Type,RPP_Vehicles_LicensePlate,
RPP_Vehicles_LicensePlate_String,RPP_Vehicles_Trunk,
RPP_Vehicles_MaxWeight,RPP_Vehicles_Weight
) 

VALUES 

('%1','%2','%3','%4','%5','%6','%7','%8','%9')']",

_uid, _Owners, _ID, _class,_LicPlate,_LicPlate_String,
_Trunk,_MaxWeight,_Weight
];

	//[[_class,_ID,_Owners,_Trunk,_MaxWeight,_Weight,_LicPlate,_LicPlate_String], "RPP_DB_Vehicle_Client_LoadStats", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Vehicle_Server_CreateUser";

["RPP_DB_Vehicle_Client_LoadStats", {
	_class = RPP_Vehicle_SAVING getVariable "RPP_Vehicle_Class";
	_ID = RPP_Vehicle_SAVING getVariable "RPP_Vehicle_ID";
	_Owners = RPP_Vehicle_SAVING getVariable "RPP_Vehicles_Buyer";
	_Trunk = RPP_Vehicle_SAVING getVariable "RPP_Vehicle_Trunk";
	_MaxWeight = RPP_Vehicle_SAVING getVariable "RPP_Vehicle_MaxWeight";
	_Weight = RPP_Vehicle_SAVING getVariable "RPP_Vehicle_Weight";
	_LicPlate = RPP_Vehicle_SAVING getVariable "RPP_Vehicle_Licenseplate";
	_LicPlate_String = RPP_Vehicle_SAVING getVariable "RPP_LicensePlate_String";
	[[player,_class,_ID,_Owners,_Trunk,_MaxWeight,_Weight,_LicPlate,_LicPlate_String], "RPP_DB_Vehicle_Server_LoadStats", false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Vehicle_Client_LoadStats";

["RPP_DB_Vehicle_Server_LoadStats", {
	private ["_player","_playerUID","_databasePull"]; 

	_player = _this select 0;
	_class = _this select 1;
	_id = _this select 2;
	_Owners = _this select 3;
	_Trunk = _this select 4;
	_MaxWeight = _this select 5;
	_Weight = _this select 6;
	_LicPlate = _this select 7;
	_LicPlate_String = _this select 8;
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT 

	RPP_UID,RPP_Vehicles_Name,RPP_Vehicles_ID,
	RPP_Vehicles_Type,RPP_Vehicles_LicensePlate,
	RPP_Vehicles_LicensePlate_String,RPP_Vehicles_Trunk,
	RPP_Vehicles_MaxWeight,RPP_Vehicles_Weight

	FROM VehicleDB WHERE RPP_Vehicles_LicensePlate_String = '%1'']", _LicPlate_String];

	[[_databasePull], "RPP_DB_Vehicle_Client_GetStats", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Vehicle_Server_LoadStats";

["RPP_DB_Vehicle_Client_GetStats", {
	private ["_return"];

	_return = _this select 0;
	_return = call compile _return;
	_return = (_return select 0) select 0;

	[_return] call RPP_DB_Vehicle_Client_SetStats;

	//debug
	systemChat format ["%1",_return];
}] call RPP_Function;
publicVariable "RPP_DB_Vehicle_Client_GetStats";

["RPP_DB_Vehicle_Client_SetStats", {
	private ["_statsArray"];
	_statsArray = _this select 0;
	_RPP_uid = _statsArray select 0;
	_RPP_name = _statsArray select 1;
	_ID = _statsArray select 2;
	_Type = _statsArray select 3;
	_LicPlate = _statsArray select 4;

	RPP_Vehicle_UID = _RPP_uid;
	RPP_Vehicle_Name = _RPP_name;
	RPP_Vehicle_ID = _ID;
	RPP_Vehicle_Type = _Type;
	RPP_Vehicle_LicensePlate = _LicPlate;

	RPP_Server_Vehicle_DB_Saving = false;
	publicVariable "RPP_Server_Vehicle_DB_Saving";

	RPP_VehicleDB_StatsLoaded = true;
}] call RPP_Function;
publicVariable "RPP_DB_Vehicle_Client_SetStats";

["RPP_DB_Vehicle_Client_UpdateStats", {
	if (isServer) exitWith {};
	[] spawn {
		waitUntil {!RPP_Server_Vehicle_DB_Saving};
		_class = _this select 0;
		_id = _this select 1;
		_Owners = _this select 2;
		_Trunk = _this select 3;
		_MaxWeight = _this select 4;
		_Weight = _this select 5;
		_LicPlate = _this select 6;
		_LicPlate_String = _this select 7;
		RPP_Server_Vehicle_DB_Saving = true;
		publicVariable "RPP_Server_Vehicle_DB_Saving";
		[[player,_class,_id,_Owners,_Trunk,_MaxWeight,_Weight,_LicPlate,_LicPlate_String], "RPP_DB_Vehicle_Server_UpdateStats", false] spawn BIS_fnc_MP;
	};
}] call RPP_Function;
publicVariable "RPP_DB_Vehicle_Client_UpdateStats";

["RPP_DB_Vehicle_Server_UpdateStats", {
	_player = _this select 0;
	_class = _this select 1;
	_id = _this select 2;
	_Owners = _this select 3;
	_Trunk = _this select 4;
	_MaxWeight = _this select 5;
	_Weight = _this select 6;
	_LicPlate = _this select 7;
	_LicPlate_String = _this select 8;

	RPP_Vehicles = [_this select 1] call RPP_ArrToSQL;

	_statsSaved = false;

	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'UPDATE VehicleDB SET 

	RPP_UID='%1',RPP_Vehicles_Name='%2',RPP_Vehicles_ID='%3',
	RPP_Vehicles_Type='%4',RPP_Vehicles_LicensePlate='%5',
	RPP_Vehicles_LicensePlate_String='%6',RPP_Vehicles_Trunk='%7',
	RPP_Vehicles_MaxWeight='%8',RPP_Vehicles_Weight='%9'

	WHERE RPP_Vehicles_LicensePlate = '%1' ']",
		_id,_Owners,"RPP",_class,_LicPlate,_LicPlate_String,_Trunk,_MaxWeight,_Weight
	];

	_statsSaved = true; 

	[[_statsSaved,_class,_id,_Owners,_Trunk,_MaxWeight,_Weight,_LicPlate,_LicPlate_String], "RPP_DB_Vehicle_Client_SaveCheck", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Vehicle_Server_UpdateStats";

["RPP_DB_Vehicle_Client_SaveCheck", {
	_statsSaved = _this;
	_class = _this select 1;
	_id = _this select 2;
	_Owners = _this select 3;
	_Trunk = _this select 4;
	_MaxWeight = _this select 5;
	_Weight = _this select 6;
	_LicPlate = _this select 7;
	_LicPlate_String = _this select 8;
	[_class,_id,_Owners,_Trunk,_MaxWeight,_Weight,_LicPlate,_LicPlate_String] call RPP_DB_Vehicle_Client_LoadStats;
}] call RPP_Function;
publicVariable "RPP_DB_Vehicle_Client_SaveCheck";