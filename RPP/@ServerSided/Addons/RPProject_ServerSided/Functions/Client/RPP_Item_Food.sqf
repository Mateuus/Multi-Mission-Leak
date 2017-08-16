/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Item_Food.sqf

Description:
Using drinks / food
*/
["RPP_UseItem_Food", {
	private ['_item','_effect','_msg','_color'];
	_item = _this select 0;
	_effect = 0;
	{
		if (_item == _x select 0) exitWith {
			_effect = _x select 1;
		};
	} count RPP_Food_Config;

	_Count = for '_i' from 1 to RPP_UseItemAmount do {
		RPP_Hunger = RPP_Hunger + _effect;
	};

	if (RPP_Hunger > 100) then {
		RPP_Hunger = 100;
	};

	_msg = format ['You just eat %1, current hunger: %2/100',_item,RPP_Hunger];
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable 'RPP_UseItem_Food';

["RPP_UseItem_Drink", {
	private ['_item','_effect','_msg','_color'];
	_item = _this select 0;
	_effect = 0;
	{
		if (_item == _x select 0) exitWith {
			_effect = _x select 1;
		};
	} count RPP_Drink_Config;

	_Count = for '_i' from 1 to RPP_UseItemAmount do {
		RPP_Thirst = RPP_Thirst + _effect;
	};

	if (RPP_Thirst > 100) then {
		RPP_Thirst = 100;
	};

	_msg = format ['You just drinked %1, current Thirst: %2/100',_item,RPP_Thirst];
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable 'RPP_UseItem_Drink';