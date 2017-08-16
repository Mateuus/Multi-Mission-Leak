/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_VehicleStorage_DB.sqf

Description:
Database for vehicle Storage
*/

["RPP_DB_VehicleStorage_Client_LoadData", {
	[[player], "RPP_DB_VehicleStorage_Server_DataCheck",false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Client_LoadData";

["RPP_DB_VehicleStorage_Server_DataCheck", {
	private ["_player","_playerUID","_databasePull"];

	_player = _this select 0;
	_LicPlate_String = getPlayerUID _player;

	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT EXISTS(SELECT RPP_UID FROM VehicleStorageDB WHERE RPP_UID = '%1')']", _LicPlate_String];
	[[_databasePull], "RPP_DB_VehicleStorage_Client_DataCheckAcc", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Server_DataCheck";

["RPP_DB_VehicleStorage_Client_DataCheckAcc", {
	private ["_return"];
	_return = _this select 0;
	_return = call compile _return;
	_return = (_return select 0) select 0;
	
	RPP_DB_User_Exist = _return;
	if ("0" in RPP_DB_User_Exist) then {
		[] call RPP_DB_VehicleStorage_Client_LoadStats
	}
	else
	{
		[] call RPP_DB_VehicleStorage_Client_CreateUser;
	};
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Client_DataCheckAcc";

["RPP_DB_VehicleStorage_Client_CreateUser", {
	_data = _This select 0;
	hint format ["%1",_data];
	{
		if (_data == _x select 13) exitWith {
			_del = _x select 0;
			_classname = _x select 1;
			_dmg = _x select 2;
			_fuel = _x select 3;
			_id = _x select 4;
			_Buyer = _x select 5;
			_isveh = _x select 6;
			_trunk = _x select 7;
			_owners = _x select 8;
			_trunkopen = _x select 9;
			_maxweight = _x select 10;
			_weight = _x select 11;
			_licplat = _x select 12;
			_licplat_String = _x select 13;

			[[player,_classname,_id,_Buyer,_isveh,_trunk,_owners,_maxweight,_weight,_licplat,_licplat_String], "RPP_DB_VehicleStorage_Server_CreateUser", false] call BIS_FNC_MP;

			deleteVehicle _del;
			_msg = "Vehicle Stored!";
			_color = RPP_Green;
			[_msg,_color] call RPP_MessageSystem;
		};
	} count RPP_Vehicle_StorageInput;
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Client_CreateUser";


["RPP_DB_VehicleStorage_Server_CreateUser", {
	_player = _this select 0;
	_class = _this select 1;
	_id = _this select 2;
	_buyer = _this select 3;
	//_isveh = _this select 4;
	_trunk = [_this select 5] call RPP_ArrToSQL;
	_owners = [_this select 6] call RPP_ArrToSQL;
	_MaxWeight = _this select 7;
	_weight = _this select 8;
	_licplat = _this select 9;
	_licplat_String = _this select 10;
	_uid = getPlayerUID _player;

	"Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'INSERT into VehicleStorageDB 

(
RPP_UID,RPP_Vehicles_Name,RPP_Vehicles_ID,
RPP_Vehicles_Type,RPP_Vehicles_LicensePlate,
RPP_Vehicles_LicensePlate_String,RPP_Vehicles_Trunk,
RPP_Vehicles_MaxWeight,RPP_Vehicles_Weight,
RPP_Vehicles_Owners
) 

VALUES 

('%1','%2','%3','%4','%5','%6','%7','%8','%9','%10')']",

_uid, _buyer, _id, _class,_licplat,_licplat_String,
_trunk,_MaxWeight,_weight,_owners
];

	//[[_class,_ID,_Owners,_Trunk,_MaxWeight,_Weight,_LicPlate,_LicPlate_String], "RPP_DB_Vehicle_Client_LoadStats", _player] spawn BIS_fnc_MP;
	[[], "RPP_DB_Vehicle_Client_StoreReturn", _player] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Server_CreateUser";

["RPP_DB_Vehicle_Client_StoreReturn", {
	RPP_VehicleDB_StatsLoaded = true;
}] call RPP_Function;
publicVariable "RPP_DB_Vehicle_Client_StoreReturn";

["RPP_DB_VehicleStorage_Client_LoadStats", {
	[[player], "RPP_DB_VehicleStorage_Server_LoadStats", false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Vehicle_Client_LoadStats";

["RPP_DB_VehicleStorage_Client_LoadStatsVehicle", {
	_plate = _this select 0;
	[[player,_plate], "RPP_DB_VehicleStorage_Server_LoadVehicle", false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Client_LoadStatsVehicle";

["RPP_DB_VehicleStorage_Server_LoadVehicle", {
	private ["_player","_playerUID","_databasePull"]; 

	_player = _this select 0;
	_plate = _this select 1;
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT * FROM VehicleStorageDB WHERE RPP_Vehicles_LicensePlate_String = '%1'']", _plate];

	[[_databasePull], "RPP_DB_VehicleStorage_Client_GetStatsVehicle", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Server_LoadVehicle";

["RPP_DB_VehicleStorage_Client_GetStatsVehicle", {
	private ["_return"];

	_return = _this select 0;
	_return = call compile _return;
	_return = (_return select 0) select 0;
	[_return] call RPP_DB_VehicleStorage_Client_SetStatsVehicle;
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Client_GetStatsVehicle";

["RPP_DB_VehicleStorage_Client_SetStatsVehicle", {
	private ["_statsArray"];
	_statsArray = _this select 0;
	if ("Error" in _statsArray) exitWith {
		hint "No Vehicles was found.";

		RPP_Server_Vehicle_DB_Saving = false;
		publicVariable "RPP_Server_Vehicle_DB_Saving";
		RPP_VehicleDB_StatsLoaded = true;
	};
	_RPP_UID = _statsArray select 1;
	_RPP_Vehicles_Name = _statsArray select 2;
	_RPP_Vehicles_ID = _statsArray select 3;
	_RPP_Vehicles_Type = _statsArray select 4;
	_RPP_Vehicles_LicensePlate = _statsArray select 5;
	_RPP_Vehicles_LicensePlate_String = _statsArray select 6;
	_RPP_Vehicles_Trunks = _statsArray select 7;
	_RPP_Vehicles_MaxWeights = _statsArray select 8;
	_RPP_Vehicles_Weights = _statsArray select 9;
	_RPP_Vehicles_Owners = _statsArray select 11;


	_RPP_Vehicles_Weight = call compile (_RPP_Vehicles_Weights);
	_RPP_Vehicles_MaxWeight = call compile (_RPP_Vehicles_MaxWeights);
	_RPP_Vehicles_Owner = [_RPP_Vehicles_Owners] call RPP_SQLToArr;
	_RPP_Vehicles_Trunk = [_RPP_Vehicles_Trunks] call RPP_SQLToArr;
	if (typeName _RPP_Vehicles_Owner == "STRING") then {_RPP_Vehicles_Owner = call compile _RPP_Vehicles_Owner};
	if (typeName _RPP_Vehicles_Trunk == "STRING") then {_RPP_Vehicles_Trunk = call compile _RPP_Vehicles_Trunk};

	[[_RPP_Vehicles_LicensePlate_String], "RPP_DB_VehicleStorage_Server_DeleteVehicle",false] spawn BIS_fnc_MP;

	_veh = _RPP_Vehicles_Type createVehicle (position RPP_VehicleStorage_Spawn);
	_dir = getdir(RPP_VehicleStorage_Spawn);
	_veh setDir _dir;
	_veh lock true;

	_veh setVariable ["RPP_Vehicle_Class",_RPP_Vehicles_Type,true];
	_veh setVariable ["RPP_Vehicle_ID",_RPP_Vehicles_ID,true];
	_veh setVariable ["RPP_Vehicles_Buyer",_RPP_UID,true];
	_veh setVariable ["RPP_Vehicle_isVeh",true,true];
	_veh setVariable ["RPP_Vehicle_Trunk",_RPP_Vehicles_Trunk,true];
	_veh setVariable ["RPP_Vehicle_Owners",_RPP_Vehicles_Owner,true];
	_veh setVariable ["RPP_Vehicle_TrunkOpen",false,true];
	_veh setVariable ["RPP_Vehicle_MaxWeight",_RPP_Vehicles_MaxWeight,true];
	_veh setVariable ["RPP_Vehicle_Weight",_RPP_Vehicles_Weight,true];
	_veh setVariable ["RPP_Vehicle_Licenseplate",_RPP_Vehicles_LicensePlate,true];
	_veh setVariable ["RPP_LicensePlate_String",_RPP_Vehicles_LicensePlate_String,true];

	RPP_Server_Vehicle_DB_Saving = false;
	publicVariable "RPP_Server_Vehicle_DB_Saving";

	RPP_VehicleDB_StatsLoaded = true;

	_RPP_Vehicles_LicensePlate = _veh getVariable "RPP_Vehicle_Licenseplate";

	[_veh,_RPP_Vehicles_LicensePlate] call RPP_Licenseplate_RePlace;
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Client_SetStatsVehicle";

["RPP_DB_VehicleStorage_Server_DeleteVehicle", {
	private ["_plate","_databasePull"]; 

	_plate = _this select 0;
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'DELETE FROM VehicleStorageDB WHERE RPP_Vehicles_LicensePlate_String = '%1'']", _plate];
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Server_DeleteVehicle";

["RPP_DB_VehicleStorage_Server_LoadStats", {
	private ["_player","_playerUID","_databasePull"]; 

	_player = _this select 0;
	_uid = getPlayerUID _player;
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT DISTINCT * FROM VehicleStorageDB']", _uid];

	[[_databasePull], "RPP_DB_VehicleStorage_Client_GetStats", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Server_LoadStats";

["RPP_DB_VehicleStorage_Client_GetStats", {
	private ["_return"];

	_return = _this select 0;
	_return = call compile _return;
	//_return = (_return select 0) select 0;
	[_return] call RPP_DB_VehicleStorage_Client_SetStats;
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Client_GetStats";

["RPP_DB_VehicleStorage_Client_SetStats", {
	private ["_statsArray"];
	_statsArray = _this select 0;
	_Listbox = [];
	_t = [];
	_t = _t + [_statsArray];
	_t = (_t select 0) select 0;

	if ("Error" in _statsArray) exitWith {
		lbAdd [1500, "No Vehicles was found."];

		RPP_Server_Vehicle_DB_Saving = false;
		publicVariable "RPP_Server_Vehicle_DB_Saving";
		RPP_VehicleDB_StatsLoaded = true;
	};

	lbClear 1500;
	lbAdd [1500, "=== Vehicle Storage ==="];
	{
		_RPP_uid = _x select 1;
		_Classname = _x select 4;
		_licplat_S = _x select 6;

		if (getPlayerUID player == _x select 1) then {

			if (_licplat_S in _Listbox) exitWith {};
			_Listbox = _Listbox + [_licplat_S];

			_text = getText (configFile >> 'CfgVehicles' >> _classname >> 'displayName');
			_Storage = lbAdd [1500, format ["%1 | Plate: %2",_text,_licplat_S]];
			lbSetData [1500, _Storage, _licplat_S];
		};
	} foreach _t;

	RPP_Server_Vehicle_DB_Saving = false;
	publicVariable "RPP_Server_Vehicle_DB_Saving";

	RPP_VehicleDB_StatsLoaded = true;
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Client_SetStats";

["RPP_DB_VehicleStorage_Client_UpdateStats", {
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
		[[player,_class,_id,_Owners,_Trunk,_MaxWeight,_Weight,_LicPlate,_LicPlate_String], "RPP_DB_VehicleStorage_Server_UpdateStats", false] spawn BIS_fnc_MP;
	};
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Client_UpdateStats";

["RPP_DB_VehicleStorage_Server_UpdateStats", {
	_player = _this select 0;
	_class = _this select 1;
	_id = _this select 2;
	_Owners = [_this select 3] call RPP_ArrToSQL;
	_Trunk = [_this select 4] call RPP_ArrToSQL;
	_MaxWeight = _this select 5;
	_Weight = _this select 6;
	_LicPlate = _this select 7;
	_LicPlate_String = _this select 8;

	RPP_Vehicles = [_this select 1] call RPP_ArrToSQL;

	_statsSaved = false;

	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'UPDATE VehicleStorageDB SET 

	RPP_UID='%1',RPP_Vehicles_Name='%2',RPP_Vehicles_ID='%3',
	RPP_Vehicles_Type='%4',RPP_Vehicles_LicensePlate='%5',
	RPP_Vehicles_LicensePlate_String='%6',RPP_Vehicles_Trunk='%7',
	RPP_Vehicles_MaxWeight='%8',RPP_Vehicles_Weight='%9'

	WHERE RPP_Vehicles_LicensePlate = '%1' ']",
		_id,_Owners,"RPP",_class,_LicPlate,_LicPlate_String,_Trunk,_MaxWeight,_Weight
	];

	_statsSaved = true; 

	[[_statsSaved,_class,_id,_Owners,_Trunk,_MaxWeight,_Weight,_LicPlate,_LicPlate_String], "RPP_DB_VehicleStorage_Client_SaveCheck", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Server_UpdateStats";

["RPP_DB_VehicleStorage_Client_SaveCheck", {
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
publicVariable "RPP_DB_VehicleStorage_Client_SaveCheck";