/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Groups.sqf

Description:
Database for Gangs
*/

["RPP_DB_Gang_Client_LoadData", {
	[[player], "RPP_DB_Gang_Server_DataCheck",false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_LoadData";

["RPP_DB_Gang_Server_DataCheck", {
	private ["_player","_playerUID","_databasePull"];

	_player = _this select 0;
	_LicPlate_String = getPlayerUID _player;

	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT EXISTS(SELECT RPP_UID FROM Groups WHERE RPP_UID = '%1')']", _LicPlate_String];
	[[_databasePull], "RPP_DB_Gang_Client_DataCheckAcc", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Server_DataCheck";

["RPP_DB_Gang_Client_DataCheckAcc", {
	private ["_return"];
	_return = _this select 0;
	_return = call compile _return;
	_return = (_return select 0) select 0;
	
	RPP_DB_User_Exist = _return;
	if ("0" in RPP_DB_User_Exist) then {
		[] call RPP_DB_Gang_Client_GangLoadStats;
	}
	else
	{
		systemChat "Error no gangs found.";
	};
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_DataCheckAcc";

["RPP_DB_Gang_Client_CreateUser", {
	[] spawn {
		closeDialog 1;
		_Leader = player;
		_UID = getPlayerUID _Leader;
		_Members = [name player];
		RPP_GangName = ctrlText 1400;
		_AreaOwning = [];
		_Open = true;
		RPP_GangLoad = false;
		RPP_GangCanCreate = false;

		if (RPP_GangName isEqualTo "") exitWith {
			_msg = "Please enter a Gang Name.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		[[player], "RPP_DB_Gang_Server_CheckLoadStats",false] call BIS_FNC_MP;
		waitUntil {RPP_GangLoad};
		if (!(RPP_GangCanCreate)) exitWith {
			_msg = "You already own a gang or this name may be already taken.";
			_Color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};

		[[_Leader,_UID,_Members,RPP_GangName,_AreaOwning,_Open], "RPP_DB_Gang_Server_CreateUser", false] call BIS_FNC_MP;
	};
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_CreateUser";

["RPP_DB_Gang_Server_CreateUser", {
	private ["_Leader","_Name_Leader","_UID","_Members","_Gang_Name","_AreaOwning","_Open"];
	_Leader = _this select 0;
	_Name_Leader = name _Leader;
	_UID = _this select 1;
	_Members = _this select 2;
	_Gang_Name = _this select 3;
	_AreaOwning = _this select 4;
	_Open = _this select 5;

	"Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'INSERT into Groups 

(
RPP_UID,RPP_Group_Leader,RPP_Group_Members,
RPP_Group_Name,RPP_Group_AreaOwning,RPP_Group_Open
) 

VALUES 

('%1','%2','%3','%4','%5','%6')']",

_UID,_Name_Leader,_Members,_Gang_Name,_AreaOwning,_Open
];

[[_Gang_Name], "RPP_DB_Gang_Client_GangCreated",_Leader] call BIS_FNC_MP;

}] call RPP_Function;
publicVariable "RPP_DB_Gang_Server_CreateUser";

["RPP_DB_Gang_Client_GangCreated", {
	_Gang_Name = _this select 0;
	_msg = format ["Successfully created gang: %1",_Gang_Name];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_GangCreated";

["RPP_DB_Gang_Client_LoadStats", {
	[[player], "RPP_DB_Gang_Server_LoadStats", false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_LoadStats";

["RPP_DB_Gang_Client_LoadStatsVehicle", {
	_plate = _this select 0;
	[[player,_plate], "RPP_DB_Gang_Server_LoadVehicle", false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_LoadStatsVehicle";

["RPP_DB_Gang_Server_LoadVehicle", {
	private ["_player","_playerUID","_databasePull"]; 

	_player = _this select 0;
	_plate = _this select 1;
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT * FROM Groups WHERE RPP_Group_Name = '%1'']", _plate];

	[[_databasePull], "RPP_DB_Gang_Client_GetStatsVehicle", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Server_LoadVehicle";

["RPP_DB_Gang_Client_GetStatsVehicle", {
	private ["_return"];

	_return = _this select 0;
	_return = call compile _return;
	_return = (_return select 0) select 0;
	[_return] call RPP_DB_Gang_Client_SetStatsVehicle;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_GetStatsVehicle";

["RPP_DB_Gang_Client_SetStatsVehicle", {
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

	[[_RPP_Vehicles_LicensePlate_String], "RPP_DB_Gang_Server_DeleteVehicle",false] spawn BIS_fnc_MP;

	_veh = _RPP_Vehicles_Type createVehicle (position RPP_Gang_Spawn);
	_dir = getdir(RPP_Gang_Spawn);
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

	[_veh,_RPP_Vehicles_LicensePlate] call RPP_Licenseplate_RePlace;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_SetStatsVehicle";

["RPP_DB_Gang_Server_DeleteVehicle", {
	private ["_plate","_databasePull"]; 

	_plate = _this select 0;
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'DELETE FROM Groups WHERE RPP_Vehicles_LicensePlate_String = '%1'']", _plate];
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Server_DeleteVehicle";

["RPP_DB_Gang_Server_MembersLoadStats", {
	private ["_player","_playerUID","_databasePull"]; 

	_player = _this select 0;
	_uid = getPlayerUID _player;
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT DISTINCT * FROM Groups']", _uid];

	[[_databasePull], "RPP_DB_Gang_Client_MembersGetStats", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Server_MembersLoadStats";

["RPP_DB_Gang_Client_MembersGetStats", {
	private ["_return"];

	_return = _this select 0;
	_return = call compile _return;
	//_return = (_return select 0) select 0;
	[_return] call RPP_DB_Gang_Client_SetStats;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_MembersGetStats";

["RPP_DB_Gang_Client_MembersSetStats", {
	private ["_statsArray"];
	_statsArray = _this select 0;
	_Listbox = [];
	_t = [];
	_t = _t + [_statsArray];
	_t = (_t select 0) select 0;

	if ("Error" in _statsArray) exitWith {
		lbAdd [1500, "No Gangs found"];
	};
	lbClear 1500;
	lbAdd [1500, "=== Gang Members ==="];
	{
		_UID = _this select 1;
		_Members = _this select 3;
		_Name = "";
		if (getPlayerUID player == _UID) exitWith {
			{
				_Name = _x;
				if (_Name in _Listbox) exitWith {};
				_Listbox = _Listbox + [_Name];

				_Gangs = lbAdd [1500, format ["%1",_Name]];
				lbSetData [1500, _Gangs, _Name];
			} foreach _Members;
		};
	} foreach _t;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_MembersSetStats";

["RPP_DB_Gang_Server_CaptureLoadStats", {
	private ["_player","_playerUID","_databasePull"]; 

	_player = _this select 0;
	_uid = getPlayerUID _player;
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT DISTINCT * FROM Groups']", _uid];

	[[_databasePull], "RPP_DB_Gang_Client_CaptureGetStats", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Server_CaptureLoadStats";

["RPP_DB_Gang_Client_CaptureGetStats", {
	private ["_return"];

	_return = _this select 0;
	_return = call compile _return;
	_return = (_return select 0) select 0;
	[_return] call RPP_DB_Gang_Client_CaptureSetStats;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_CaptureGetStats";

["RPP_DB_Gang_Client_CaptureSetStats", {
	private ["_statsArray"];
	_statsArray = _this select 0;
	_UID = _statsArray select 1;
	_Leader = _statsArray select 2;
	_Members = _statsArray select 3;
	_Name = _statsArray select 4;
	_AreaOwning = _statsArray select 5;
	_Open = _statsArray select 6;

	RPP_GangAreas = RPP_GangAreas + [[RPP_GangDis,RPP_GangArea,_Name,_UID,_Members]];
	publicVariable "RPP_GangAreas";

	_msg = format ["%1 just Captured the %2",_Name,RPP_GangArea];
	[_msg] call RPP_Message_Global;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_CaptureSetStats";

["RPP_DB_Gang_Server_CheckLoadStats", {
	private ["_player","_playerUID","_databasePull"]; 

	_player = _this select 0;
	_uid = getPlayerUID _player;
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT DISTINCT * FROM Groups']", _uid];

	[[_databasePull], "RPP_DB_Gang_Client_CheckGetStats", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Server_CheckLoadStats";

["RPP_DB_Gang_Client_CheckGetStats", {
	private ["_return"];

	_return = _this select 0;
	_return = call compile _return;
	//_return = (_return select 0) select 0;
	[_return] call RPP_DB_Gang_Client_CheckSetStats;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_CheckGetStats";

["RPP_DB_Gang_Client_CheckSetStats", {
	private ["_statsArray"];
	_statsArray = _this select 0;
	_Listbox = [];
	_t = [];
	_t = _t + [_statsArray];
	_t = (_t select 0) select 0;

	if ("Error" in _statsArray) exitWith {
		hint "Error in Group Database.";
	};
	_c = false;
	{
		if (_x select 1 == getPlayerUID player) exitWith {
			RPP_GangCanCreate = false;
			RPP_GangLoad = true;
			_c = true;
		};
		if (_x select 4 == RPP_GangName) exitWith {
			RPP_GangCanCreate = false;
			RPP_GangLoad = true;
			_c = true;
		};
	} count _t;
	if (!(_c)) then {
		RPP_GangCanCreate = true;
		RPP_GangLoad = true;
	};
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_CheckSetStats";

["RPP_DB_Gang_Server_LoadStats", {
	private ["_player","_playerUID","_databasePull"]; 

	_player = _this select 0;
	_uid = getPlayerUID _player;
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT DISTINCT * FROM Groups']", _uid];

	[[_databasePull], "RPP_DB_Gang_Client_GetStats", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Server_LoadStats";

["RPP_DB_Gang_Client_GetStats", {
	private ["_return"];

	_return = _this select 0;
	_return = call compile _return;
	//_return = (_return select 0) select 0;
	[_return] call RPP_DB_Gang_Client_SetStats;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_GetStats";

["RPP_DB_Gang_Client_SetStats", {
	private ["_statsArray"];
	_statsArray = _this select 0;
	_Listbox = [];
	_t = [];
	_t = _t + [_statsArray];
	_t = (_t select 0) select 0;

	if ("Error" in _statsArray) exitWith {
		hint "Database return error";
	};
	lbClear 1500;
	lbAdd [1500, "=== Gangs ==="];
	{
		_GangLeader = _x select 2;
		_GangName = _x select 4;


		if (_GangName in _Listbox) exitWith {};
		_Listbox = _Listbox + [_GangName];

		_Gangs = lbAdd [1500, format ["%1 | %2",_GangName,_GangLeader]];
		lbSetData [1500, _Gangs, _GangName];
	} foreach _t;
	lbAdd [1500,""];
	lbAdd [1500,"=== Gang Areas ==="];
	{
		_Area = _x select 1;
		_gangName = _x select 2;
		if (_GangName == "") then {
			lbAdd [1500, format ["%1 | NOT CAPTURED",_Area]];
		} else {
			lbAdd [1500, format ["%1 | %2",_Area,_gangName]];
		};
	} foreach RPP_GangAreas;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_SetStats";

["RPP_DB_Gang_Client_UpdateStats", {
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
		[[player,_class,_id,_Owners,_Trunk,_MaxWeight,_Weight,_LicPlate,_LicPlate_String], "RPP_DB_Gang_Server_UpdateStats", false] spawn BIS_fnc_MP;
	};
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Client_UpdateStats";

["RPP_DB_Gang_Server_UpdateStats", {
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

	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'UPDATE Groups SET 

	RPP_UID='%1',RPP_Vehicles_Name='%2',RPP_Vehicles_ID='%3',
	RPP_Vehicles_Type='%4',RPP_Vehicles_LicensePlate='%5',
	RPP_Vehicles_LicensePlate_String='%6',RPP_Vehicles_Trunk='%7',
	RPP_Vehicles_MaxWeight='%8',RPP_Vehicles_Weight='%9'

	WHERE RPP_Vehicles_LicensePlate = '%1' ']",
		_id,_Owners,"RPP",_class,_LicPlate,_LicPlate_String,_Trunk,_MaxWeight,_Weight
	];

	_statsSaved = true; 

	[[_statsSaved,_class,_id,_Owners,_Trunk,_MaxWeight,_Weight,_LicPlate,_LicPlate_String], "RPP_DB_Gang_Client_SaveCheck", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_Gang_Server_UpdateStats";

["RPP_DB_Gang_Client_SaveCheck", {
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
publicVariable "RPP_DB_Gang_Client_SaveCheck";