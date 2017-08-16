/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Kit.sqf

Description:
Kits
*/
["RPP_Police_Kit", {
	private ["_Items","_item","_amount"];
	if (!(RPP_IsCop)) exitWith {};
	player forceAddUniform "State_Policess";
	player addBackpack "Invisibe_Carryall";
	player addWeapon "RPP_X26Taser_F";
	player addMagazines ["RPP_X26Taser_cartridge",10];

	_Items = 
	[
		["RepairKit",3],
		["Medkit",2],
		["Water",2],
		["Bread",2],
		["HandCuff",1]
	];
	if (RPP_Weight >= 61) exitWith {
		_msg = "You will not be able to Carry all this!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	{
		_Item = _x select 0;
		_amount = _x select 1;
		[_Item,_amount] call RPP_Inventory_Add;
	} foreach _Items;

	_msg = "Successfully used Police Kit";
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Police_Kit";

["RPP_EMT_Kit", {
	private ["_Items","_Item","_amount"];
	if (!(RPP_IsEMT)) exitWith {};

	player addBackpack "RPP_Invisible_Carryall";
	player addHeadgear "RPP_EMT_emt_cap";
	player forceAddUniform "RPP_EMT_emt_uniform";

	_Items = 
	[
		["RepairKit",3],
		["Medkit",2],
		["Water",2],
		["Bread",2]
	];
	if (RPP_Weight >= 61) exitWith {
		_msg = "You will not be able to Carry all this!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	{
		_Item = _x select 0;
		_amount = _x select 1;
		[_Item,_amount] call RPP_Inventory_Add;
	} foreach _Items;

	_msg = "Successfully used EMT Kit";
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_EMT_Kit";