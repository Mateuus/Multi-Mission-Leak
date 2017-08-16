/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Turns a weapon 'Item' into the real thing
*/

private["_className","_action","_amount"];

if(DS_jailed)exitwith{hint "You can't use this while in jail"};
if(DS_doingStuff)exitwith{};
_className = "";
_amount = 0;
switch(_this select 0)do
	{
	case "gunLynx": {_className = "srifle_GM6_F";_amount = 1};
	case "gunLynxAdv": {_className = "srifle_GM6_LRPS_F";_amount = 1};
	case "ammoLynx": {_className = "5Rnd_127x108_APDS_Mag";_amount = 1};
	case "ammoLynxAdv": {_className = "5Rnd_127x108_APDS_Mag";_amount = 5};
	case "ammoRpg": {_className = "RPG32_F";_amount = 1};
	case "ammoRpgAdv": {_className = "RPG32_F";_amount = 3};
	case "ammoRpgHE": {_className = "RPG32_HE_F";_amount = 1};
	case "ammoRpgHEAdv": {_className = "RPG32_HE_F";_amount = 3};
	case "ammoFlash": {_className = "HandGrenade_Stone";_amount = 5};
	case "ammoTear": {_className = "SmokeShellGreen";_amount = 5};
	case "gunRpg": {_className = "launch_RPG32_F";_amount = 1};
	case "gun3gl": {_className = "arifle_AK12_GL_F";_amount = 1};
	case "gunNavid": {_className = "MMG_01_hex_F";_amount = 1};
	case "gunRpg7": {_className = "launch_RPG7_F";_amount = 1};
	case "gunSpmg": {_className = "MMG_02_camo_F";_amount = 1};
	case "ammoRpg7": {_className = "RPG7_F";_amount = 1};
	case "ammoRpg7Adv": {_className = "RPG7_F";_amount = 3};
	case "gunCyrus": {_className = "srifle_DMR_05_hex_F";_amount = 1};
	default {_className = ""};
	};
if(_className == "")exitwith{};
DS_doingStuff = true;
if((_this select 1) == 0)then
	{
	_action = [
			"Using this item while you already have a primary weapon equipped will delete your current primary weapon. Continue?",
			"WARNING",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
	if(!_action)exitwith{DS_doingStuff = false};
	player addWeapon _className;
	[(_this select 0),false,1] call DS_fnc_handleInventory;
	};
if((_this select 1) == 1)then
	{
	_action = [
			"This item will place Ammo in your backpack, vest or clothing. Using this item when there is no space will result in lost ammo. Continue?",
			"WARNING",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
	if(!_action)exitwith{DS_doingStuff = false};
	while{(_amount > 0)}do
		{
		[_className] call DS_fnc_equipItem;
		_amount = _amount - 1;
		};
	[(_this select 0),false,1] call DS_fnc_handleInventory;
	};
DS_doingStuff = false;

if((player getVariable ["security",false])&&((_this select 0) == "gun3gl"))then {
	player addMagazine "30Rnd_762x39_Mag_F";
	player addMagazine "30Rnd_762x39_Mag_F";
	player addMagazine "30Rnd_762x39_Mag_F";
	player addMagazine "30Rnd_762x39_Mag_F";
	player addMagazine "30Rnd_762x39_Mag_F";
	player addMagazine "30Rnd_762x39_Mag_F";
	player addMagazine "30Rnd_762x39_Mag_F";
	player addMagazine "30Rnd_762x39_Mag_F";
	player addMagazine "30Rnd_762x39_Mag_F";
	player addMagazine "30Rnd_762x39_Mag_F";
};