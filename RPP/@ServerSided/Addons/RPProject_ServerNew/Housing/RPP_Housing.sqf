/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Housing.sqf

Description:
Player Housing
*/
["RPP_HousingTrunk_Add", {
    private ['_itemClass','_amount','_check','_maxCheck','_Weight','_allow'];
	_itemClass = _this select 0;
	_amount = _this select 1;

    _getWeight = '';

   	{
		if (_itemClass == _x select 1) exitWith {
			_getWeight = _x select 2;
		};
	} count RPP_Items_Config;

	_CheckWeight = RPP_House_Weight;

	_Count = for '_i' from 1 to _amount do {
		_CheckWeight = _CheckWeight + _getWeight;
	};
	if (_CheckWeight > RPP_House_MaxWeight) exitWith {
		_msg = 'You cant carry that much';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	RPP_House_Weight = _CheckWeight;

	[RPP_House_Trunk, _itemClass, _amount] call BIS_fnc_addToPairs;

	[_itemClass,1] call RPP_Inventory_Remove;
	[0,RPP_House_Trunk,RPP_Interact_House_POS] remoteExec ["RPP_DB_partialSync_House",2];
	[1,RPP_House_Weight,RPP_Interact_House_POS] remoteExec ["RPP_DB_partialSync_House",2];

	[] spawn {
		buttonSetAction[1604,""];
		buttonSetAction[1605,""];
		lbClear 1501;
		lbClear 1500;
		lbAdd [1500, "Loading Database..."];
		sleep 0.5;
		[RPP_Interact_House_POS,player] remoteExec ['RPP_DB_House_GetTrunk',2];
		buttonSetAction[1604,"[] call RPP_Housing_StoreItem;"];
		buttonSetAction[1605,"[] call RPP_Housing_TakeItem;"];
	};
}] call RPP_Function;
publicVariable 'RPP_HousingTrunk_Add';

["RPP_HousingTrunk_Count", {
    private ['_itemClass','_return'];
	_itemClass = _this select 0;

	_return = [RPP_House_Trunk, _itemClass, 0] call BIS_fnc_getFromPairs;

	_return;
}] call RPP_Function;
publicVariable 'RPP_HousingTrunk_Count';

["RPP_HousingTrunk_Remove", {
    private ['_itemClass','_amount','_index','_Weight'];
	_itemClass = _this select 0;
	_amount = _this select 1;
	_getWeight = '';
	_index = [RPP_House_Trunk, _itemClass, -_amount] call BIS_fnc_addToPairs;

	if([_itemClass] call RPP_HousingTrunk_Count < 1) then {
		_i = 0;
		{
			if(_itemClass == _x select 0) then {
				_index = _i;
			};
			_i = _i + 1;
		} forEach RPP_House_Trunk;
		RPP_House_Trunk set [_index, 'REMOVE'];
		RPP_House_Trunk = RPP_House_Trunk - ['REMOVE'];
	};

	{
		if (_itemClass == _x select 1) exitWith {
			_getWeight = _x select 2;
		};
	} count RPP_Items_Config;

	_Count = for '_i' from 1 to _amount do {
		RPP_House_Weight = RPP_House_Weight - _getWeight;
	};
	if (RPP_House_Weight < RPP_House_Weight) then {
		RPP_House_Weight = 0;
	};

	[_itemClass,1] call RPP_Inventory_Add;
	[0,RPP_House_Trunk,RPP_Interact_House_POS] remoteExec ["RPP_DB_partialSync_House",2];
	[1,RPP_House_Weight,RPP_Interact_House_POS] remoteExec ["RPP_DB_partialSync_House",2];

	[RPP_Interact_House_POS,player] remoteExec ['RPP_DB_House_GetTrunk',2];

	[] spawn {
		buttonSetAction[1604,""];
		buttonSetAction[1605,""];
		lbClear 1501;
		lbClear 1500;
		lbAdd [1500, "Loading Database..."];
		sleep 0.5;
		[RPP_Interact_House_POS,player] remoteExec ['RPP_DB_House_GetTrunk',2];
		buttonSetAction[1604,"[] call RPP_Housing_StoreItem;"];
		buttonSetAction[1605,"[] call RPP_Housing_TakeItem;"];
	};
}] call RPP_Function;
publicVariable 'RPP_HousingTrunk_Remove';

["RPP_Housing_ServerSetup", {
	[] spawn {
		RPP_HouseAdded = "";
		RPP_Server_Housing_Ready = false;
		publicVariable "RPP_Server_Housing_Ready";
		_area = getMarkerPos "RPP_Civ_Spawn";
		session_finished = false;
		diag_log "::LOADING HOUSING::";

		{	

			RPP_HouseAdded = _x;

			_pos = getpos _x;
			session_finished = false;

			_msg = format ["Server loading house: %1...",RPP_HouseAdded];
			[_msg] call RPP_Message_Global;

			[_pos,RPP_HouseAdded] remoteExec ["RPP_DB_insertHouse",2];
			diag_log format ["House: %1 in use!",RPP_HouseAdded];

			waitUntil {session_finished};

			_msg = format ["Server loaded house: %1 Successfully!!",RPP_HouseAdded];
			[_msg] call RPP_Message_Global;
		} foreach nearestObjects [_area, RPP_House_Class, 999999];

		waitUntil{session_finished};

		RPP_Server_Housing_Ready = true;
		publicVariable "RPP_Server_Housing_Ready";

		diag_log "::HOUSING LOADED::";
	};
}] call RPP_Function;
publicVariable "RPP_Housing_ServerSetup";

["RPP_Housing_Breakinto",{
	[_this select 0] spawn {
		params ["_house"];
		RPP_Interact_House = _house;
		RPP_Interact_House_POS = getpos _house;

		["Breaking into house...",RPP_Yellow] call RPP_MessageSystem;

		_Lock = RPP_Interact_House getVariable "RPP_House_Locked";

		if (_Lock isEqualTo 0) exitWith {
			["The house is not locked.",RPP_Red] call RPP_MessageSystem;
		};

		if (RPP_IsCop) exitWith {
			_item1 = "Breacher";
			_item2 = "Lockpick";
			if ([_item1] call RPP_Inventory_Count >= 1) exitWith {
				player playmove "AinvPknlMstpSnonWnonDnon_medic_1";

				sleep 4;
				player switchmove "";
				player playmove "AinvPknlMstpSnonWnonDnon_medic_1";

				sleep 4;

				RPP_Interact_House setVariable ["RPP_House_Locked",1,true,true];
				[] call RPP_Housing_Keyuse;

				["The Police are Breaching into a house"] call RPP_Message_Global;
			};
			if ([_item2] call RPP_Inventory_Count >= 1) exitWith {
				player playmove "AinvPknlMstpSnonWnonDnon_medic_1";

				sleep 4;
				player switchmove "";
				player playmove "AinvPknlMstpSnonWnonDnon_medic_1";

				sleep 4;

				RPP_Interact_House setVariable ["RPP_House_Locked",1,true,true];
				[] call RPP_Housing_Keyuse;

				["The Police are Breaching into a house"] call RPP_Message_Global;
			};

			["You don't have the right tools for this.",RPP_Red] call RPP_MessageSystem;
		};

		if (RPP_IsCiv) exitWith {
			_item1 = "Breacher";
			_item2 = "Lockpick";
			if ([_item1] call RPP_Inventory_Count >= 1) exitWith {	
				player playmove "AinvPknlMstpSnonWnonDnon_medic_1";

				sleep 4;
				player switchmove "";
				player playmove "AinvPknlMstpSnonWnonDnon_medic_1";

				sleep 4;

				RPP_Interact_House setVariable ["RPP_House_Locked",1,true,true];
				[] call RPP_Housing_Keyuse;	

				["A Civilian just broken into a house."] call RPP_Message_Global;
			};
			if ([_item2] call RPP_Inventory_Count >= 1) exitWith {
				player playmove "AinvPknlMstpSnonWnonDnon_medic_1";

				sleep 4;
				player switchmove "";
				player playmove "AinvPknlMstpSnonWnonDnon_medic_1";

				sleep 4;

				RPP_Interact_House setVariable ["RPP_House_Locked",1,true,true];
				[] call RPP_Housing_Keyuse;	

				["A Civilian just broken into a house."] call RPP_Message_Global;
			};

			["You don't have the right tools for this.",RPP_Red] call RPP_MessageSystem;
		};

		if (RPP_IsEMT) exitWith {
			_item1 = "Breacher";
			_item2 = "Lockpick";
			if ([_item1] call RPP_Inventory_Count >= 1) exitWith {	
				player playmove "AinvPknlMstpSnonWnonDnon_medic_1";

				sleep 4;
				player switchmove "";
				player playmove "AinvPknlMstpSnonWnonDnon_medic_1";

				sleep 4;

				RPP_Interact_House setVariable ["RPP_House_Locked",1,true,true];
				[] call RPP_Housing_Keyuse;

				["The EMS Broke into a house"] call RPP_Message_Global;
			};
			if ([_item2] call RPP_Inventory_Count >= 1) exitWith {
				player playmove "AinvPknlMstpSnonWnonDnon_medic_1";

				sleep 4;
				player switchmove "";
				player playmove "AinvPknlMstpSnonWnonDnon_medic_1";

				sleep 4;

				RPP_Interact_House setVariable ["RPP_House_Locked",1,true,true];
				[] call RPP_Housing_Keyuse;	

				["The EMS Broke into a house"] call RPP_Message_Global;
			};

			["You don't have the right tools for this.",RPP_Red] call RPP_MessageSystem;
		};
	};
}] call RPP_Function;
publicVariable "RPP_Housing_Breakinto";

["RPP_Housing_Keyuse", {
	[] spawn {
		private ["_Lock"];

		_Lock = RPP_Interact_House getVariable "RPP_House_Locked";

		if (_Lock isEqualTo 1) then {
			RPP_Interact_House setVariable ['bis_disabled_Door_1',0,true];
			RPP_Interact_House setVariable ['bis_disabled_Door_2',0,true];
	   		RPP_Interact_House setVariable ['bis_disabled_Door_3',0,true];
	  		RPP_Interact_House setVariable ['bis_disabled_Door_4',0,true];
	   		RPP_Interact_House setVariable ['bis_disabled_Door_5',0,true];
	   		RPP_Interact_House setVariable ['bis_disabled_Door_6',0,true];
	   		RPP_Interact_House setVariable ["RPP_House_Locked",0,true];
	   		["House unlocked.",RPP_Yellow] call RPP_MessageSystem;
		} else {
			RPP_Interact_House setVariable ['bis_disabled_Door_1',1,true];
			RPP_Interact_House setVariable ['bis_disabled_Door_2',1,true];
	   		RPP_Interact_House setVariable ['bis_disabled_Door_3',1,true];
	  		RPP_Interact_House setVariable ['bis_disabled_Door_4',1,true];
	   		RPP_Interact_House setVariable ['bis_disabled_Door_5',1,true];
	   		RPP_Interact_House setVariable ['bis_disabled_Door_6',1,true];
	   		RPP_Interact_House setVariable ["RPP_House_Locked",1,true];
	   		["House locked.",RPP_Yellow] call RPP_MessageSystem;
		};
	};
}] call RPP_Function;
publicVariable "RPP_Housing_Keyuse";

["RPP_Housing_ViewTrunk", {
	RPP_Interact_House_Owners = RPP_Interact_House getVariable "RPP_House_Owners";
	_locked = RPP_Interact_House getVariable "RPP_House_Locked";

	_canopen = false;

	{
		if (getPlayerUID player == _x select 1) exitWith {
			_canopen = true;
		};
	} count RPP_Interact_House_Owners;

	if (_locked isEqualTo 0) then {
		_canopen = true;
	};

	if (!(_canopen)) exitWith {
		["This house is locked.",RPP_Red] call RPP_MessageSystem;
	};

	lbClear 1500;
	lbClear 1501;
	RPP_House_Trunk = _this select 0;

	lbAdd [1500,format["==== Weight: %1/%2 ===",RPP_House_Weight,RPP_House_MaxWeight]];
	{	
		_item = _x select 0;
		_itemAmount = [_x select 0] call RPP_HousingTrunk_Count;
		if (!(_itemAmount <= 0)) then {
			_data1 = lbAdd [1500, format ['%1 (x%2)',_item,_itemAmount]];
			lbSetData [1500, _data1, _item];
		};
	} foreach RPP_House_Trunk;

	{	
		_item = _x select 0;
		_itemAmount = [_x select 0] call RPP_Inventory_Count;
		_data4 = lbAdd [1501, format ['%1 (x%2)',_item,_itemAmount]];
		lbSetData [1501, _data4, _item];
	} foreach RPP_Inventory;
}] call RPP_Function;
publicVariable "RPP_Housing_ViewTrunk";

["RPP_Housing_TakeItem", {
	RPP_Interact_House_Owners = RPP_Interact_House getVariable "RPP_House_Owners";
	_locked = RPP_Interact_House getVariable "RPP_House_Locked";

	_canopen = false;

	{
		if (getPlayerUID player == _x select 1) exitWith {
			_canopen = true;
		};
	} count RPP_Interact_House_Owners;

	if (_locked isEqualTo 0) then {
		_canopen = true;
	};

	if (!(_canopen)) exitWith {
		["This house is locked.",RPP_Red] call RPP_MessageSystem;
	};

	_item = lbData [ 1500, ( lbCurSel 1500 ) ];

	if (_item isEqualTo "") exitWith {
		["Please select an item to take",RPP_Red] call RPP_MessageSystem;
	};
	buttonSetAction[1604,""];
	buttonSetAction[1605,""];

	[_item,1] call RPP_HousingTrunk_Remove;
}] call RPP_Function;
publicVariable "RPP_Housing_TakeItem";

["RPP_Housing_StoreItem", {
	RPP_Interact_House_Owners = RPP_Interact_House getVariable "RPP_House_Owners";
	_locked = RPP_Interact_House getVariable "RPP_House_Locked";

	_canopen = false;

	{
		if (getPlayerUID player == _x select 1) exitWith {
			_canopen = true;
		};
	} count RPP_Interact_House_Owners;

	if (_locked isEqualTo 0) then {
		_canopen = true;
	};

	if (!(_canopen)) exitWith {
		["This house is locked.",RPP_Red] call RPP_MessageSystem;
	};

	_item = lbData [ 1501, ( lbCurSel 1501 ) ];

	if (_item isEqualTo "") exitWith {
		["Please select an item to store",RPP_Red] call RPP_MessageSystem;
	};
	buttonSetAction[1604,""];
	buttonSetAction[1605,""];

	[_item,1] call RPP_HousingTrunk_Add;
}] call RPP_Function;
publicVariable "RPP_Housing_StoreItem";

["RPP_Housing_CopyKey",{
	if (!(name player isEqualTo RPP_House_OwnerName)) exitWith {
		["You don't have the permissions to make a copy of the house keys.",RPP_Red] call RPP_MessageSystem;
	};

	private ["_pid","_sendto","_name","_update"];
	_pid = lbData [ 2100, ( lbCurSel 2100 ) ];
	_sendto = "";
	_name = "";

	if (_pid isEqualTo "") exitWith {
		["Please select a player.",RPP_Red] call RPP_MessageSystem;
	};

	if (_pid isEqualTo getPlayerUID player) exitWith {
		["You already got the keys...",RPP_Red] call RPP_MessageSystem;
	};

	{
		if (getPlayerUID _x == _pid) exitWith {
			_sendto = _x;
			_name = name _x;
		};
	} count playableUnits;

	_update = [];
	_update = _update + [ [_name,_pid] ];

	[RPP_Interact_House,RPP_Interact_House_POS,_update,player] remoteExec ["RPP_Housing_GetCopy",_sendto];

	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_Housing_CopyKey";

["RPP_Housing_GetCopy", {
	params["_house","_pos","_update","_sender"];
	[_house,_pos,_update,player,_sender] remoteExec ["RPP_DB_House_UpdateOwners",2];
}] call RPP_Function;
publicVariable "RPP_Housing_GetCopy";

["RPP_Housing_ReturnInfo", {
	params["_ownername","_weight","_Maxweight","_trunk","_pid"];
	closeDialog 1;
	disableSerialization;

	createDialog "RPP_HouseMenu";

	buttonSetAction[1602,"[RPP_Interact_House] call RPP_Housing_Keyuse;"];
	buttonSetAction[1600,"[RPP_Interact_House_POS,player] remoteExec ['RPP_DB_House_GetTrunk',2];"];
	buttonSetAction[1603,"closeDialog 1;"];
	buttonSetAction[1604,"[] call RPP_Housing_StoreItem;"];
	buttonSetAction[1605,"[] call RPP_Housing_TakeItem;"];
	buttonSetAction[1601,"[RPP_Interact_House] call RPP_Housing_CopyKey;"];
	_text = uiNameSpace getVariable ["RPP_HouseMenu",displayNull];
	_owner = _text displayCtrl 1000;
	_owner ctrlSetText format["House Owner: %1",_ownername];

	{	
		_item = _x select 0;
		_itemAmount = [_x select 0] call RPP_Inventory_Count;
		_data4 = lbAdd [1501, format ['%1 (x%2)',_item,_itemAmount]];
		lbSetData [1501, _data4, _item];
	} foreach RPP_Inventory;

	RPP_House_Trunk = _trunk;
	RPP_House_Weight = parseNumber (_weight);
	RPP_House_MaxWeight = parseNumber (_Maxweight);
	RPP_House_OwnerID = parseNumber (_pid);
	RPP_House_OwnerName = _ownername;

	{
		if (_x distance player < 15) then {
			_side = "";
			switch (side _x) do { 
				case west: {
					_side = "Police";
				}; 
				case civilian: {
					_side = "Civilian";
				}; 
				independent: {
					_side = "EMS";
				}; 
			};
			_list = lbAdd[2100,format["%1 (%2)",name _x,_side]];
			lbSetData [2100, _list, getPlayerUID _x];
		};
	} foreach playableUnits;
}] call RPP_Function;
publicVariable "RPP_Housing_ReturnInfo";

["RPP_Housing_Menu",{
	[_this select 0] spawn {
		private ["_locked","_canopen"];
		params ["_house"];
		RPP_Interact_House = _house;
		RPP_Interact_House_POS = getpos _house;

		if (_House getVariable "RPP_House_inuse") exitWith {
			RPP_Interact_House_Owners = _House getVariable "RPP_House_Owners";
			_locked = _House getVariable "RPP_House_Locked";

			_canopen = false;

			{
				if (getPlayerUID player == _x select 1) exitWith {
					_canopen = true;
				};
			} count RPP_Interact_House_Owners;

			if (_locked isEqualTo 0) then {
				_canopen = true;
			};

			if (!(_canopen)) exitWith {
				["This house is locked.",RPP_Red] call RPP_MessageSystem;
			};

			[RPP_Interact_House_POS,player] remoteExec ["RPP_DB_House_GetInfo",2];
		};
		["Looks like this house is not in use.",RPP_Red] call RPP_MessageSystem;
	};
}] call RPP_Function;
publicVariable "RPP_Housing_Menu";

["RPP_Housing_BuyHouse", {
	private ["_house","_price"];
	params ["_house"];
	_classname = typeOf _house;

	_price = 0;
	_Maxweight = "";
	{
		if (_classname == _x select 0) exitWith {
			_price = _x select 1;
			_Maxweight = _x select 2;
		};
	} count RPP_House_Class_Cfg;

	if (_price isEqualTo 0) exitWith {
		["Failed to buy house.",RPP_Red] call RPP_MessageSystem;
	};

	if (RPP_Cash < _price) exitWith {
		["You don't have that much cash on you.",RPP_Red] call RPP_MessageSystem;
	};

	_pos = "";

	{
		if (_house == _x) exitWith {
			_pos = getPos _x;
		};
	} count nearestObjects [player, RPP_House_Class, 999999];

	["Buying House...",RPP_Yellow] call RPP_MessageSystem;

	[_pos,_house,player,_Maxweight] remoteExec ["RPP_DB_insertHouse_buy",2];
}] call RPP_Function;
publicVariable "RPP_Housing_BuyHouse";

["RPP_Housing_BuyHouse_Failed",{
	private ["_CurrentOwner"];
	params["_CurrentOwner"];

	if (getPlayerUID player isEqualTo _CurrentOwner) then {
		["Looks like you already own this house.",RPP_Yellow] call RPP_MessageSystem;
	} else {
		["Someone else is already owning this house.",RPP_Red] call RPP_MessageSystem;
	};
}] call RPP_Function;
publicVariable "RPP_Housing_BuyHouse_Failed";

["RPP_Housing_BuyHouse_Final",{
	private ["_house","_price"];
	params ["_house"];
	_classname = typeof _house;
	_price = "";

	{
		if (_classname == _x select 0) exitWith {
			_price = _x select 1;
		};
	} count RPP_House_Class_Cfg;

	[_price] call RPP_AntiCheat_RemoveMoney;

	[format["House bought for $%1, You are now the new owner.",_price],RPP_Green] call RPP_MessageSystem;

	RPP_HomeCount = RPP_HomeCount + 1;

	_HouseMarkers = createMarkerLocal [format["HousePos_%1",RPP_HomeCount], getpos _house];
	_HouseMarkers setMarkerColorLocal "ColorGreen";
	_HouseMarkers setMarkerTypeLocal "mil_dot";
	_HouseMarkers setMarkerTextLocal format ["Home %1",RPP_HomeCount];
}] call RPP_Function;
publicVariable "RPP_Housing_BuyHouse_Final";

["RPP_Housing_SetVariable_House",{
	private ["_pid","_mainowner","_Owners","_house","_pos","_trunk","_locked","_weight","_maxweight"];

	_pid = _this select 0;
	_mainowner = _this select 1;
	_Owners = _this select 2;
	_house = _this select 3;
	_pos = _this select 4;
	_trunk = _this select 5;
	_locked = _this select 6;
	_weight = _this select 7;
	_maxweight = _this select 8;
	_area = getMarkerPos "RPP_Civ_Spawn";

	{
		if (call compile format ["'%1' == '%2'",_pos,getpos _x]) exitWith {
			_house = _x;
			_x setVariable ["RPP_House_pid",_pid,true];
			_x setVariable ["RPP_House_Mainowner",_mainowner,true];
			_x setVariable ["RPP_House_Owners",_Owners,true];
			_x setVariable ["RPP_House_obj",_x,true];
			_x setVariable ["RPP_House_pos",_pos,true];
			_x setVariable ["RPP_House_Trunk",_trunk,true];
			_x setVariable ["RPP_House_Locked",_locked,true];
			_x setVariable ["RPP_House_Weight",_weight,true];
			_x setVariable ["RPP_House_MaxWeight",_maxweight,true];
			_x setVariable ["RPP_House_inuse",true,true];
		};
	} count nearestObjects [_area, RPP_House_Class, 999999];

	session_finished = true;
}] call RPP_Function;
publicVariable "RPP_Housing_SetVariable_House";

["RPP_Housing_Markers",{
	params ["_pos"];
	{
		if (call compile format ["'%1' == '%2'",_pos,getpos _x]) exitWith {
			RPP_HomeCount = RPP_HomeCount + 1;
			_HouseMarkers = createMarkerLocal [format["HousePos_%1",RPP_HomeCount], getpos _x];
			_HouseMarkers setMarkerColorLocal "ColorGreen";
			_HouseMarkers setMarkerTypeLocal "mil_dot";
			_HouseMarkers setMarkerTextLocal format ["Home %1",RPP_HomeCount];
		};
	} count nearestObjects [player, RPP_House_Class, 999999];
}] call RPP_Function;
publicVariable "RPP_Housing_Markers";

[] spawn {
	sleep 3;
	[] call RPP_Housing_ServerSetup;	
};