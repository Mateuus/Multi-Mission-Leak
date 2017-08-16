/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Loads the medic out with the default gear.
*/
private["_handle","_medlevel"];
[] call lhm_fnc_stripDownPlayer;
_medlevel = (call lhm_medicLevel);

switch (true) do
{
	case (_medlevel in [1]):
	{
		player forceAddUniform "U_Competitor";
		player addBackpack "B_AssaultPack_khk";
		player addHeadgear "H_Watchcap_blk";
		player addWeapon "Binocular";
	};
	case (_medlevel in [2]):
	{
		player forceAddUniform "U_Competitor";
		player addBackpack "B_Kitbag_cbr";
		player addHeadgear "H_Watchcap_blk";
		player addWeapon "Binocular";
	};
	case (_medlevel in [3]):
	{
		player forceAddUniform "U_I_CombatUniform";
		player addBackpack "B_Kitbag_cbr";
		player addHeadgear "H_Watchcap_blk";
		player addWeapon "Binocular";
	};
	case (_medlevel in [4]):
	{
		player forceAddUniform "U_I_CombatUniform";
		player addBackpack "B_Carryall_oucamo";
		player addHeadgear "H_Watchcap_blk";
		player addWeapon "Rangefinder";
	};
	case (_medlevel in [5]):
	{
		player forceAddUniform "U_I_CombatUniform";
		player addBackpack "B_Carryall_oucamo";
		player addHeadgear "H_Beret_02";
		player addWeapon "Rangefinder";
	};
};

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";
player addGoggles "G_Aviator";
player linkItem "NVGoggles_OPFOR";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItemToBackpack "ToolKit";
player addItemToBackpack "Medikit";


if (needReload player == 1) then {reload player};

[] call lhm_fnc_saveGear;