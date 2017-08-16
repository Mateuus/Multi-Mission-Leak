/*
	File: fn_secLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Blackd0g,
	Bloodwyn(Headgear)
	Description:
	Loads the security out with the default gear.
*/
private["_handle"];
_handle = [] spawn lhm_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
player forceaddUniform "U_O_SpecopsUniform_ocamo";
_rndm=floor(random 4);//zufall, welche und ob Kopfbedeckung
if(_rndm==0) then
{
	player addHeadgear "H_MilCap_blue";
};
if(_rndm==1) then
{
	player addHeadgear "H_Bandanna_blu";
};
if(_rndm==2) then
{
	player addHeadgear "H_Cap_blu";
};
player addVest "V_TacVest_blk";
player addBackpack "B_Carryall_oucamo";
for "_i" from 1 to 4 do {player addItemToBackpack "6Rnd_45ACP_Cylinder";};
player addItemToBackpack "ToolKit";
player addItemToBackpack "FirstAidKit";
player addItemToBackpack "FirstAidKit";

player addWeapon "LMG_Zafir_F";
player addWeapon "hgun_Pistol_heavy_02_F";
player addMagazine "150Rnd_762x54_Box_Tracer";
player addMagazine "150Rnd_762x54_Box_Tracer";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "NVGoggles";
player assignItem "NVGoggles";

if (needReload player == 1) then {reload player};

[] call lhm_fnc_saveGear;