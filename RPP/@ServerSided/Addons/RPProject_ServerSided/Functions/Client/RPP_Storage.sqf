/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Storage.sqf

Description:
for storring
*/
["RPP_Vehicle_Storage_Dialog", {
	private ["_classname","_text","_VehClose","_Car","_dmg","_fuel"];

	createDialog "RPP_VehicleStorage_Dialog";
	buttonSetAction [1600, "[] call RPP_Vehicle_Storage_Output;"];
	buttonSetAction [1601, "[] call RPP_Vehicle_Storage_Input;"];

	RPP_VehicleStorage_Spawn = _this select 0;

	lbAdd [1500, "=== Vehicle Storage ==="];
	_classname = "";
	_text = "";
	{
		_Classname = _x select 0;
		_licplat_S = _x select 12;
		_text = getText (configFile >> 'CfgVehicles' >> _classname >> 'displayName');
		_Storage = lbAdd [1500, format ["%1 | Plate: %2",_text,_licplat_S]];
		lbSetData [1500, _Storage, _licplat_S];
	} foreach RPP_Vehicle_Storage;
	lbAdd [1500, ""];

	lbAdd [1500, "=== Your Vehicles ==="];
	RPP_Vehicle_StorageInput = [];
	_Car = "";
	_dmg = "";
	_fuel = "";
	_idCar = "";

	{
		_idCar = _x getVariable "RPP_Vehicles_Buyer";
		if (_idCar == name player) then {
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
			_licplat_String = _x getVariable "RPP_LicensePlate_String";
			_distance = round(player distance _car);
			RPP_Vehicle_StorageInput = RPP_Vehicle_StorageInput + 
			[[
			_car,_classname,_dmg,_fuel,_id,_Buyer,_isveh,_trunk,
			_owners,_trunkopen,_maxweight,_weight,_licplate,_licplat_String,_distance
			]];
		};
	} foreach nearestObjects [getpos player, ["Car","Truck","Air","Boat"], 25];

	{
		_Classname = _x select 1;
		_licplat_String = _x select 13;
		_distance = _x select 14;
		_text = getText (configFile >> 'CfgVehicles' >> _classname >> 'displayName');
		_Vehicles = lbAdd [1500, format ["%1 | Plate: %2 | %3 Meters away",_text,_licplat_String,_distance]];
		lbSetData [1500, _Vehicles, _licplat_String];
	} foreach RPP_Vehicle_StorageInput;
}] call RPP_Function;
publicVariable "RPP_Vehicle_Storage_Dialog";

["RPP_Vehicle_Storage_Output", {
	private ["_data","_msg","_color","_Array","_classname","_dmg","_fuel","_veh"];
	if (lbCurSel 1500 == -1) exitWith {
		_msg = "Please select a vehicle first!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_data = lbData [ 1500, ( lbCurSel 1500 ) ];
	if (_data == "") exitWith {
		_msg = "Please select a vehicle first!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	{
		if (_data == _x select 12) exitWith {
			_classname = _x select 0;
			_dmg = _x select 1;
			_fuel = _x select 2;
			_id = _x select 3;
			_Buyer = _x select 4;
			_isveh = _x select 5;
			_trunk = _x select 6;
			_owners = _x select 7;
			_trunkopen = _x select 8;
			_maxweight = _x select 9;
			_weight = _x select 10;
			_licplate = _x select 11;
			_licplat_String = _x select 12;

			_veh = _classname createVehicle (position RPP_VehicleStorage_Spawn);
			_dir = getdir(RPP_VehicleStorage_Spawn);
			_veh setDir _dir;
			_veh setFuel _fuel;
			_veh setDamage _dmg;
			_veh lock true;

			_veh setVariable ["RPP_Vehicle_Class",_classname,true];
			_veh setVariable ["RPP_Vehicle_ID",_id,true];
			_veh setVariable ["RPP_Vehicles_Buyer",_Buyer,true];
			_veh setVariable ["RPP_Vehicle_isVeh",_isveh,true];
			_veh setVariable ["RPP_Vehicle_Trunk",_trunk,true];
			_veh setVariable ["RPP_Vehicle_Owners",_owners,true];
			_veh setVariable ["RPP_Vehicle_TrunkOpen",_trunkopen,true];
			_veh setVariable ["RPP_Vehicle_MaxWeight",_maxweight,true];
			_veh setVariable ["RPP_Vehicle_Weight",_weight,true];
			_veh setVariable ["RPP_Vehicle_Licenseplate",_licplate,true];

			[_veh,_licplate] call RPP_Licenseplate_RePlace;

			[[
			_veh,_classname,_id,_Buyer,_isveh,_trunk,_owners,_trunkopen,_maxweight,_weight,_licplate,_licplat_String
			], "RPP_Vehicle_Storage_ConfigVehicle", true, true] call BIS_FNC_MP;

			_msg = "Vehicle Retrieved!";
			_color = RPP_Green;
			[_msg,_color] call RPP_MessageSystem;

			RPP_Vehicle_Storage = RPP_Vehicle_Storage - [_x];
		};
	} count RPP_Vehicle_Storage;

	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_Vehicle_Storage_Output";

["RPP_Vehicle_Storage_ConfigVehicle", {
	_veh = _this select 0;
	_classname = _this select 1;
	_id = _this select 2;
	_Buyer = _this select 3;
	_isveh = _this select 4;
	_trunk = _this select 5;
	_owners = _this select 6;
	_trunkopen = _this select 7;
	_maxweight = _this select 8;
	_weight = _this select 9;
	_Licplate = _this select 10;
	_licplat_String = _this select 11;
	
	_veh setVariable ["RPP_Vehicle_Class",_classname,true];
	_veh setVariable ["RPP_Vehicle_ID",_id,true];
	_veh setVariable ["RPP_Vehicles_Buyer",_Buyer,true];
	_veh setVariable ["RPP_Vehicle_isVeh",_isveh,true];
	_veh setVariable ["RPP_Vehicle_Trunk",_trunk,true];
	_veh setVariable ["RPP_Vehicle_Owners",_owners,true];
	_veh setVariable ["RPP_Vehicle_TrunkOpen",_trunkopen,true];
	_veh setVariable ["RPP_Vehicle_MaxWeight",_maxweight,true];
	_veh setVariable ["RPP_Vehicle_Weight",_weight,true];
	_veh setVariable ["RPP_Vehicle_Licenseplate",_licplate,true];
	_veh setVariable ["RPP_LicensePlate_String",_licplat_String,true];
}] call RPP_Function;
publicVariable "RPP_Vehicle_Storage_ConfigVehicle";

["RPP_Vehicle_Storage_Input", {
	private ["_data","_msg","_color","_Array","_classname","_dmg","_fuel"];
	if (lbCurSel 1500 == -1) exitWith {
		_msg = "Please select a vehicle first!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_data = lbData [ 1500, ( lbCurSel 1500 ) ];
	if (_data == "") exitWith {
		_msg = "Please select a vehicle first!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
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

			RPP_Vehicle_Storage = RPP_Vehicle_Storage + 
			[[
			_classname,_dmg,_fuel,_id,_Buyer,_isveh,_trunk,
			_owners,_trunkopen,_maxweight,_weight,_licplat,_licplat_String
			]];
			deleteVehicle _del;
			_msg = "Vehicle Stored!";
			_color = RPP_Green;
			[_msg,_color] call RPP_MessageSystem;
		};
	} count RPP_Vehicle_StorageInput;
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_Vehicle_Storage_Input";