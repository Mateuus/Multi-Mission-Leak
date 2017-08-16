#include "\RPProject_ServerNew\macros.hpp"
/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_extDB_Vehicle.sqf

Description:
extDB database stuff
*/
["RPP_DB_insertVehicle", {
	private ["_pid","_veh"];
 	_pid = _this select 0;
 	_veh = _this select 1;
 	_player = _this select 2;

  	_name = name _player;
  	_classname = _veh getVariable "RPP_Vehicle_Class";
  	_trunk = _veh getVariable "RPP_Vehicle_Trunk";
  	_owners = _veh getVariable "RPP_Vehicle_Owners";
  	_isveh = _veh getVariable "RPP_Vehicle_isVeh";
  	_maxweight = _veh getVariable "RPP_Vehicle_MaxWeight";
  	_weight = _veh getVariable "RPP_Vehicle_Weight";
  	_plate = _veh getVariable "RPP_Vehicle_Licenseplate";
  	_active = 1;
  	_vehstatus = [];
  	_upgrades = 0;
  	_fuel = fuel _veh;
  	_dmg = damage _veh;
  	_vehstatus = _vehstatus + [_fuel,_dmg];

	_query = format["SELECT VehicleStorage FROM vehicles WHERE players='%1'", _pid];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Vehicle Insert Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if(count _result isEqualTo 0) then {
		_query = format["INSERT INTO vehicles(pid, name, classname, plate, active, trunk, MaxWeight, Weight, VehStatus, upgrades, isveh, owners) VALUES ('%1', '%2', '%3', '%4', '%5', '""[]""', '%7', '%8', '%9', '%10', '%11', '""[]""')", _pid, _name, _classname, _plate, _active, _trunk, _maxweight, _weight, _vehstatus, _upgrades, _isveh, _owners];
		diag_log format["INSERT QUERY: %1",_query];
		[_query,1] call RPP_DB_ASYNC;
	} else {
		diag_log format ["???Failed to INSERT Plate number: %1 because its already in the database???",_plate];
	};

  	if(_query == "") exitWith {};
}] call RPP_Function;
publicVariable "RPP_DB_insertVehicle";

["RPP_DB_LoadVeh_Storage", {
	private ["_query", "_result", "_curTime", "_tmp"];
	_ownerID = param [0,ObjNull,[ObjNull]];
	_uid = param [1,"",[""]];
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;
	diag_log format ["UID: %1",_uid];
	_query = format["SELECT pid, name, classname, plate, active, trunk, MaxWeight, Weight, VehStatus, upgrades, isveh, owners FROM vehicles WHERE pid='%1'", _uid];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Storage Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";



		_tmp = _result select 1;
		_result set[1,[_tmp] call RPP_safeNumber];

		_tmp = _result select 2;
		_result set[2,[_tmp] call RPP_safeString]; 

		_tmp = _result select 3;
		_result set[3,[_tmp] call RPP_safeString]; 

		_tmp = _result select 4;
		_result set[4,[_tmp] call RPP_safeNumber];

		_tmp = _result select 5;
		_result set[5,[_tmp] call RPP_safeNumber];

		_new = [(_result select 6)] call RPP_SQLToArr;
		if(_new isEqualType "") then {_new = call compile format["%1", _new];};
		_result set[6,_new];

		_tmp = _result select 7;
		_result set[7,[_tmp] call RPP_safeNumber];


		_tmp = _result select 8;
		_result set[8,[_tmp] call RPP_safeNumber];

		_tmp = _result select 9;
		_result set[9];

		_tmp = _result select 10;
		_result set[10,[_tmp] call RPP_safeNumber];

		_tmp = _result select 11;
		_result set[11];

		_tmp = _result select 12;
		_result set[12];

		_result remoteExec ["RPP_loadVehicle_Data",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_LoadVeh_Storage";

["RPP_DB_LoadVeh_Trunk", {
	[_this select 0,_this select 1] spawn {
		sleep 0.3;
		private ["_query", "_result", "_curTime", "_tmp"];
		_ownerID = param [0,ObjNull,[ObjNull]];
		_plate = _this select 1;
		if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
		_ownerID = owner _ownerID;

		_query = format["SELECT pid, name, classname, plate, active, trunk, MaxWeight, Weight, VehStatus, upgrades, isveh, owners FROM vehicles WHERE plate='%1'", _plate];

		_curTime = diag_tickTime;
		_result = [_query,2] call RPP_DB_ASYNC;

		diag_log "------------- Fetch Trunk Request -------------";
		diag_log format["QUERY: %1",_query];
		diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
		diag_log format["Result: %1",_result];
		diag_log "------------------------------------------------";



		_tmp = _result select 1;
		_result set[1];

		_tmp = _result select 2;
		_result set[2]; 

		_tmp = _result select 3;
		_result set[3];

		_tmp = _result select 4;
		_result set[4,[_tmp] call RPP_safeNumber]; 
		
		_tmp = _result select 6;
		_result set[6,[_tmp] call RPP_safeNumber];

		_tmp = _result select 7;
		_result set[7,[_tmp] call RPP_safeNumber];

		/* Check the weight before we load the trunk */

		if (_tmp isEqualTo 0) exitWith {
			[] remoteExec ["RPP_loadVehicle_Trunk_Empty",_ownerID];
		};

		_new = [(_result select 5)] call RPP_SQLToArr;
		if(_new isEqualType "") then {_new = call compile format["%1", _new];};
		_result set[5,_new];

		_tmp = _result select 8;
		_result set[8];

		_tmp = _result select 9;
		_result set[9,[_tmp] call RPP_safeNumber];

		_tmp = _result select 10;
		_result set[10];

		_tmp = _result select 11;
		_result set[11];

		_result remoteExec ["RPP_loadVehicle_Trunk",_ownerID];
	};
}] call RPP_Function;
publicVariable "RPP_DB_LoadVeh_Trunk";

["RPP_loadVehicle_Trunk_Empty", {
	lbClear 1500;
	lbAdd [1500, "The Trunk is empty."];

	{	
		_item = _x select 0;
		_itemAmount = [_x select 0] call RPP_Inventory_Count;
		_data_Inventory = lbAdd [1501, format ["%1 (x%2)",_item,_itemAmount]];
		lbSetData [1501, _data_Inventory, _item];
	} foreach RPP_Inventory;

	buttonSetAction [1600, "[] call RPP_VehicleMenu_StoreItem;"];
	buttonSetAction [1601, "[] call RPP_VehicleMenu_TakeItem;"];
}] call RPP_Function;
publicVariable "RPP_loadVehicle_Trunk_Empty";


["RPP_loadVehicle_Trunk", {
	session_finished = false;

	lbClear 1500;

	_Name = _this select 1;
	_classname = _this select 2;
	_plate = _this select 3;
	_active = parseNumber (_this select 4);
	_trunk = _this select 5;
	_maxweight = parseNumber (_this select 6);
	_weight = parseNumber (_this select 7);
	_vehstatus = _this select 8;
	_upgrades = parseNumber (_this select 9);
	_isveh = _this select 10;
	_owners = _this select 11;
	
	lbAdd [1500, format ["=== Weight: %1/%2 ===",_weight,_maxweight]];
	{	
		_item = _x select 0;
		_itemAmount = [_x select 0] call RPP_VehicleTrunk_Count;
		if (!(_itemAmount <= 0)) then {
			_data_Trunk = lbAdd [1500, format ["%1 (x%2)",_item,_itemAmount]];
			lbSetData [1500, _data_Trunk, _item];
		};
	} foreach _trunk;

	{	
		_item = _x select 0;
		_itemAmount = [_x select 0] call RPP_Inventory_Count;
		_data_Inventory = lbAdd [1501, format ["%1 (x%2)",_item,_itemAmount]];
		lbSetData [1501, _data_Inventory, _item];
	} foreach RPP_Inventory;

	buttonSetAction [1600, "[] call RPP_VehicleMenu_StoreItem;"];
	buttonSetAction [1601, "[] call RPP_VehicleMenu_TakeItem;"];
}] call RPP_Function;
publicVariable "RPP_loadVehicle_Trunk";

["RPP_loadVehicle_Data", {
	session_finished = false;

	lbClear 1500;

	_pid = _this select 1;
	_Name = _this select 2;
	_classname = _this select 3;
	_plate = _this select 4;
	_active = parseNumber (_this select 5);
	_trunk = _this select 6;
	_maxweight = parseNumber (_this select 7);
	_weight = parseNumber (_this select 8);
	_vehstatus = _this select 9;
	_upgrades = parseNumber (_this select 10);
	_isveh = _this select 11;
	_owners = _this select 12;

	_text = getText (configFile >> 'CfgVehicles' >> _classname >> 'displayName');

	_vehVariables = [];

	_vehVariables = _vehVariables + [ [_classname,_plate,_active,_trunk,_maxweight,_weight,_vehstatus,_upgrades,_isveh,_owners] ];

	_data = lbAdd [1500, format ["T: %1 | %2",_text,_plate]];
	lbSetData [1500, _data, _vehVariables];

	RPP_VehicleDB_StatsLoaded = true;
}] call RPP_Function;
publicVariable "RPP_loadVehicle_Data";


["RPP_DB_partialSync_Vehicle", {
	private ["_query","_mode", "_data", "_plate"];
	params ["_mode", "_data", "_plate"];
	diag_log format ["parmas test: %1 | %2 | %3",_mode,_data,_plate];
	switch (_mode) do {
		case 0: {
			_data = [_data] call RPP_safeNumber;
			_query = format["UPDATE vehicles SET Weight='%1' WHERE plate='%2'", _data, _plate];
		};

		case 1: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE vehicles SET owners='%1' WHERE plate='%2'", _data, _plate];
		};

		case 2: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE vehicles SET trunk='%1' WHERE plate='%2'", _data, _plate];
		};

		case 3: {
			_data = [_data] call RPP_safeNumber;
			_query = format["UPDATE vehicles SET active='%1' WHERE plate='%2'", _data, _plate];
		};

		case 4: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE vehicles SET vehstatus='%1' WHERE plate='%2'", _data, _plate];
		};

		case 5: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE players SET VehicleStorage='%1' WHERE pid='%2'", _data, _plate];
			_result = [_query,2] call RPP_DB_ASYNC;
		};

	};

	if(_query == "") exitWith {};

	[_query,1] call RPP_DB_ASYNC;
}] call RPP_Function;
publicVariable "RPP_DB_partialSync_Vehicle";

["RPP_DB_VehicleStorage_load", {
	params ["_pid","_player"];
	_query = format["SELECT VehicleStorage FROM players WHERE pid = '%1'", _pid];

	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log format ["Query: %1",_query];
	diag_log format ["Result: %1",_result];

	_new = [(_result select 0)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[0,_new];


	[_result] remoteExec ["RPP_DB_VehicleStorage_SendLoad", _player];
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_load";

["RPP_DB_VehicleStorage_SendLoad", {
	params ["_stats"];

	lbClear 1501;

	lbAdd [1501, "=== Vehicle Storage ==="];
	{
		_classname = _x select 0;
		_Buyer = _x select 1;
		_isveh = _x select 2;
		_trunk = _x select 3;
		_owners = _x select 4;
		_maxweight = _x select 5;
		_weight = _x select 6;
		_licplate = _x select 7;
		_Status = _x select 8;
		_active = _x select 9;
		_upgrades = _x select 10;

		_VehicleStorage_UPDATE = _VehicleStorage_UPDATE + [ [_classname,_trunk,_owners,_isveh,_maxweight,_weight,_plate,_active,_vehstatus,_upgrades] ];

		_licplate_String = format ["%1%2%3%4%5%6%7",_licplate select 0, _licplate select 1, _licplate select 2, _licplate select 3, _licplate select 4,_licplate select 5, _licplate select 6];	
		_text = getText (configFile >> 'CfgVehicles' >> _classname >> 'displayName');
		_Vehicles = lbAdd [1501, format ["%1 | Plate: %2 ",_text,_licplate_String]];
		lbSetData [1501, _Vehicles, str _licplate_String];
	} count _stats;

	lbAdd [1501, ""];

	lbAdd [1501, "=== Your Vehicles ==="];
	RPP_Vehicle_StorageInput = [];
	_Car = "";
	_dmg = "";
	_fuel = "";
	_idCar = "";

	{
		_idCar = _x getVariable "RPP_Vehicles_Buyer";
		if (_idCar == getPlayerUID player) then {
			_car = _x;
			_dmg = damage _car;
			_fuel = fuel _car;
			_Classname = _x getVariable "RPP_Vehicle_Class";
			_id = _x getVariable "RPP_Vehicle_ID";
			_Buyer = _x getVariable "RPP_Vehicles_Buyer";
			_isveh = _x getVariable "RPP_Vehicle_isVeh";
			_trunk = _x getVariable "RPP_Vehicle_Trunk";
			_owners = _x getVariable "RPP_Vehicle_Owners";
			_trunkopen = _x getVariable "RPP_Vehicle_TrunkOpen";
			_maxweight = _x getVariable "RPP_Vehicle_MaxWeight";
			_weight = _x getVariable "RPP_Vehicle_Weight";
			_licplate = _x getVariable "RPP_Vehicle_Licenseplate";
			_distance = round(player distance _car);
			RPP_Vehicle_StorageInput = RPP_Vehicle_StorageInput + 
			[[
			_car,_classname,_dmg,_fuel,_id,_Buyer,_isveh,_trunk,
			_owners,_trunkopen,_maxweight,_weight,_licplate,_distance
			]];
		};
	} foreach nearestObjects [getpos player, ["Car","Truck","Air","Boat"], 25];

	{
		_car = _x select 0;
		_Classname = _x select 1;
		_licplate = _x select 12;
		_licplate_String = format ["%1%2%3%4%5%6%7",_licplate select 0, _licplate select 1, _licplate select 2, _licplate select 3, _licplate select 4,_licplate select 5, _licplate select 6];
		_distance = _x select 13;
		_text = getText (configFile >> 'CfgVehicles' >> _classname >> 'displayName');
		_data2 = lbAdd [1501, format ["%1 | Plate: %2 | %3 Meters away",_text,_licplate_String,_distance]];

		_array = [_car,_classname];

		lbSetData [1501, _data2, str _licplate_String];
	} foreach RPP_Vehicle_StorageInput;

	buttonSetAction [1600, "[] call RPP_Vehicle_Storage_Output;"];
	buttonSetAction [1601, "[] call RPP_Vehicle_Storage_Input;"];

	RPP_VehicleDB_StatsLoaded = true;
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_SendLoad";

["RPP_DB_VehicleStorage_insert", {
	params ["_pid","_StoreArray","_player"];
	_StoreArray = [_StoreArray] call RPP_ArrToSQL;
  	_name = name _player;



	_query = format["SELECT VehicleStorage FROM players WHERE pid='%1'", _pid];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch VehicleStorage Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1 | test",_result];
	diag_log "------------------------------------------------";

  	if(_query == "") exitWith {
  		diag_log "EMPTY QUERY";
  	};


	_new = [(_result select 0)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[0,_new];

	_new = [(_StoreArray)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[1,_new];

  	[5,_result, _pid] remoteExec ["RPP_DB_partialSync_Vehicle", 2];

  	_result = [_query,2] call RPP_DB_ASYNC;
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_insert";

["RPP_DB_VehicleStorage_output", {
	params ["_pid","_car","_player"];
	_query = format["SELECT VehicleStorage FROM players WHERE pid = '%1'", _pid];

	_result = [_query,2] call RPP_DB_ASYNC;

	_new = [(_result select 2)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[2,_new];

	[6,[_result,_car],_pid] remoteExec ["RPP_DB_partialSync_Vehicle",2];

	[_car] remoteExec ["RPP_DB_VehicleStorage_Spawn", _player];
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_output";

["RPP_DB_VehicleStorage_Spawn", {
	params ["_veh"];

	_classname = _veh select 0;
	_trunk = _veh select 1;
	_owners = _veh select 2;
	_isveh = _veh select 3;
	_maxweight = _veh select 4;
	_weight = _veh select 5;
	_plate = _veh select 6;
	_active = _veh select 7;
	_vehstatus = _veh select 8;
	_upgrades = _veh select 9;

	_fuel = _vehstatus select 0;
	_dmg = _vehstatus select 1;


  	systemChat "Vehicle spawned.";
}] call RPP_Function;
publicVariable "RPP_DB_VehicleStorage_Spawn";
