/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Shop.sqf

Description:
Shopping
*/
["RPP_Shop_DialogOpen_Shop", {
	[_this select 0, _this select 1, _this select 2, _this select 3, _this select 4] spawn {
	closeDialog 1;
	private ["_itemList","_stock","_classname","_text","_price"];
	createDialog "RPP_ShopDialog";
	disableSerialization;
	buttonSetAction [1602, "[] call RPP_Shop_Process;"];
	buttonSetAction [1601, "[] call RPP_Shop_AddtoCart_Vehicle;"];
	buttonSetAction [1600, "[] call RPP_Shop_RemoveFromCart;"];
	buttonSetAction [1603, "[] call RPP_ShopManager_DialogOpen;"];

	_text = uiNameSpace getVariable ["RPP_ShopDialog",displayNull];
	_Totalprice = _text displayCtrl 1000;

	RPP_ShopUsing = _this select 0;
	RPP_ShopOwner = _this select 1;
	RPP_ShopSpawn = _this select 2;
	RPP_ShopType = _this select 3;
	RPP_ShopCfg_Type = _this select 4;

	_canUse = false;

	if (!(RPP_ShopType isEqualTo "")) then {
		if (RPP_ShopType isEqualTo "Police") exitWith {
			if (RPP_IsCop) then {
				_canUse = true;
			};
			if (RPP_IsCiv) then {
				_canUse = false;
			};
			if (RPP_IsEMT) then {
				_canUse = false;
			};
		};
		if (RPP_ShopType isEqualTo "EMT") exitWith {
			if (RPP_IsEMT) then {
				_canUse = true;
			};
			if (RPP_IsCop) then {
				_canUse = false;
			};
			if (RPP_IsCiv) then {
				_canUse = false;
			};
		};
		if (RPP_ShopType isEqualTo "Civilian") exitWith {
			if (RPP_IsCiv) then {
				_canUse = true;
			};
			if (RPP_IsCop) then {
				_canUse = true;
			};
			if (RPP_IsEMT) then {
				_canUse = true;
			};
		};
	} else {
		_canUse = true;
	};
	if (!(_canUse)) exitWith {
		_msg = "You are not allowed to access this shop!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
		closeDialog 1;
	};

	_itemList = ((findDisplay 30045) displayCtrl 1500);
	RPP_Shopping_Cart = [];
	RPP_Shopping_Price = 0;
	_stock = "";
	_classname = "";
	_text = "";
	_price = "";
	_Type = "";
	_hg = "";
	{
		_stock = _x select 2;
	} count RPP_ShopOwner;

	switch (RPP_ShopCfg_Type) do {
		_c = false;
		_classname = "";

		case "VEHICLE": {
			{
				_classnameShop = _x select 0;
				{
					if (_classnameShop == _x select 0) then {
						_classname = _x select 1;
						_text = _x select 2;
						_price = _x select 3;
						_c = true;
						_Type = "Vehicles";
					};
				} count RPP_Vehicle_Config;
				_pic = getText (configFile >> 'CfgVehicles' >> _classname >> 'picture');

				_data_Shop = lbAdd [1500, format ["%1 ($%2)",_text,_price]];
				lbSetData [1500, _data_Shop, _classname];

				_itemList lbSetData[(lbSize _itemList)-1,_classnameShop];
				_itemList lbSetPicture[(lbSize _itemList)-1,_pic];
			} foreach RPP_ShopUsing;

			_Totalprice ctrlSetText format["$%1",RPP_Shopping_Price];
		};

		case "GEAR": {
			{
				_classnameShop = _x select 0;
				{
					if (_classnameShop == _x select 0) then {
						_classname = _x select 1;
						_price = _x select 2;
						_c = true;
						_type = _x select 5;
					};
				} count RPP_Other_Config;

				if (_type isEqualTo "CfgCloth") then {
					_pic = getText (configFile >> 'CfgCloth' >> _classname >> 'picture');
					_text = getText (configFile >> 'CfgCloth' >> _classname >> 'displayName');

					_data_Shop = lbAdd [1500, format ["%1 ($%2)",_text,_price]];
					lbSetData [1500, _data_Shop, _classname];

					_itemList lbSetData[(lbSize _itemList)-1,_classnameShop];
					_itemList lbSetPicture[(lbSize _itemList)-1,_pic];
				};
				if (_type isEqualTo "CfgWeapons") then {
					_pic = getText (configFile >> 'CfgWeapons' >> _classname >> 'picture');
					_text = getText (configFile >> 'CfgWeapons' >> _classname >> 'displayName');

					_data_Shop = lbAdd [1500, format ["%1 ($%2)",_text,_price]];
					lbSetData [1500, _data_Shop, _classname];

					_itemList lbSetData[(lbSize _itemList)-1,_classnameShop];
					_itemList lbSetPicture[(lbSize _itemList)-1,_pic];
				};
				if (_type isEqualTo "CfgMagazines") then {
					_pic = getText (configFile >> 'CfgMagazines' >> _classname >> 'picture');
					_text = getText (configFile >> 'CfgMagazines' >> _classname >> 'displayName');

					_data_Shop = lbAdd [1500, format ["%1 ($%2)",_text,_price]];
					lbSetData [1500, _data_Shop, _classname];

					_itemList lbSetData[(lbSize _itemList)-1,_classnameShop];
					_itemList lbSetPicture[(lbSize _itemList)-1,_pic];
				};
				if (_type isEqualTo "CfgGlasses") then {
					_pic = getText (configFile >> 'CfgGlasses' >> _classname >> 'picture');
					_text = getText (configFile >> 'CfgGlasses' >> _classname >> 'displayName');

					_data_Shop = lbAdd [1500, format ["%1 ($%2)",_text,_price]];
					lbSetData [1500, _data_Shop, _classname];

					_itemList lbSetData[(lbSize _itemList)-1,_classnameShop];
					_itemList lbSetPicture[(lbSize _itemList)-1,_pic];
				};
				if (_type isEqualTo "CfgVehicles") then {
					_pic = getText (configFile >> 'CfgVehicles' >> _classname >> 'picture');
					_text = getText (configFile >> 'CfgVehicles' >> _classname >> 'displayName');

					_data_Shop = lbAdd [1500, format ["%1 ($%2)",_text,_price]];
					lbSetData [1500, _data_Shop, _classname];

					_itemList lbSetData[(lbSize _itemList)-1,_classnameShop];
					_itemList lbSetPicture[(lbSize _itemList)-1,_pic];
				};
			} foreach RPP_ShopUsing;

			_Totalprice ctrlSetText format["$%1",RPP_Shopping_Price];
		};

		case "ITEM": {
			{
				_classnameShop = _x select 0;
				{
					if (_classnameShop == _x select 0) then {
						_Type = "Items";
						_classname = "";
						_text = _x select 1;
						_hg = _x select 2;
						_price = _x select 3;
						_c = true;
					};
				} count RPP_Items_Config;

				_data_Shop = lbAdd [1500, format ["%1 ($%2 | Weight %3)",_text,_price,_hg]];
				lbSetData [1500, _data_Shop, _text];
			} foreach RPP_ShopUsing;

			_Totalprice ctrlSetText format["$%1",RPP_Shopping_Price];
		};
	};
};
}] call RPP_Function;
publicVariable "RPP_Shop_DialogOpen_Shop";

["RPP_Shop_Process", {
	private ["_text","_classname","_price","_sellprice","_weight","_Skill","_type","_Lic","_ShopName","_ShopPrice","_Shopstock","_ShopID","_ShopVar","_ItemBought"];
	if (RPP_Shopping_Price <= 0) exitWith {
		_msg = "Please add something to your cart first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (RPP_Cash < RPP_Shopping_Price) exitWith {
		_msg = "You don't have enough Cash";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_text = "";
	_classname = "";
	_price = "";
	_sellprice = "";
	_weight = "";
	_Skill = "";
	_type = "";
	_Lic = "";
	_ShopName = "";
	_ShopPrice = "";
	_Shopstock = "";
	_ShopID = "";
	_cmd = "";
	_other = "";
	_itemAmount = "";

	_ItemBought = false;
	_classnameShop = "";
	{
		_ShopName = _x select 0;
		_ShopPrice = _x select 1;
		_ShopStock = _x select 2;
		_ShopVar = _x select 3;
		_ShopID = _x select 4;
	} count RPP_ShopOwner;

	if (_ShopStock <= 0) exitWith {
		_msg = "There is no more stocks left in this shop.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	closeDialog 1;

//foreach here
{
	_classnameShop = _x select 0;
	_itemAmount = [_classnameShop] call RPP_ShopCart_Count;
	{
		_text = _x select 0;
	} count RPP_Shopping_Cart;

	{
		if (_x select 0 isEqualTo _classnameShop) exitWith {
			_classname = _x select 1;
			_text = _x select 2;
			_price = _x select 3;
			_sellprice = _x select 4;
			_weight = _x select 5;
			_Skill = _x select 6;
			_type = _x select 7;
			_Lic = _x select 8;
		};
	} count RPP_Vehicle_Config;

	{
		if (_x select 0 isEqualTo _classnameShop) exitWith {
			_classname = _x select 1;
			_price = _x select 2;
			_c = true;
			_type = _x select 5;
			_cmd = _x select 4;
			_lic = _x select 6;
			if (_Type == "CfgVehicles") then {
				_type = "CfgWeapons";
				_other = "CfgVehicles";
			};
		};
	} count RPP_Other_Config;

	{
		if (_x select 1 isEqualTo _classnameShop) then {
			_classname = "";
			_text = _x select 1;
			_price = _x select 2;
			_type = _x select 10;
		};
	} count RPP_Items_Config;
	switch (_type) do {

		case "Vehicle": {
			if (RPP_Skill_Vehicle < _Skill && RPP_IsCiv) exitWith {
				_msg = format ["You need atleast %1 Vehicle skill points to drive this Vehicle.",_Skill];
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
			};

			if (RPP_IsCiv) then {
				if (!(_lic in RPP_License)) then {
					_msg = format ["You need the %1 to buy this!",_Lic];
					_color = RPP_Red;
					[_msg,_color] call RPP_MessageSystem;
					_ItemBought = false;
				} else {
					_veh = _classname createVehicle (position RPP_ShopSpawn);
					_Dir = getdir(RPP_ShopSpawn);
					_veh setdir _Dir;
					_ItemBought = true;
					RPP_Veh_VarSet = false;
					[_veh,player,_weight] call RPP_Licenseplate_Create;

					clearMagazineCargoGlobal _veh;
					clearWeaponCargoGlobal _veh;
					clearItemCargoGlobal _veh;
				};
			} else {

				systemChat "Vehicle Purchased.";
				systemChat format["CLASS: %1", _classname];
				_veh = _classname createVehicle (position RPP_ShopSpawn);
				_Dir = getdir(RPP_ShopSpawn);
				_veh setdir _Dir;
				_ItemBought = true;
				RPP_Veh_VarSet = false;
				[_veh, player, _weight, _classname] call RPP_Licenseplate_Create;

				systemChat "Called LIC global";

				clearMagazineCargoGlobal _veh;
				clearWeaponCargoGlobal _veh;
				clearItemCargoGlobal _veh;
			};
		};

		case "Air": {
			if (RPP_IsCiv) then {
				if (!(_lic in RPP_License)) then {
					_msg = format ["You need the %1 to buy this!",_Lic];
					_color = RPP_Red;
					[_msg,_color] call RPP_MessageSystem;
					_ItemBought = false;
				} else {
					_veh = _classname createVehicle (position RPP_ShopSpawn);
					_Dir = getdir(RPP_ShopSpawn);
					_veh setdir _Dir;
					_ItemBought = true;
					RPP_Veh_VarSet = false;
					[_veh,player,_weight] call RPP_Licenseplate_Create;
					clearMagazineCargoGlobal _veh;
					clearWeaponCargoGlobal _veh;
					clearItemCargoGlobal _veh;
					clearBackpackCargoGlobal _veh;
				};
			} else {
				_veh = _classname createVehicle (position RPP_ShopSpawn);
				_Dir = getdir(RPP_ShopSpawn);
				_veh setdir _Dir;
				_ItemBought = true;
				RPP_Veh_VarSet = false;
				[_veh,player,_weight] call RPP_Licenseplate_Create;
				clearMagazineCargoGlobal _veh;
				clearWeaponCargoGlobal _veh;
				clearItemCargoGlobal _veh;
				clearBackpackCargoGlobal _veh;
			};
		};

		case "CfgWeapons": {
			if (RPP_IsCiv) then {
				if (!(_lic in RPP_License)) then {
					if (_lic == "") exitWith {
						for '_i' from 1 to _itemAmount do {
							call compile format ["%1 %2 ['%3',1]",RPP_ShopSpawn,_cmd,_classname];
						};
						_ItemBought = true;
					};
					_msg = format ["You need the %1 to buy this!",_Lic];
					_color = RPP_Red;
					[_msg,_color] call RPP_MessageSystem;
					_ItemBought = false;
				} else {
					for '_i' from 1 to _itemAmount do {
						call compile format ["%1 %2 ['%3',1]",RPP_ShopSpawn,_cmd,_classname];
					};
					_ItemBought = true;
				};
			 } else {
				for '_i' from 1 to _itemAmount do {
					call compile format ["%1 %2 ['%3',1]",RPP_ShopSpawn,_cmd,_classname];
				};
				_ItemBought = true;
			};
		};

		case "CfgMagazines": {
			call compile format ["%1 %2 ['%3',%4]",RPP_ShopSpawn,_cmd,_classname,_itemAmount];
			_ItemBought = true;
		};

		case "CfgCloth": {
			for '_i' from 1 to _itemAmount do {
				call compile format ["player %1 '%2'",_cmd,_classname];
			};
			_ItemBought = true;
		};

		case "CfgGlasses": {
			for '_i' from 1 to _itemAmount do {
				call compile format ["player %1 '%2'",_cmd,_classname];
			};
			_ItemBought = true;
		};

		case "Inventory": {
			_ItemBought = true;
		};

	};
} foreach RPP_Shopping_Cart; //end foreach

	if (_ItemBought) then {
		closeDialog 1;
		if (!(_Type isEqualTo "Inventory")) then {
			if (_type isEqualTo "Vehicle") then {
				_msg = format ["Bought %1<br />For $%2",_text,RPP_Shopping_Price];
				_color = RPP_Green;
				[_msg,_color] call RPP_MessageSystem;
			} else {
				_msg = "Successfully Processed!";
				_color = RPP_Green;
				[_msg,_color] call RPP_MessageSystem;
			};
		} else {
			_Showitems = [];
			_counItems = 0;
			_getWeight = RPP_Weight;
			_TotalWeight = 0;
			_getWeight_item = 0;

			{
				_item = _x select 0;
				_amount = _x select 1;
				_Showitems = _Showitems + [_item];
				_counItems = _counItems + _amount;

				{
					if (_item == _x select 1) exitWith {
						_getWeight_item = _x select 2;
					};
				} count RPP_Items_Config;

				_getWeight_item = _getWeight_item + _getWeight_item;

			} foreach RPP_Shopping_Cart;

			_Count = for "_i" from 1 to _counItems do {
				_getWeight = _getWeight + _getWeight_item;
			};

			if (_getWeight > RPP_MaxWeight) exitWith {
				_msg = "You will not be able to carry all that.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
			};
			_items = [];
			{
				_text = _x select 0;
				_amount = _x select 1;
				_items = _items + [_text];
				[_text,_amount] call RPP_Inventory_add;
				[0] call RPP_ShopManager_ShopBuyItem;
			} foreach RPP_Shopping_Cart;
			_msg = "Successfully Processed!";
			_color = RPP_Green;
			[_msg,_color] call RPP_MessageSystem;

		};
		[RPP_Shopping_Price] call RPP_ShopManager_ShopBuyItem;
		[RPP_Shopping_Price] call RPP_AntiCheat_RemoveMoney;
	};
}] call RPP_Function;
publicVariable "RPP_Shop_Process";

["RPP_Shop_AddtoCart_Vehicle", {
	private ["_data","_Array","_classname","_text","_price","_itemList","_itemAmount","_Data_Cart"];
	if (lbCurSel 1500 isEqualTo -1) exitWith {
		_msg = "Please select an item to add to your cart.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_data = lbData [ 1500, ( lbCurSel 1500 ) ];
	_text = "";
	_pic = "";
	_other = "";
	{
		if (_data == _x select 0) exitWith {
			RPP_Shopping_Cart = [];
			RPP_Shopping_Price = 0;

			_classname = _x select 1;
			_text = _x select 2;
			_price = _x select 3;
		};
	} count RPP_Vehicle_Config;
	{
		if (_data == _x select 0) exitWith {
			_classname = _x select 1;
			_price = _x select 2;
			_type1 = _x select 5;
		};
	} count RPP_Other_Config;
	{
		if (_data == _x select 1) then {
			_classname = _x select 0;
			_text = _x select 1;
			_price = _x select 3;
			_data = _x select 1;
		};
	} count RPP_Items_Config;
	[_data,1] call RPP_ShopCartVeh_Add;

	_itemList = ((findDisplay 30045) displayCtrl 1501);
	RPP_Shopping_Price = RPP_Shopping_Price + _price;
	_text = uiNameSpace getVariable ["RPP_ShopDialog",displayNull];
	_Totalprice = _text displayCtrl 1000;
	lbClear 1501;
	_Totalprice ctrlSetText format["$%1",RPP_Shopping_Price];
	_type = "";
	{

		_data = _x select 0;
		{
			if (_data == _x select 0) exitWith {
				_classname = _x select 1;
				_text = _x select 2;
				_price = _x select 3;
				_pic = getText (configFile >> 'CfgVehicles' >> _classname >> 'picture');
				_type = "Vehicle";
			};
		} count RPP_Vehicle_Config;
		{
			if (_data == _x select 1) then {
				_classname = _x select 0;
				_text = _x select 1;
				_price = _x select 3;
				_pic = "";
				_type = "Items";
			};
		} count RPP_Items_Config;
		{
			if (_data == _x select 0) exitWith {
				_classname = _x select 1;
				_price = _x select 2;
				_type = _x select 5;
				_pic = getText (configFile >> 'CfgVehicles' >> _classname >> 'picture');
				if (_type isEqualTo "CfgVehicles") then {
					_pic = getText (configFile >> _type >> _classname >> 'picture');
					_text = getText (configFile >> _type >> _classname >> 'displayName');
					_type = "CfgWeapons";
					_other = "CfgVehicles"
				} else {
					_pic = getText (configFile >> _type >> _classname >> 'picture');
					_text = getText (configFile >> _type >> _classname >> 'displayName');
				};
			};
		} count RPP_Other_Config;


		if (_type isEqualTo "Items") then {
			_pic = getText (configFile >> _type >> _classname >> 'picture');
 			_itemAmount = [_x select 0] call RPP_ShopCart_Count;
			_Data_Cart = lbAdd [1501, format ["%1 (x%3)",_text,_price,_itemAmount]];
			lbSetData [1501, _Data_Cart, _classname];
			_itemList lbSetData[(lbSize _itemList)-1,_text];
		};
		if (_type isEqualTo "Vehicle") then {
			_itemAmount = [_x select 0] call RPP_ShopCart_Count;
			_Data_Cart = lbAdd [1501, format ["%1 (x%3)",_text,_price,_itemAmount]];
			lbSetData [1501, _Data_Cart, _classname];
			_itemList lbSetData[(lbSize _itemList)-1,_text];
		};
		if (_type isEqualTo "CfgCloth") then {
			_text = getText (configFile >> _type >> _classname >> 'displayName');
			_pic = getText (configFile >> _type >> _classname >> 'picture');
			_itemAmount = [_x select 0] call RPP_ShopCart_Count;
			_Data_Cart = lbAdd [1501, format ["%1 (x%3)",_text,_price,_itemAmount]];
			lbSetData [1501, _Data_Cart, _classname];
			_itemList lbSetData[(lbSize _itemList)-1,_text];
		};
		if (_type isEqualTo "CfgGlasses") then {
			_text = getText (configFile >> _type >> _classname >> 'displayName');
			_pic = getText (configFile >> _type >> _classname >> 'picture');
			_itemAmount = [_x select 0] call RPP_ShopCart_Count;
			_Data_Cart = lbAdd [1501, format ["%1 (x%3)",_text,_price,_itemAmount]];
			lbSetData [1501, _Data_Cart, _classname];
			_itemList lbSetData[(lbSize _itemList)-1,_text];
		};
		if (_type isEqualTo "CfgWeapons") then {
			_itemAmount = [_x select 0] call RPP_ShopCart_Count;
			_Data_Cart = lbAdd [1501, format ["%1 (x%3)",_text,_price,_itemAmount]];
			lbSetData [1501, _Data_Cart, _classname];
			_itemList lbSetData[(lbSize _itemList)-1,_text];
		};
		if (_type isEqualTo "CfgMagazines") then {
			_text = getText (configFile >> _type >> _classname >> 'displayName');
			_pic = getText (configFile >> _type >> _classname >> 'picture');
			_itemAmount = [_x select 0] call RPP_ShopCart_Count;
			_Data_Cart = lbAdd [1501, format ["%1 (x%3)",_text,_price,_itemAmount]];
			lbSetData [1501, _Data_Cart, _classname];
			_itemList lbSetData[(lbSize _itemList)-1,_text];
		};
		if (!(_pic == "")) then {
			_itemList lbSetPicture[(lbSize _itemList)-1,_pic];
		};

	} foreach RPP_Shopping_Cart;
}] call RPP_Function;
publicVariable "RPP_Shop_AddtoCart_Vehicle";

["RPP_Shop_RemoveFromCart", {
	private ["_Data","_price","_text","_classname"];
	if (lbCurSel 1501 isEqualTo -1) exitWith {
		_msg = "Please select an item from your cart to remove first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_data = lbData [ 1501, ( lbCurSel 1501 ) ];
	if (_data isEqualTo "") exitWith {
		_msg = "No Item found.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	_price = 0;
	_text = _data;
	_classname = "";

	{
		if (_text == _x select 0) exitWith {
			_price = _x select 1;
		};
	} count RPP_ShopUsing;

	[_text,1,_price] call RPP_ShopCart_Remove;

	[_text,1,_classname] call RPP_Shop_Cartupdate;
}] call RPP_Function;
publicVariable "RPP_Shop_RemoveFromCart";

["RPP_Shop_Cartupdate", {
	private ["_price","_classname","_text","_itemList","_pic","_itemAmount"];
	lbClear 1501;
	_price = 0;
	_classname = "";
	_text = _this select 0;
	_text = uiNameSpace getVariable ["RPP_ShopDialog",displayNull];
	_Totalprice = _text displayCtrl 1000;
	_itemList = ((findDisplay 30045) displayCtrl 1501);
	_pic = getText (configFile >> 'CfgVehicles' >> _classname >> 'picture');
	_Totalprice ctrlSetText format["$%1",RPP_Shopping_Price];
	_type = "";
	{

		_class = _x select 0;
		_type = "";

		{
			if (_class == _x select 0) exitWith {
				_classname = _x select 1;
				_text = _x select 2;
				_price = _x select 3;
				_type = "Vehicle";
			};
		} count RPP_Vehicle_Config;

		{
			if (_class == _x select 1) then {
				_classname = _x select 0;
				_text = _x select 1;
				_price = _x select 3;
				_type = "Items";
			};
		} count RPP_Items_Config;
		{
			if (_class == _x select 0) then {
				_classname = _x select 1;
				_price = _x select 2;
				_type = _x select 5;
				_pic = getText (configFile >> _type >> _classname >> 'picture');
				_text = getText (configFile >> _type >> _classname >> 'displayName');
			};
		} count RPP_Other_Config;

		if (_type isEqualTo "Vehicle") then {
			_itemAmount = [_x select 0] call RPP_ShopCart_Count;
			lbAdd [1501, format ["%1 (x%3)",_text,_price,_itemAmount]];
			_itemList lbSetData[(lbSize _itemList)-1,_classname];
			_itemList lbSetPicture[(lbSize _itemList)-1,_pic];
		};
		if (_type isEqualTo "Items") then {
			_itemAmount = [_classname] call RPP_ShopCart_Count;
			_Data_Cart = lbAdd [1501, format ["%1 (x%3)",_text,_price,_itemAmount]];
			lbSetData [1501, _Data_Cart, _classname];
		};
		if (_type isEqualTo "CfgWeapons") then {
			_itemAmount = [_x select 0] call RPP_ShopCart_Count;
			lbAdd [1501, format ["%1 (x%3)",_text,_price,_itemAmount]];
			_itemList lbSetData[(lbSize _itemList)-1,_classname];
			_itemList lbSetPicture[(lbSize _itemList)-1,_pic];
		};
		if (_type isEqualTo "CfgMagazines") then {
			_itemAmount = [_x select 0] call RPP_ShopCart_Count;
			lbAdd [1501, format ["%1 (x%3)",_text,_price,_itemAmount]];
			_itemList lbSetData[(lbSize _itemList)-1,_classname];
			_itemList lbSetPicture[(lbSize _itemList)-1,_pic];
		};
		if (_type isEqualTo "CfgCloth") then {
			_itemAmount = [_x select 0] call RPP_ShopCart_Count;
			lbAdd [1501, format ["%1 (x%3)",_text,_price,_itemAmount]];
			_itemList lbSetData[(lbSize _itemList)-1,_classname];
			_itemList lbSetPicture[(lbSize _itemList)-1,_pic];
		};
		if (_type isEqualTo "CfgGlasses") then {
			_itemAmount = [_x select 0] call RPP_ShopCart_Count;
			lbAdd [1501, format ["%1 (x%3)",_text,_price,_itemAmount]];
			_itemList lbSetData[(lbSize _itemList)-1,_classname];
			_itemList lbSetPicture[(lbSize _itemList)-1,_pic];
		};
	} foreach RPP_Shopping_Cart;
}] call RPP_Function;
publicVariable "RPP_Shop_Cartupdate";
