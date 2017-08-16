/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_OnlineShopping.sqf

Description:
Shopping online
*/
["RPP_OnlineShopping_Dialog", {
	private ["_Type","_Data"];
	createDialog "RPP_OnlineShop";
	buttonSetAction [1601, "[] call RPP_OnlineShopping_Buy;"];
	buttonSetAction [1602, "closeDialog 1;"];

	{
		_Type = _x select 0;
		_Data = lbAdd [2101, format ["%1",_Type]];
		lbSetData [2101, _Data, "RPP_Type"];
	} foreach RPP_OnlineShopping_Type;
}] call RPP_Function;
publicVariable "RPP_OnlineShopping_Dialog";

["RPP_OnlineShop_FindeType", {
	if (lbCurSel 2101 == -1) exitWith {};
	private ["_Array","_type","_shopOwner","_Name"];
	_Array = RPP_OnlineShopping_Type select (lbCurSel 2101);
	_type = _Array select 0;
	_shopOwner = "";
	_Name = "";
	lbClear 2100;
	{
		_shopOwner = _x select 1;
		_getType = _x select 2;
		if (_getType isEqualTo _type) then {
			_Name = "";
			{
				_Name = _x select 5;
			} count call compile format ["%1",_shopOwner];

			_Data = lbAdd [2100, format ["%1",_Name]];
			lbSetData [2100, _Data, _x select 0];
		};
	} foreach RPP_OnlineShopping_Shops;
}] call RPP_Function;
publicVariable "RPP_OnlineShop_FindeType";


["RPP_OnlineShop_FindeShop", {
	private ["_c","_data_Type","_Array","_Shop","_Owner","_Type"];
	_c = true;
	if (lbCurSel 2101 isEqualTo -1) exitWith {};
	if (lbCurSel 2100 isEqualTo -1) exitWith {};
	RPP_Online_data_shop = lbData [ 2100, ( lbCurSel 2100 ) ];
	_data_Type = lbData [ 2101, ( lbCurSel 2101 ) ];
	_Array = RPP_OnlineShopping_Shops select (lbCurSel 2101);
	_Shop = _Array select 0;
	_Owner = _Array select 1;
	_Type = _Array select 2;
	RPP_Online_DeliveryPrice = _Array select 3;

	lbClear 1500;
	switch (_Type) do { 
		case "VEHICLE": {
			lbClear 1500;
			{
				_class = _x select 0;
				_name = "";
				_Price = "";
				{
					if (_class == _x select 0) exitWith {
						_name = _x select 2;
						_price = _x select 3;
					};
				} count RPP_Vehicle_Config;
				_Data = lbAdd [1500, format ["%1 ($%2) (Delivery Price $%3)",_name,_price,RPP_Online_DeliveryPrice]];
				lbSetData [1500, _data, _name];
			} foreach call compile format ["%1;",RPP_Online_data_shop];
		}; 
		case "AIR": { 
			lbClear 1500;
			{
				_class = _x select 0;
				_name = "";
				_Price = "";
				{
					if (_class == _x select 0) exitWith {
						_name = _x select 2;
						_price = _x select 3;
					};
				} count RPP_Vehicle_Config;
				lbAdd [1500, format ["%1 ($%2) (Delivery Price $%3)",_name,_price,RPP_Online_DeliveryPrice]];
				lbSetData [1500, _data, _name];
			} foreach call compile format ["%1;",RPP_Online_data_shop];
		}; 
	};
}] call RPP_Function;
publicVariable "RPP_OnlineShop_FindeShop";

["RPP_OnlineShopping_Buy", {
	private ["_Text","_class","_classname","_price","_weight","_TotalPrice"];
	_Text = lbData [ 1500, ( lbCurSel 1500 ) ];
	if (lbCurSel 1500 isEqualTo -1) exitWith {
		_msg = "Please select something to buy first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_text isEqualTo "") exitWith {
		_msg = "Error Code: 1500 Empty";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	_class = "";
	_classname = "";
	_price = "";
	_weight = "";
	_TotalPrice = 0;

	{
		if (_text == _x select 2) exitWith {
			_class = _x select 0;
			_classname = _x select 1;
			_price = _x select 3;
			_weight = _x select 5;
		};
	} count RPP_Vehicle_Config;

	_TotalPrice = _TotalPrice + RPP_Online_DeliveryPrice;
	_TotalPrice = _TotalPrice + _price;
	if (_TotalPrice > RPP_Bank) exitWith {
		_msg = "You don't have enough money in your bank account.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	_msg = format ["You bought a %1 for $%2",_text,_TotalPrice];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	[_TotalPrice] call RPP_AntiCheat_RemoveBank;
	[_classname,player,_weight] call RPP_OnlineShopping_StoreVehicle;
}] call RPP_Function;
publicVariable "RPP_OnlineShopping_Buy";

["RPP_OnlineShopping_StoreVehicle", {
	private ["_data","_msg","_color","_Array","_classname","_dmg","_fuel"];
	_classname = _this select 0;
	_player = _this select 1;
	_weight = _this select 2;
	_spawn = _classname createVehicle (getMarkerPos "RPP_AppleField");

	RPP_LicensePlateCreated = false;
	RPP_VehicleDB_StatsLoaded = false;
	[_spawn,player,_weight] call RPP_Licenseplate_Create;


	[_spawn,_classname,_weight] spawn {
		_spawn = _this select 0;
		_classname = _this select 1;
		_weight = _this select 2;

		waitUntil{RPP_LicensePlateCreated};

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
				_licplat_String = _x getVariable "RPP_LicensePlate_String";
				_distance = round(player distance _car);
				RPP_Vehicle_StorageInput = RPP_Vehicle_StorageInput + 
				[[
				_car,_classname,_dmg,_fuel,_id,_Buyer,_isveh,_trunk,
				_owners,_trunkopen,_maxweight,_weight,_licplate,_licplat_String,_distance
				]];
			};
		} foreach nearestObjects [getpos _spawn, ["Car","Truck","Air","Boat"], 25];

		_car = _spawn;
		_dmg = damage _car;
		_fuel = fuel _car;
		_Classname = _car getVariable "RPP_Vehicle_Class";
		_id = _car getVariable "RPP_Vehicle_ID";
		_Buyer = _car getVariable "RPP_Vehicles_Buyer";
		_isveh = _car getVariable "RPP_Vehicle_isVeh";
		_trunk = _car getVariable "RPP_Vehicle_Trunk";
		_owners = _car getVariable "RPP_Vehicle_Owners";
		_trunkopen = _car getVariable "RPP_Vehicle_TrunkOpen";
		_maxweight = _car getVariable "RPP_Vehicle_MaxWeight";
		_weight = _car getVariable "RPP_Vehicle_Weight";
		_licplat = _car getVariable "RPP_Vehicle_Licenseplate";
		_licplat_String = _car getVariable "RPP_LicensePlate_String";

		[_licplat_String] call RPP_DB_VehicleStorage_Client_CreateUser;

		systemChat "The vehicle is now in your storage!";
		closeDialog 1;
	};
}] call RPP_Function;
publicVariable "RPP_Vehicle_Storage_Input";