/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_PlayerInventory.sqf

Description:
Player inventory

Error Codes:
701 = item call name is empty
*/
["RPP_Inventory_Dialog",  {
	if (player getVariable 'RPP_Handsup') exitWith {
		_msg = 'You are not allowed to access your inventory while having your handsup!';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	createDialog 'RPP_PlayerMenu';
	buttonSetAction[1600, '[] call RPP_Inventory_Use;'];
	buttonSetAction[1601, '[] call RPP_Inventory_Drop;'];
	buttonSetAction[1602, '[] call RPP_Inventory_Give;'];
	buttonSetAction[1603, '[] call RPP_Inventory_Phone;'];
	buttonSetAction[1604, '[] call RPP_Animation_Dialog;'];
	buttonSetAction[1605, '[] call RPP_CompanySystem_ManagerMenu;'];

	_Cash = [] call RPP_Lib_FormatNumber_Cash;
    _bank = [] call RPP_Lib_FormatNumber_Bank;

	lbAdd [1500, format ['==== Player Status ====',name player]];
	_data1 = lbAdd [1500, format ['Weight: %1/%2',RPP_Weight,RPP_MaxWeight]];
	lbSetData [1500, _data1, 'Weight'];
	_data2 = lbAdd [1500, format ['Bank Account: $%1',_bank]];
	lbSetData [1500, _data2, 'Bank'];

	lbAdd [1500, format ['',name player]];

	lbAdd [1500, format ['==== Inventory ====',name player]];
	if (RPP_Cash > 0) then {
		_data3 = lbAdd [1500, format ['Cash: $%1',_Cash]];
		lbSetData [1500, _data3, 'Cash'];
	};
	{	
		_item = _x select 0;
		_itemAmount = [_x select 0] call RPP_Inventory_Count;
		_data4 = lbAdd [1500, format ['%1 (x%2)',_item,_itemAmount]];
		lbSetData [1500, _data4, _item];
	} foreach RPP_Inventory;
	lbAdd [1500, format ['',name player]];


	lbAdd [1500, format ['==== License ====',name player]];
	{
		_data5 = lbAdd [1500, format ['%1',_x]];
		lbSetData [1500, _data5, _x];
	} foreach RPP_License;


	lbAdd [1500, format ['',name player]];
	lbAdd [1500, format ['==== Skills ====',name player]];
	_data6 = lbAdd [1500, format ['Vehicle Skill: %1/%2',RPP_Skill_Vehicle,RPP_SkillMax]];
	lbSetData [1500, _data6, 'Skill'];
	_data7 = lbAdd [1500, format ['Crafting Skill: %1/%2',RPP_Skill_Crafting,RPP_SkillMax]];
	lbSetData [1500, _data7, 'Skill'];
	_data8 = lbAdd [1500, format ['Mining Skill: %1/%2',RPP_Skill_Mining,RPP_SkillMax]];
	lbSetData [1500, _data8, 'Skill'];
	_data9 = lbAdd [1500, format ['Gathering Skill: %1/%2',RPP_Skill_Gathering,RPP_SkillMax]];
	lbSetData [1500, _data9, 'Skill'];
	_data10 = lbAdd [1500, format ['Fishing Skill: %1/%2',RPP_Skill_Fishing,RPP_SkillMax]];
	lbSetData [1500, _data10, 'Skill'];


	lbAdd [1500, format ['',name player]];
	lbAdd [1500, format ['==== Starving ====',name player]];
	_data11 = lbAdd [1500, format ['Hunger: %1/100',RPP_Hunger]];
	lbSetData [1500, _data11, 'Skill'];
	_data12 = lbAdd [1500, format ['Thirst: %1/100',RPP_Thirst]];
	lbSetData [1500, _data12, 'Skill'];


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
			_data13 = lbAdd [2100, format ['%1 (%2)',name _x, _txt,_x]];
			lbSetData [2100, _data13, getPlayerUID _x];
		};
	} foreach playableUnits;
}] call RPP_Function;
publicVariable 'RPP_Inventory_Dialog';

["RPP_Inventory_Give", {
	private ["_data_ilist","_data_plist","_amount","_cangive"];
	_data_ilist = lbData [ 1500, ( lbCurSel 1500 ) ];
	_data_plist = lbdata [2100,lbCurSel 2100];
	_amount = round(parseNumber(ctrlText 1400));

	if (lbCurSel 2100 isEqualTo -1) exitWith {
		_msg = 'Please select an player first.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (lbCurSel 1500 isEqualTo -1) exitWith {
		_msg = 'Please select an item first.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_data_ilist isEqualTo "") exitWith {
		_msg = 'No item found';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_data_plist isEqualTo "") exitWith {
		_msg = 'No Player found';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_giveto = "";
	{
		if (getPlayerUID _x isEqualTo _data_plist) then {
			_giveto = _x;
		};
	} count playableUnits;
	_cangive = false;
	{
		if (_data_ilist == _x select 1) exitWith {
			_cangive = true;
		};
	} count RPP_Items_Config;
	if (!(_cangive)) exitWith {
		_msg = 'No item found in the config';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_amount <= 0) exitWith {
		_msg = 'Cant give less then 0 items';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_data_plist isEqualTo getPlayerUID player) exitWith {
		_msg = "Hmmmm, maybe you should not try to give your self stuff.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem
	};
	if (_data_ilist isEqualTo "Cash") then {
		if (_amount > RPP_Cash) exitWith {
			_cangive = false;
		};
	};

	if (!(_cangive)) exitWith {
		_msg = "You don't have that much money";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	[[player,_data_ilist,_amount], 'RPP_Inventory_Give_PlayerGet',_giveto] call BIS_FNC_MP;

	if (_data_ilist isEqualTo "Cash") then {
		[_amount] call RPP_AntiCheat_RemoveMoney;
		_msg = format ["You just gave him $%1",_amount];
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;
	} else {		
		[_item,_amount] call RPP_Inventory_Remove;
		_msg = format ["You just gave him %1 (x%2)",_item,_amount];
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;
	};
	closeDialog 1;
}] call RPP_Function;
publicVariable 'RPP_Inventory_Give';

["RPP_Inventory_Give_PlayerGet", {
	private ['_Player','_item','_amount','_getWeight','_getWeight_item'];
	_Player = _this select 0;
	_item = _this select 1;
	_amount = _this select 2;
	_getWeight = '';
	_getWeight_item = '';

	if (_item isEqualTo "Cash") exitWith {
		[_amount] call RPP_AntiCheat_AddMoney;
		_msg = format ['%1 Just gave you $%2 and now got $%3 on you',name _player,_amount,RPP_Cash];
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
	};

	{
		if (_item == _x select 1) exitWith {
			_getWeight_item = _x select 2;
		};
	} count RPP_Items_Config;

	for '_i' from 1 to _amount do {
		_getWeight = _getWeight + _getWeight_item;	
	};

	if (_getWeight > RPP_Weight) exitWith {
		[[player], "RPP_Inventory_Give_Fail",_player] call BIS_FNC_MP;
	};

	[_item,_amount] call RPP_Inventory_Add;

	_msg = format ['%1 Just gave you %2 x%3',name _player,_item,_amount];
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable 'RPP_Inventory_Give_PlayerGet';

["RPP_Inventory_Give_Fail", {
	private ["_Player"];
	_player = _this select 0;
	_msg = format ["%1 will not be able to carry all that!",name _player];
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Inventory_Give_Fail";

["RPP_Inventory_Use", {
	private ['_data','_canuse','_text','_call','_msg','_color'];
	if (lbCurSel 1500 == -1) exitWith {
		_msg = 'Please select an item first.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_data = lbData [ 1500, ( lbCurSel 1500 ) ];
	_canuse = false;
	_text = '';
	_call = '';
	_amount = round(parseNumber(ctrlText 1400));
	RPP_UseItemAmount = _amount;

	{
		if (_data == _x select 1) exitWith {
			_text = _x select 1;
			_canuse = _x select 5;
			_call = _x select 6;
		};
	} count RPP_Items_Config;

	if (!(_canuse)) exitWith {
		_msg = 'You are not allowed to use this item.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_call == '') exitWith {
		_msg = 'ERROR: 701';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	[_data,_amount] call RPP_Inventory_Remove;
	call compile format ['%1;',_call];

	closeDialog 1;
}] call RPP_Function;
publicVariable 'RPP_Inventory_Use';

["RPP_Inventory_Drop", {
	private ['_data','_drop','_weight','_candrop','_dropclass','_amount','_ItemDrop'];
	_data = lbData [ 1500, ( lbCurSel 1500 ) ];
	_drop = false;
	_weight = '';
	_candrop = true;
	_dropclass = '';
	_amount = round(parseNumber(ctrlText 1400));
	{
		if (_data == _x select 1) exitWith {
			_drop = true;
			_weight = _x select 2;
			_candrop = _x select 7;
			_dropclass = _x select 9;
		};
	} count RPP_Items_Config;

	if (!(_Drop)) exitWith {
		_msg = 'Please select an item';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(_candrop)) exitWith {
		_msg = 'You are not allowed to drop this item';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	if (_data == 'Cash') then {
		[_amount] call RPP_AntiCheat_RemoveMoney;
	} else {
		[_data,_amount] call RPP_Inventory_Remove;
	};
	player playmove 'AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon';
	_ItemDrop = createVehicle [ _dropclass, [ getPosATL player, 2, getDir player] call BIS_fnc_relPos, [], 0, 'CAN_COLLIDE' ];  
	[[_ItemDrop,_data,_amount], 'RPP_Inventory_DropGlobal', true] call BIS_FNC_MP;

	_msg = format ['You Dropped %1 x%2',_data,_amount];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	_msg = format ["Player: %1 Dropped Item: %2",name player,_data];
	[_msg] call RPP_Server_Log;

	closeDialog 1;
}] call RPP_Function;
publicVariable 'RPP_Inventory_Drop';

["RPP_Inventory_DropGlobal", {
	private ['_item','_itemname','_amount'];
	_item = _this select 0;
	_itemname = _this select 1;
	_amount = _this select 2;
	_item setVariable ['RPP_ItemDropped',true,true];
	_item setVariable ['RPP_ItemName',_itemname,true];
	_item setVariable ['RPP_ItemAmount',_amount,true];

	_item addAction [format ['Pickup %1 (x%2)',_item getVariable 'RPP_ItemName',_item getVariable 'RPP_ItemAmount'], {[] call RPP_Inventory_Pickup}];
}] call RPP_Function;
publicVariable 'RPP_Inventory_DropGlobal';

["RPP_Inventory_Pickup", {
	private ['_item','_msg','_color','_name','_amount'];
	_item = cursorTarget;
	if (player distance _item > 7) exitWith {
		_msg = 'To far away from the item';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_item getVariable 'RPP_ItemDropped') then {
		player playmove 'AinvPknlMstpSnonWnonDnon_medic_1';
		_Name = _item getVariable 'RPP_ItemName';
		_amount = _item getVariable 'RPP_ItemAmount';
		if (_name == 'Cash') then {
			[_amount] call RPP_AntiCheat_AddMoney;
		} else {
			[_Name,_amount] call RPP_Inventory_Add;
		};
		deleteVehicle _item;
		_msg = format ['Picked up %1 (x%2)',_name,_amount];
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;

		_msg = format ["Player: %1 just picked up: %2 (x%3)",name player,_name,_amount];
		[_msg] call RPP_Server_Log;
	} else {
		_msg = 'This is not an item that you can pickup';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
}] call RPP_Function;
publicVariable 'RPP_Inventory_Pickup';

["RPP_Inventory_Add", {
    private ['_itemClass','_amount','_check','_maxCheck','_Weight','_allow'];
	_itemClass = _this select 0;
	_amount = _this select 1;

    _getWeight = '';

   	{
		if (_itemClass == _x select 1) exitWith {
			_getWeight = _x select 2;
		};
	} count RPP_Items_Config;

	_CheckWeight = RPP_Weight;

	_Count = for '_i' from 1 to _amount do {
		_CheckWeight = _CheckWeight + _getWeight;
	};
	if (_CheckWeight > RPP_MaxWeight) exitWith {
		_msg = 'You cant carry that much';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	RPP_Weight = _CheckWeight;

	[RPP_Inventory, _itemClass, _amount] call BIS_fnc_addToPairs;
}] call RPP_Function;
publicVariable 'RPP_Inventory_Add';

["RPP_Inventory_Count", {
    private ['_itemClass','_return'];
	_itemClass = _this select 0;

	_return = [RPP_Inventory, _itemClass, 0] call BIS_fnc_getFromPairs;

	_return;
}] call RPP_Function;
publicVariable 'RPP_Inventory_Count';

["RPP_Inventory_Remove", {
    private ['_itemClass','_amount','_index','_Weight'];
	_itemClass = _this select 0;
	_amount = _this select 1;
	_getWeight = '';
	_index = [RPP_Inventory, _itemClass, -_amount] call BIS_fnc_addToPairs;

	if([_itemClass] call RPP_Inventory_Count < 1) then {
		_i = 0;
		{
			if(_itemClass == _x select 0) then {
				_index = _i;
			};
			_i = _i + 1;
		} forEach RPP_Inventory;
		RPP_Inventory set [_index, 'REMOVE'];
		RPP_Inventory = RPP_Inventory - ['REMOVE'];
	};

	{
		if (_itemClass == _x select 1) exitWith {
			_getWeight = _x select 2;
		};
	} count RPP_Items_Config;

	_Count = for '_i' from 1 to _amount do {
		RPP_Weight = RPP_Weight - _getWeight;
	};
	if (RPP_Weight < RPP_Weight) then {
		RPP_Weight = 0;
	};
}] call RPP_Function;
publicVariable 'RPP_Inventory_Remove';