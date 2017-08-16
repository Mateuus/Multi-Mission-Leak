/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Shop_Manager.sqf

Description:
Shopping Manager
*/
["RPP_ShopManager_DialogOpen", {
	private ["_ShopOwner","_data1","_data2","_data3","_txt","_number","_call"];
	closeDialog 1;
	createDialog "RPP_ShopInfoDialog";
	buttonSetAction [1600,"[] call RPP_ShopManager_UseCommand;"];
	buttonSetAction [1601,"[RPP_ShopUsing,RPP_ShopOwner,RPP_ShopSpawn,RPP_ShopType,RPP_ShopCfg_Type] call RPP_Shop_DialogOpen_Shop;"];

	RPP_ShopPrice = 0;
	_ShopOwner = "";
	_canUse = false;
	RPP_ShopStock = "";
	{
		_ShopOwner = _x select 0;
		RPP_ShopPrice = _x select 1;
		RPP_ShopStock = _x select 2;
	} count RPP_ShopOwner;

	if (_ShopOwner isEqualTo "Empty") then {
		_data1 = lbAdd [1500, format ["Shop Owner: For Sale!",_ShopOwner]];
	} else {
		_data1 = lbAdd [1500, format ["Shop Owner: %1",_ShopOwner]];
	};
	lbSetData [1500, _data1, "ShopInfo"];
	_data2 = lbAdd [1500, format ["Shop Price: $%1",RPP_ShopPrice]];
	lbSetData [1500, _data2, "ShopInfo"];
	_data3 = lbAdd [1500, format ["Shop Stock: x%1",RPP_ShopStock]];
	lbSetData [1500, _data3, "ShopInfo"];
	lbAdd [1500, format ["",name player]];

	_Txt = "";
	_number = 1;
	_call = "";
	{
		_Txt = _x select 0;
		_call = _x select 1;
		_number = _x select 2;
		if (_call isEqualTo "RPP_ShopManager_BuyShop") then {
			_data_ShopCommands = lbAdd [1501, format ["%1 ($%2)",_txt,RPP_ShopPrice]];
			lbSetData [1501, _data_ShopCommands, _call];
		} else {
			_data_ShopCommands = lbAdd [1501, format ["%1 ($%2)",_txt,_number]];
			lbSetData [1501, _data_ShopCommands, _call];
		};
	} foreach RPP_ShopCommands;
}] call RPP_Function;
publicVariable "RPP_ShopManager_DialogOpen";

["RPP_ShopManager_UseCommand", {
	if (lbCurSel 1501 isEqualTo -1) exitWith {
		_msg = "Please select a shop command.";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	_call = lbData [ 1501, ( lbCurSel 1501 ) ];
	if (_call isEqualTo "") exitWith {
		_msg = "Please select a shop command.";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	_price = 0;
	{
		if (_x select 1 == _call) exitWith {
			_price = _x select 2;
		};
	} count RPP_ShopCommands;
	if (_call isEqualTo "") exitWith {
		_msg = "This Command is still a work in progress!";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	if (_call == "RPP_ShopManager_BuyShop") then {
		_price = RPP_ShopPrice;
	};

	call compile format ["[] call %1;",_call];
}] call RPP_Function;
publicVariable "RPP_ShopManager_UseCommand";

["RPP_ShopManager_BuyShop", {
	private ["_ShopOwner","_ShopPrice","_ShopStock","_ShopVar","_ShopID","_ShopName","_msg","_color"];
	_ShopOwner = "";
	_ShopPrice = "";
	_ShopStock = "";
	_ShopVar = "";
	_ShopID = "";
	_ShopName = "";
	{
		_ShopOwner = _x select 0;
		_ShopPrice = _x select 1;
		_ShopStock = _x select 2;
		_ShopVar = _x select 3;
		_ShopID = _x select 4;
		_ShopName = _x select 5;
	} count RPP_ShopOwner;

	if (_ShopID isEqualTo getPlayerUID player) exitWith {
		_msg = "You already own this shop";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};

	if (RPP_Cash < _ShopPrice) exitWith {
		_msg = "You don't have enough cash!";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};

	[_ShopPrice] call RPP_AntiCheat_RemoveMoney;
	[[_ShopPrice,_ShopName], "RPP_ShopManager_GetMoney_Shopbuy", false] call BIS_FNC_MP;

	_ShopID = getPlayerUID player;
	_ShopOwner = name player;

	_msg = format ["You just bought %2 for $%1",_ShopPrice,_ShopName];
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;

	_msg = format ["%1 Just bought %3 for $%2",name player,_ShopPrice,_ShopName];
	[_msg] call RPP_Message_Global;

	_ShopPrice = _ShopPrice + 33000;

	call compile format ["%1 = [['%2',%3,%4,'%5','%6','%7']]",_ShopVar,_ShopOwner,_ShopPrice,_ShopStock,_ShopVar,_ShopID,_ShopName];
	call compile format ["publicVariable '%1'",_ShopVar];
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_ShopManager_BuyShop";

["RPP_ShopManager_CheckUser", {
	_Money = _this select 0;
	_Name = _this select 1;
	[_Money,_Name] call RPP_ShopManager_GetMoney_Shopbuy;
}] call RPP_Function;
publicVariable "RPP_ShopManager_CheckUser";

["RPP_ShopManager_GetMoney_Shopbuy", {
	private ["_Money"];
	_Money = _this select 0;
	_Name = _this select 1;

	_Money = _Money - 25000;

	[_Money] call RPP_AntiCheat_AddBank;
	_msg = format ["Someone Bought %1 from you and you got $%2 in return",_Name,_Money];
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_ShopManager_GetMoney_Shopbuy";

["RPP_ShopManager_StockShop", {
	private ["_ShopOwner","_ShopPrice","_ShopStock","_ShopVar","_ShopID","_price","_Stockadd","_msg","_color"];
	_ShopOwner = "";
	_ShopPrice = "";
	_ShopStock = "";
	_ShopVar = "";
	_ShopID = "";
	_ShopName = "";
	_Price = 3500;
	_Stockadd = 150;
	{
		_ShopOwner = _x select 0;
		_ShopPrice = _x select 1;
		_ShopStock = _x select 2;
		_ShopVar = _x select 3;
		_ShopID = _x select 4;
		_ShopName = _x select 5;
	} count RPP_ShopOwner;

	if (!(_ShopID isEqualTo getPlayerUID player)) exitWith {
		_msg = "You don't own this shop!";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};

	if (RPP_Cash < _price) exitWith {
		_msg = "You don't have enough cash!";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};


	[_price] call RPP_AntiCheat_RemoveMoney;
	_ShopStock = _ShopStock + _Stockadd;
	_ShopPrice = _ShopPrice + _price;

	call compile format ["%1 = [['%2',%3,%4,'%5','%6','%7']]",_ShopVar,_ShopOwner,_ShopPrice,_ShopStock,_ShopVar,_ShopID,_ShopName];
	call compile format ["publicVariable '%1'",_ShopVar];
	_msg = format ["%1 Stocks added!",_Stockadd];
	_color = RPP_Green;
	[_msg,_Color] call RPP_MessageSystem;

	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_ShopManager_StockShop";

["RPP_ShopManager_ShopBuyItem", {
	private ["_ItemPrice","_ShopOwner","_ShopPrice","_ShopStock","_ShopVar","_ShopID"];
	_ItemPrice = _this select 0;
	_ShopOwner = "";
	_ShopPrice = "";
	_ShopStock = "";
	_ShopVar = "";
	_ShopID = "";
	_ShopName = "";
	{
		_ShopOwner = _x select 0;
		_ShopPrice = _x select 1;
		_ShopStock = _x select 2;
		_ShopVar = _x select 3;
		_ShopID = _x select 4;
		_ShopName = _x select 5;
	} count RPP_ShopOwner;

	_ShopStock = _ShopStock - 1;

	call compile format ["%1 = [['%2',%3,%4,'%5','%6','%7']]",_ShopVar,_ShopOwner,_ShopPrice,_ShopStock,_ShopVar,_ShopID,_ShopName];
	call compile format ["publicVariable '%1'",_ShopVar];

	if (!(_ItemPrice <= 0)) then {
		if (!(_ShopID == "Empty")) then {
			if (!(_ShopID == getPlayerUID player)) then {
				[[_ItemPrice,_ShopID], "RPP_ShopManager_Payback", false] call BIS_FNC_MP;
			};
		};
	};
}] call RPP_Function;
publicVariable "RPP_ShopManager_ShopBuyItem";

["RPP_ShopManager_Payback", {
	private ["_i","_id"];
	_i = _this select 0;
	_id = _this select 1;

	if (!(_i <= 1000)) then {
		_i = _i - 1000;
	};

	if (_i <= 0) then {
		_i = _i + 100;
	};

	_Shopowner = "";

	{
		if (getPlayerUID _x == _id) exitWith {
			_Shopowner = _x;
		};
	} count playableUnits;

	[[_i], "RPP_ShopManager_GetMoney", _Shopowner] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_ShopManager_Payback";

["RPP_ShopManager_GetMoney",{
	private ["_Money"];
	_Money = _this select 0;

	[_Money] call RPP_AntiCheat_AddBank;
	_msg = format ["Someone used your shop and you got paid $%1",_Money];
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_ShopManager_GetMoney";