/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_VehicleMenu.sqf

Description:
For Locking your vehicle and etc
*/

RPP_Vehicle_SetAction_Global = {
	private ["_veh"];
	_veh = _this select 0;
	[[_veh], "RPP_Vehicle_SetAction", true, true] call BIS_FNC_MP;	
};
publicVariable "RPP_Vehicle_SetAction_Global";

RPP_Vehicle_SetAction = {
	private ["_veh"];
	_veh = _this select 0;
	VehicleMenu = _veh addAction ["<t color='#CCFF33'>Vehicle Menu</t>",{[] call RPP_VehicleMenu_OpenDialog}];
};
publicVariable "RPP_Vehicle_SetAction";

RPP_Vehicle_SetVariables_Global = {
	private ["_veh","_Maxweight"];
	_veh = _this select 0;
	_Maxweight = _this select 1;
	[[_veh,_Maxweight,player], "RPP_Vehicle_SetVariables", true] call BIS_FNC_MP;
};
publicVariable "RPP_Vehicle_SetVariables_Global";

RPP_Vehicle_SetVariables = {
	private ["_veh","_owners","_Trunk","_Plate","_RandomN","_randomnumbers","_ID","_class"];
	_veh = _this select 0;
	_Maxweight = _this select 1;
	_player = _this select 2;

	_weight = 0;
	_veh lock true;
	_Owners = [];
	_Trunk = [];
	_Plate = [];
	_trunkopen = false;
	_RandomN = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50];
	_randomnumbers1 = _RandomN call BIS_FNC_Selectrandom;
	_randomnumbers2 = _RandomN call BIS_FNC_Selectrandom;
	_randomnumbers3 = _RandomN call BIS_FNC_Selectrandom;
	_ID = call compile format ["%1%2%3",_randomnumbers1,_randomnumbers2,_randomnumbers3];
	_class = typeOf _veh;


	_owners = _owners + [getPlayerUID _player]; 

	_veh setVariable ["RPP_Vehicle_Class",_class,true];
	_veh setVariable ["RPP_Vehicle_isVeh",true,true];
	_veh setVariable ["RPP_Vehicle_ID",_ID,true];
	_veh setVariable ["RPP_Vehicle_Trunk",_Trunk,true];
	_veh setVariable ["RPP_Vehicle_Owners",_owners,true];
	_veh setVariable ["RPP_Vehicle_TrunkOpen",_trunkopen,true];
	_veh setVariable ["RPP_Vehicle_MaxWeight",_Maxweight,true];
	_veh setVariable ["RPP_Vehicle_Weight",_weight,true];
	_veh setVariable ["RPP_Vehicle_Licenseplate",_Plate,true];

	[[_veh], "RPP_Vehicle_Returnback_Var",_player] call BIS_FNC_MP;
};
publicVariable "RPP_Vehicle_SetVariables";

RPP_Vehicle_Returnback_Var = {
	RPP_Veh_VarSet = true;
};
publicVariable "RPP_Vehicle_Returnback_Var";

RPP_VehicleMenu_OpenDialog = {
	private ["_veh"];
	_veh = cursorTarget;
	if (vehicle player != player) then {
		_veh = vehicle player;
	};
	if (player distance _veh > 15) exitWith {};
	if (_veh getVariable "RPP_Vehicle_isVeh") then {
		createDialog "RPP_VehicleMenu";
		buttonSetAction [1600, "[] call RPP_VehicleMenu_LockorUnlockVeh;"];
		buttonSetAction [1601, "[] call RPP_VehicleMenu_LockorUnlockTrunk;"];
		buttonSetAction [1602, "[] call RPP_VehicleMenu_ShareKey;"];
		buttonSetAction [1603, "[] call RPP_VehicleMenu_OpenTrunk;"];
	};
	{
		if (player distance _x <= 5) then {
			_txt = '';
			if (side _x == west) then {
				_txt = 'Police';
			};
			if (side _x == independent) then {
				_txt = 'EMT';
			};
			if (side _x == civilian) then {
				_txt = 'Civilian';
			};
			_data13 = lbAdd [2100, format ['%1 (%2)',name _x, _txt]];
			lbSetData [2100, _data13, getPlayerUID _x];
		};
	} foreach playableUnits;
};
publicVariable "RPP_VehicleMenu_OpenDialog";

["RPP_VehicleMenu_ShareKey", {
	_give = lbData [ 2100, ( lbCurSel 2100 ) ];
	_veh = cursorTarget;
	_giveto = "";
	_name = "";
	_Owner = _veh getVariable "RPP_Vehicles_Buyer";
	if (lbCurSel 2100 == -1) exitWith {
		_msg = 'Please select a Player first.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_give isEqualTo "") exitWith {
		_msg = 'No Player found';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(_Owner isEqualTo getPlayerUID player)) exitWith {
		_msg = "You don't own this vehicle";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	{
		if (getPlayerUID _x isEqualTo _give) then {
			_giveto = _x;
			_name = name _x;
		};
	} count playableUnits;

	if (_name isEqualTo name player) exitWith {
		_msg = "You already got the keys for this vehicle";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	[[_veh,player], "RPP_VehicleMenu_ShareKey_Get",_giveto] call BIS_FNC_MP;

	_msg = format ["You just Shared your car keys with %1",_name];
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;

	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_VehicleMenu_ShareKey";

["RPP_VehicleMenu_ShareKey_Get", {
	private ["_Veh","_Owners","_uid","_P","_uid","_c"];
	_Veh = _this select 0;
	_P = _this select 1;
	_Owners = _veh getVariable "RPP_Vehicle_Owners";
	_uid = getPlayerUID player;
	_c = true;

	{
		if (_uid isEqualTo _x) exitWith {
			_c = false;
		};
	} count _Owners;
	if (!(_c)) exitWith {};

	_Owners = _Owners + [_uid];
	_veh setVariable ["RPP_Vehicle_Owners",_Owners,true];
	_msg = format ["%1 Just shared his car keys with you",name _P];
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;


	_owners = _veh getVariable "RPP_Vehicle_Owners";
	_Plate = _veh getVariable "RPP_Vehicle_Licenseplate";
	[1, _owners, _Plate] remoteExec ["RPP_DB_partialSync_Vehicle",2]; //Save owners
}] call RPP_Function;
publicVariable "RPP_VehicleMenu_ShareKey_Get";

RPP_VehicleMenu_LockorUnlockVeh = {
	private ["_veh","_owners","_canopen","_msg","_color"];

	_veh = cursorTarget;
	_owners = _veh getVariable "RPP_Vehicle_Owners";
	_canopen = false;

	if (vehicle player != player) then {
		_veh = vehicle player;
		_owners = _veh getVariable "RPP_Vehicle_Owners";
	};
	{
		if (_x isEqualTo getPlayerUID player) exitWith {
			_canopen = true;
		};
	} count _owners;
	if (!(_canopen)) exitWith {
		_msg = "You don't have the keys for this vehicle.";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	if (player distance _veh > 50) exitWith {
		_msg = "To far away from the Vehicle.";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	if ((locked _veh) == 2) then {
		_veh lock false;
		_msg = "Vehicle Unlocked";
		_color = RPP_Yellow;
		[_msg,_Color] call RPP_MessageSystem;

		closeDialog 1;
	}else {
		_veh lock true;
		_msg = "Vehicle Locked";
		_color = RPP_Yellow;
		[_msg,_Color] call RPP_MessageSystem;

		closeDialog 1;
	};
};
publicVariable "RPP_VehicleMenu_LockorUnlockVeh";

RPP_VehicleMenu_LockorUnlockTrunk = {
	private ["_veh","_owners","_Trunkopen","_canopen","_msg","_color"];
	_veh = cursorTarget;
	_owners = _veh getVariable "RPP_Vehicle_Owners";
	_Trunkopen = _veh getVariable "RPP_Vehicle_TrunkOpen";
	_canopen = false;
	if (vehicle player != player) then {
		_veh = vehicle player;
		_owners = _veh getVariable "RPP_Vehicle_Owners";
		_Trunkopen = _veh getVariable "RPP_Vehicle_TrunkOpen";
	};
	{
		if (_x isEqualTo getPlayerUID player) exitWith {
			_canopen = true;
		};
	} count _owners;
	if (!(_canopen)) exitWith {
		_msg = "You don't have the keys for this vehicle.";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	if (player distance _veh > 50) exitWith {
		_msg = "To far away from the Vehicle.";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	if (!(_Trunkopen)) then {
		_Trunkopen = true;
		_veh setVariable ["RPP_Vehicle_TrunkOpen",_Trunkopen];
		_msg = "Trunk unlocked.";
		_color = RPP_Yellow;
		[_msg,_Color] call RPP_MessageSystem;
	} else {
		_Trunkopen = false;
		_veh setVariable ["RPP_Vehicle_TrunkOpen",_Trunkopen];
		_msg = "Trunk locked.";
		_color = RPP_Yellow;
		[_msg,_Color] call RPP_MessageSystem;
	};
};
publicVariable "RPP_VehicleMenu_LockorUnlockTrunk";

RPP_VehicleMenu_OpenTrunk = {
	private ["_veh","_Trunkopen","_msg","_color"];
	_veh = cursorTarget;
	_Trunkopen = _veh getVariable "RPP_Vehicle_TrunkOpen";
	if (vehicle player != player) then {
		_veh = vehicle player;
		_Trunkopen = _veh getVariable "RPP_Vehicle_TrunkOpen";
	};
	if (player distance _veh > 50) exitWith {
		_msg = "To far away from the Vehicle.";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	if (!(_Trunkopen)) exitWith {
		_msg = "This Trunk is locked!";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};

	closeDialog 1;
	[_veh] call RPP_VehicleMenu_OpenTrunk_Dialog;
};
publicVariable "RPP_VehicleMenu_OpenTrunk";

RPP_VehicleMenu_OpenTrunk_Dialog = {
	private ["_veh","_trunk","_weight","_MaxvehWeight","_item","_itemAmount","_data_Trunk","_data_Inventory"];
	createDialog "RPP_VehicleTrunk";

	lbAdd [1500, "Loading Trunk from the database..."];

	if (vehicle player != player) exitWith {
		_veh = vehicle player;
		_plate = _veh getVariable "RPP_Vehicle_Licenseplate";
		systemChat format ["%1",_plate];
		[player,_plate] remoteExec ["RPP_DB_LoadVeh_Trunk",2];
	};

	_veh = cursorTarget;
	_plate = _veh getVariable "RPP_Vehicle_Licenseplate";
	systemChat format ["%1",_plate];
	[player,_plate] remoteExec ["RPP_DB_LoadVeh_Trunk",2];

};
publicVariable "RPP_VehicleMenu_OpenTrunk_Dialog";

RPP_VehicleMenu_StoreItem = {
	private ["_msg","_color","_amount","_item"];
	if (lbCurSel 1501 == -1) exitWith {
		_msg = "Please select an item from your trunk first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_item = lbData [ 1501, ( lbCurSel 1501 ) ];
	if (_item isEqualTo "") exitWith {
		_msg = "Please select an item from your trunk first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if ([_item] call RPP_Inventory_Count == 0) exitWith {
		_msg = "You don't have anymore of that";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
	};
	_amount = 1;
	[_item,_amount] call RPP_VehicleTrunk_Add;
	closeDialog 1;
	[] call RPP_VehicleMenu_OpenTrunk_Dialog;
};
publicVariable "RPP_VehicleMenu_StoreItem";

RPP_VehicleMenu_TakeItem = {
	private ["_msg","_color","_amount","_item"];
	if (lbCurSel 1500 == -1) exitWith {
		_msg = "Please select an item from your trunk first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_item = lbData [ 1500, ( lbCurSel 1500 ) ];
	if (_item isEqualTo "") exitWith {
		_msg = "Please select an item from your trunk first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if ([_item] call RPP_VehicleTrunk_Count == 0) exitWith {
		_msg = "You don't have anymore of that";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
	};
	_amount = 1;
	[_item,_amount] call RPP_VehicleTrunk_Remove;
	closeDialog 1;
	[] call RPP_VehicleMenu_OpenTrunk_Dialog;
};
publicVariable "RPP_VehicleMenu_TakeItem";




RPP_VehicleTrunk_Add = {
	private ["_itemClass","_amount","_veh"];
	_veh = cursorTarget;
	_trunk = _veh getVariable "RPP_Vehicle_Trunk";
	_weight = _veh getVariable "RPP_Vehicle_Weight";
	_MaxvehWeight = _veh getVariable "RPP_Vehicle_MaxWeight";
	if (vehicle player != player) then {
		_veh = vehicle player;
		_trunk = _veh getVariable "RPP_Vehicle_Trunk";
		_weight = _veh getVariable "RPP_Vehicle_Weight";
		_MaxvehWeight = _veh getVariable "RPP_Vehicle_MaxWeight";
	};
	if (_weight >= _MaxvehWeight) exitWith {
		_msg = format ["You have reatch the max weight limit of %1/%2",_weight,_MaxvehWeight];
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	_itemClass = _this select 0;
	_amount = _this select 1;
	_getWeight = "";
	{
		if (_itemClass == _x select 1) exitWith {
			_getWeight = _x select 2;
		};
	} count RPP_Items_Config;
	_CheckWeight = _weight;
	_Count = for "_i" from 1 to _amount do {
		_CheckWeight = _CheckWeight + _getWeight;
	};
	if (_CheckWeight > _MaxvehWeight) exitWith {
		_msg = "Your trunk can't carry that much";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	_weight = _weight + _getWeight;

	_veh setVariable ["RPP_Vehicle_Weight",_weight,true];
	_veh setVariable ["RPP_Vehicle_Trunk",_trunk,true];
	
	[_trunk, _itemClass, _amount] call BIS_fnc_addToPairs;

	/* UPDATE TRUNK & WEIGHT STATS FOR DATABASE */
	_Trunk = _veh getVariable "RPP_Vehicle_Trunk";
	_Weight = _veh getVariable "RPP_Vehicle_Weight";
	_Plate = _veh getVariable "RPP_Vehicle_Licenseplate";

	[2, _Trunk, _Plate] remoteExec ["RPP_DB_partialSync_Vehicle",2]; //Save trunk
	[0, _Weight, _Plate] remoteExec ["RPP_DB_partialSync_Vehicle",2]; //Save weight

	[_itemClass,_amount] call RPP_Inventory_Remove;
};
publicVariable "RPP_VehicleTrunk_Add";


RPP_VehicleTrunk_Count = {
	private ["_itemClass","_return","_veh","_Trunk"];
	_veh = cursorTarget;
	_trunk = _veh getVariable "RPP_Vehicle_Trunk";
	if (vehicle player != player) then {
		_veh = vehicle player;
		_trunk = _veh getVariable "RPP_Vehicle_Trunk";
	};
	_itemClass = _this select 0;

	_return = [_trunk, _itemClass, 0] call BIS_fnc_getFromPairs;

	_return;
};
publicVariable "RPP_VehicleTrunk_Count";

RPP_VehicleTrunk_Remove = {
	private ["_itemClass","_amount","_price","_index","_i"];
	_veh = cursorTarget;
	_trunk = _veh getVariable "RPP_Vehicle_Trunk";
	_weight = _veh getVariable "RPP_Vehicle_Weight";
	_MaxvehWeight = _veh getVariable "RPP_Vehicle_MaxWeight";
	if (vehicle player != player) then {
		_veh = vehicle player;
		_trunk = _veh getVariable "RPP_Vehicle_Trunk";
		_weight = _veh getVariable "RPP_Vehicle_Weight";
		_MaxvehWeight = _veh getVariable "RPP_Vehicle_MaxWeight";
	};
	_itemClass = _this select 0;
	_amount = _this select 1;
	_getWeight = 0;

	{
		if (_itemClass == _x select 1) exitWith {
			_getWeight = _x select 2;
		};
	} count RPP_Items_Config;
	_Count = for "_i" from 1 to _amount do {
		_weight = _weight - _getWeight;
	};


	if([_itemClass] call RPP_VehicleTrunk_Count < 1) then {
		_i = 0;
		{
			if(_itemClass == _x select 0) then {
				_index = _i;
			};
			_i = _i + 1;
		} forEach _trunk;
		_trunk set [_index, "REMOVE"];
		_trunk = _trunk - ["REMOVE"];
	};

	_index = [_trunk, _itemClass, -_amount] call BIS_fnc_addToPairs;
	[_itemClass,_amount] call RPP_Inventory_Add;
	_veh setVariable ["RPP_Vehicle_Weight",_weight,true];
	_veh setVariable ["RPP_Vehicle_Trunk",_trunk,true];

	_Trunk = _veh getVariable "RPP_Vehicle_Trunk";
	_Weight = _veh getVariable "RPP_Vehicle_Weight";
	_Plate = _veh getVariable "RPP_Vehicle_Licenseplate";

	[2, _Trunk, _Plate] remoteExec ["RPP_DB_partialSync_Vehicle",2]; //Save trunk
	[0, _Weight, _Plate] remoteExec ["RPP_DB_partialSync_Vehicle",2]; //Save weight
};
publicVariable "RPP_VehicleTrunk_Remove";

RPP_VehicleTrunk_GlobalChange = {
	private ["_veh","_weight"];
	_veh = _this select 0;
	_Weight = _this select 1;
	_trunk = _this select 2;

	//[[_veh,_weight,_trunk], "RPP_VehicleTrunk_ChangeServer", false] call BIS_FNC_MP;
	[[_veh,_weight,_trunk], "RPP_VehicleTrunk_ChangeGlobal", true,true] call BIS_FNC_MP;
};
publicVariable "RPP_VehicleTrunk_GlobalChange";

RPP_VehicleTrunk_ChangeServer = {
	private ["_veh","_weight","_trunk"];
	_veh = _this select 0;
	_Weight = _this select 1;
	_trunk = _this select 2;

	_veh setVariable ["RPP_Vehicle_Weight",_weight,true];
	_veh setVariable ["RPP_Vehicle_Trunk",_trunk,true];
};
publicVariable "RPP_VehicleTrunk_ChangeServer";

RPP_VehicleTrunk_ChangeGlobal = {
	private ["_veh","_weight","_trunk"];
	_veh = _this select 0;
	_Weight = _this select 1;
	_trunk = _this select 2;

	_veh setVariable ["RPP_Vehicle_Weight",_weight,true];
	_veh setVariable ["RPP_Vehicle_Trunk",_trunk,true];
};
publicVariable "RPP_VehicleTrunk_ChangeGlobal";