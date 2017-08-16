
private["_handle"];
_handle = [] spawn ES_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};
 
if((call ES_coplevel) == 1) then
{
	player addUniform "U_Rangemaster";
	player addVest "V_Rangemaster_belt";
	player addBackpack "B_Carryall_cbr";
	[player, "hgun_P07_snds_F", 2] call BIS_fnc_addWeapon;
};
 
if((call ES_coplevel) == 2) then
{
	player addUniform "U_Rangemaster";
	player addVest "V_Rangemaster_belt";
	player addBackpack "B_Carryall_cbr";
	[player, "arifle_SDAR_F", 3] call BIS_fnc_addWeapon;
	[player, "hgun_P07_snds_F", 2] call BIS_fnc_addWeapon;
};
 
if((call ES_coplevel) == 3) then
{
	player addUniform "U_Rangemaster";
	player addVest "V_Rangemaster_belt";
	player addBackpack "B_Carryall_cbr";
	[player, "arifle_SDAR_F", 3] call BIS_fnc_addWeapon;
	[player, "hgun_P07_snds_F", 2] call BIS_fnc_addWeapon;
};
 
if((call ES_coplevel) == 4) then
{
	player addUniform "U_Rangemaster";
	player addVest "V_Rangemaster_belt";
	player addBackpack "B_Carryall_cbr";
	[player, "Binocular", 1] call BIS_fnc_addWeapon;
	[player, "arifle_SDAR_F", 3] call BIS_fnc_addWeapon;
	[player, "hgun_P07_snds_F", 2] call BIS_fnc_addWeapon;
};

if((call ES_coplevel) == 5) then
{
	player addUniform "U_Rangemaster";
	player addVest "V_Rangemaster_belt";
	player addBackpack "B_Carryall_cbr";
	[player, "Binocular", 1] call BIS_fnc_addWeapon;
	[player, "arifle_SDAR_F", 3] call BIS_fnc_addWeapon;
	[player, "hgun_P07_snds_F", 2] call BIS_fnc_addWeapon;
};
 
if((call ES_coplevel) == 6) then
{
	player addUniform "U_Rangemaster";
	player addVest "V_Rangemaster_belt";
	player addBackpack "B_Carryall_cbr";
	[player, "Binocular", 1] call BIS_fnc_addWeapon;
	[player, "arifle_MX_SW_Hamr_pointer_F", 5] call BIS_fnc_addWeapon;
	[player, "hgun_P07_snds_F", 5] call BIS_fnc_addWeapon;
};


if((call ES_coplevel) == 7) then
{
	player addUniform "U_Rangemaster";
	player addVest "V_Rangemaster_belt";
	player addBackpack "B_Carryall_cbr";
	[player, "arifle_MX_SW_Hamr_pointer_F", 5] call BIS_fnc_addWeapon;
	[player, "hgun_P07_snds_F", 5] call BIS_fnc_addWeapon;
	[player, "Rangefinder", 1] call BIS_fnc_addWeapon;
};

if((call ES_coplevel) == 8) then
{
	player addUniform "U_B_CombatUniform_mcam_vest";
	player addVest "V_Rangemaster_belt";
	player addBackpack "B_Carryall_cbr";
	[player, "Rangefinder", 1] call BIS_fnc_addWeapon;
	[player, "arifle_MX_SW_Hamr_pointer_F", 5] call BIS_fnc_addWeapon;
	[player, "hgun_P07_snds_F", 5] call BIS_fnc_addWeapon;
	[player, "Rangefinder", 1] call BIS_fnc_addWeapon;
};

if((call ES_coplevel) == 9) then
{

	If(license_cop_ncis)then
	{player forceAddUniform "U_B_CombatUniform_mcam";}else
	{player forceAddUniform "U_I_CombatUniform_shortsleeve";};
	player addVest "V_Rangemaster_belt";
	player addBackpack "B_Carryall_cbr";
	[player, "arifle_MX_SW_Hamr_pointer_F", 5] call BIS_fnc_addWeapon;
	[player, "hgun_P07_snds_F", 5] call BIS_fnc_addWeapon;
	[player, "Rangefinder", 1] call BIS_fnc_addWeapon;
};

if((call ES_coplevel) == 10) then
{
	player addUniform "U_B_CombatUniform_mcam";
	player addVest "V_Rangemaster_belt";
	player addBackpack "B_Carryall_cbr";
	[player, "Rangefinder", 1] call BIS_fnc_addWeapon;
	[player, "arifle_MX_SW_Hamr_pointer_F", 5] call BIS_fnc_addWeapon;
	[player, "hgun_P07_snds_F", 5] call BIS_fnc_addWeapon;
	[player, "Rangefinder", 1] call BIS_fnc_addWeapon;
};

if((call ES_coplevel) == 11) then
{
	player addUniform "U_B_CombatUniform_mcam";
	player addVest "V_Rangemaster_belt";
	player addBackpack "B_Carryall_cbr";
	[player, "Rangefinder", 1] call BIS_fnc_addWeapon;
	[player, "arifle_MX_SW_Hamr_pointer_F", 5] call BIS_fnc_addWeapon;
	[player, "hgun_P07_snds_F", 5] call BIS_fnc_addWeapon;
	[player, "Rangefinder", 1] call BIS_fnc_addWeapon;
};

if((call ES_coplevel) == 12) then
{
	player addUniform "U_B_CombatUniform_mcam";
	player addVest "V_Rangemaster_belt";
	player addBackpack "B_Carryall_cbr";
	[player, "Rangefinder", 1] call BIS_fnc_addWeapon;
	[player, "arifle_MX_SW_Hamr_pointer_F", 5] call BIS_fnc_addWeapon;
	[player, "hgun_P07_snds_F", 5] call BIS_fnc_addWeapon;
	[player, "Rangefinder", 1] call BIS_fnc_addWeapon;
};

if((call ES_coplevel) >= 4) then
{
	player addItem "NVGoggles";
	player assignItem "NVGoggles";
};

player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";

if (isClass(configFile >> "CfgPatches" >> "EisenschmiedeHighTextures")) then { [] spawn ES_fnc_updateClothing; }else{ [] spawn ES_fnc_updateClothing; };
[] call ES_fnc_saveGear;