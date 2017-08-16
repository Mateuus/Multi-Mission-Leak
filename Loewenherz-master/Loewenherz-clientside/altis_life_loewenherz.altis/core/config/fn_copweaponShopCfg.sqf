#include <macro.h>
/*
	File: fn_copweaponShopCfg.sqf
	Author: Barney

	Description:
	Master configuration file for the COP Weapon Shop

	Return:
	String: Close the menu
	Array:
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]

	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/
private["_shop","_rank","_rankname","_all","_header","_ret"];
_shop = param [0,"",[""]];
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.
if(playerside != west) exitWith {closeDialog 0; hint "Du bist kein Cop?!";};
_rank = __GETC__(lhm_coplevel);
_rankname = "";
//if(playerside != WEST) exitWIth {hint "Du bist kein Cop"; closeDialog 0;};

switch (_rank) do {
case 1: {_rankname = "Recruit";};
case 2: {_rankname = "Officer";};
case 3: {_rankname = "Corporal";};
case 4: {_rankname = "Sergeant";};
case 5: {_rankname = "Lieutenant";};
case 6: {_rankname = "First Lieutenant";};
case 7: {_rankname = "Captain";};
case 8: {_rankname = "Colonel";};
case 9: {_rankname = "Deputy Chief";};
case 10: {_rankname = "Chief";};
};

_header = format["%1 Shop",_rankname];
_all = [];

/////////////////////////////////////////////////////////////////////////WEAPONS----------------------------------------------------------
//--------------------Weapons COP LVL 1----------------------------------
if(_rank > 0) then {
_all pushback
	["arifle_MXC_Black_F","MXC", 30000];
_all pushback
	["arifle_sdar_F","Taser Rifle",20000];
_all pushback
	["SMG_02_F","Sting",30000];
};
//--------------------Weapons COP LVL 2+----------------------------------
if(_rank > 1) then {
_all pushback
	["arifle_MX_Black_F","MX",35000];
_all pushback
	["arifle_Mk20C_plain_F","MK20",35000];
_all pushback
	["arifle_Mk20_GL_F","MK20 GL",50000];
};
//--------------------Weapons COP LVL 3+----------------------------------
if(_rank > 2) then {
_all pushback
	["arifle_MXM_Black_F","MXM",75000];
_all pushback
	["arifle_MX_GL_Black_F","MX GL",30000];
};
//--------------------Weapons COP LVL 4+----------------------------------
if(_rank > 3) then {
_all pushback
	["srifle_DMR_03_F","MK 1 EMR", 150000];

_all pushback
	["srifle_EBR_F","MK 18", 150000];
};
//--------------------Weapons COP LVL 5+----------------------------------
if(_rank > 4) then {
_all pushback
	["srifle_DMR_04_F","ASP-1 Kir", 200000];
};
//--------------------Weapons COP LVL 6+----------------------------------
if(_rank > 5) then {
_all pushback
	["srifle_DMR_02_F","MAR-10", 200000];
};
//--------------------Weapons COP LVL 7+----------------------------------
if(_rank > 6) then {
_all pushback
	["srifle_DMR_05_blk_F","Cyrus", 200000];
_all pushback
	["srifle_LRR_F","M320 LRR.408", 200000];
};
//--------------------Weapons COP LVL 8+----------------------------------
if(_rank > 7) then {
//_all pushback
//	["srifle_LRR_F","M320 LRR.408", 200000];
};

/////////////////////////////////////////////////////////////////////////HANDGUNS----------------------------------------------------------
if(_rank > 0) then {
_all pushback
	["hgun_Pistol_Signal_F","Signal Pistole",1750];
_all pushback
	["hgun_P07_snds_F","Tazer",2000];
};
//--------------------Handguns COP LVL 2+----------------------------------
if(_rank > 1) then {
_all pushback
	["hgun_ACPC2_F","ACP-C2",17500];
};


/////////////////////////////////////////////////////////////////////////WEAPON ATTACHMENTS----------------------------------------------------------
//--------------------Scope COP LVL 1+----------------------------------
if(_rank > 0) then {
_all pushback
	["optic_Holosight","Holosight",1200];
};
//--------------------Scope COP LVL 2+----------------------------------
if(_rank > 1) then {
_all pushback
	["optic_Aco","ACO",1000];
_all pushback
	["optic_Arco","ARCO",2500];
_all pushback
	["optic_MRCO","MRCO",10000];
};
//--------------------Scope COP LVL 3+----------------------------------
if(_rank > 2) then {
_all pushback
	["optic_Hamr","RCO",10000];
};
//--------------------Scope COP LVL 4+----------------------------------
if(_rank > 3) then {
_all pushback
	["optic_SOS","SOS", 25000];
_all pushback
	["optic_NVS","NVS", 25000];
};
//--------------------Scope COP LVL 5+----------------------------------
if(_rank > 4) then {
_all pushback
	["optic_AMS","AMS", 30000];
_all pushback
	["optic_DMS","DMS", 30000];
_all pushback
	["optic_KHS_blk",nil, 30000];

};
//--------------------Scope COP LVL 6+----------------------------------
if(_rank > 5) then {

_all pushback
	["optic_LRPS","LRPS", 30000];
};

//--------------------Suppressor COP LVL 1----------------------------------
if(_rank > 0) then {
_all pushback
	["muzzle_snds_L","P07 Suppressor",650];
};
//--------------------Suppressor COP LVL 2+----------------------------------
if(_rank > 1) then {
	_all pushback
		["muzzle_snds_H","Suppressor 6.5mm",2750];
	_all pushback
		["muzzle_snds_M","Suppressor 5.56mm",2000];
};
//--------------------Suppressor COP LVL 3+----------------------------------
if(_rank > 3) then {
	_all pushback
	["muzzle_snds_B","Suppressor 7.62mm",10000];

};
//--------------------Suppressor COP LVL 6+----------------------------------
if(_rank > 5) then {

_all pushback
	["muzzle_snds_338_black","Suppressor .338", 10000];
};
//--------------------Suppressor COP LVL 7+----------------------------------
if(_rank > 6) then {

_all pushback
	["muzzle_snds_93mmg","Suppressor 9.3", 10000];

};
//--------------------Suppressor COP LVL 8+----------------------------------
if(_rank > 7) then {

};
//--------------------Suppressor COP LVL 9+----------------------------------
if(_rank > 8) then {

};
//--------------------Sonnstiges COP LVL 2+----------------------------------
if(_rank > 1) then {
_all pushback
	["bipod_01_F_blk","Zweibein",5000];
_all pushback
	["acc_flashlight","Lampe",750];
};
//--------------------Sonnstiges COP LVL 3+----------------------------------
if(_rank > 2) then {
_all pushback
	["acc_pointer_IR","Laser Pointer",1500];
};




/////////////////////////////////////////////////////////////////////////WEAPON MAGAZINES----------------------------------------------------------
if(_rank > 0) then {
_all pushback
	["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125];
_all pushback
	["30Rnd_65x39_caseless_mag",nil, 150];
_all pushback
	["16Rnd_9x21_Mag","16Rnd 9mm",50];
_all pushback
	["30Rnd_9x21_Mag","30Rnd 9mm",250];
_all pushback
	["6Rnd_GreenSignal_F","Signalflare grün",70];
_all pushback
	["6Rnd_RedSignal_F","Signalflare rot",70];
};
//--------------------WEAPON MAGAZINES COP LVL 2+----------------------------------
if(_rank > 1) then {
_all pushback
	["30Rnd_556x45_Stanag","30Rnd 5.56",200];
_all pushback
	["3Rnd_SmokeGreen_Grenade_shell",nil,1500];
_all pushback
	["3Rnd_Smoke_Grenade_shell",nil,1500];
_all pushback
	["1Rnd_SmokeRed_Grenade_shell",nil,1500];
_all pushback
	["1Rnd_SmokeGreen_Grenade_shell",nil,1500];
_all pushback
	["1Rnd_SmokeYellow_Grenade_shell",nil,1500];
_all pushback
	["3Rnd_UGL_FlareWhite_F",nil,1500];
_all pushback
	["9Rnd_45ACP_Mag",nil,200];
};
//--------------------WEAPON MAGAZINES COP LVL 3+----------------------------------
if(_rank > 2) then {
_all pushback
	["20Rnd_762x51_Mag","20Rnd 7.62mm", 300];
};
//--------------------WEAPON MAGAZINES COP LVL 4+----------------------------------
if(_rank > 3) then {

};
//--------------------WEAPON MAGAZINES COP LVL 5+----------------------------------
if(_rank > 4) then {
_all pushback
	["10Rnd_127x54_Mag","10Rnd 12.7mm", 5001];
};
//--------------------WEAPON MAGAZINES COP LVL 6+----------------------------------
if(_rank > 5) then {
_all pushback
	["10Rnd_338_Mag","10Rnd .338", 5000];
};
//--------------------WEAPON MAGAZINES COP LVL 7+----------------------------------
if(_rank > 6) then {
_all pushback
	["10Rnd_93x64_DMR_05_Mag","10Rnd 9.3mm", 5000];
_all pushback
	["7Rnd_408_Mag","7Rnd .408", 5000];
};
//--------------------WEAPON MAGAZINES COP LVL 8+----------------------------------
if(_rank > 7) then {
_all pushback
	["7Rnd_408_Mag","7Rnd .408", 5000];
};

/////////////////////////////////////////////////////////////////////////SONSTIGES----------------------------------------------------------
//--------------------Fernglass----------------------------------
if(_rank > 0) then {
_all pushback
	["Binocular",nil,150];
};
if(_rank > 3) then {
_all pushback
	["Rangefinder",nil,15000];
};

//--------------------SONSTIGES COP LVL 1+----------------------------------
if(_rank > 0) then {
_all pushback
	["ItemMap",nil,100];
_all pushback
	["ItemWatch",nil,100];
_all pushback
	["ItemCompass",nil,100];
_all pushback
	["ItemGPS","GPS",100];
_all pushback
	["ToolKit",nil,250];
_all pushback
	["FirstAidKit",nil,150];
_all pushback
	["Medikit",nil,1000];
_all pushback
	["NVGoggles",nil,2000];
_all pushback
	["NVGoggles_OPFOR",nil,2000];
};
//--------------------SONSTIGES COP LVL 2+----------------------------------
if(_rank > 1) then {
//_all pushback
//	["MineDetector",nil,1000]; Minen können so nicht gefunden weden keine Funktion!
_all pushback
	["SmokeShellgreen",nil,1000];
_all pushback
	["SmokeShell",nil,1000];
};
//--------------------SONSTIGES COP LVL 3+----------------------------------
if(_rank > 2) then {

};
//--------------------SONSTIGES COP LVL 4+----------------------------------
if(_rank > 3) then {

};
//--------------------SONSTIGES COP LVL 7+----------------------------------
if(_rank > 6) then {
_all pushback
	["B_UAV_01_backpack_F","UAV Rucksack",750000];
_all pushback
	["B_UavTerminal","UAV Terminal",150000];
};




_ret = [_header,_all];


_ret;




