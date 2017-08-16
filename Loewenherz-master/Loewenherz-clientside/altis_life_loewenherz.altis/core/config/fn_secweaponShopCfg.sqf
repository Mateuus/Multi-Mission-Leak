#include <macro.h>
/*
	File: fn_secweaponShopCfg.sqf
	Author: Bloodwyn

	Description:
	Master configuration file for the sec Weapon Shop

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
private ["_shop","_rank","__GETC__","_rankname","_header","_all"];

_shop = param [0,"",[""]];
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.
if(playerside != east) exitWith {closeDialog 0; hint "Du bist kein Sec?!";};
_rank = (__GETC__(lhm_seclevel));
_rankname = "";

switch (_rank) do {
case 1: {_rankname = "Türsteher";};
case 2: {_rankname = "SEC";};
case 3: {_rankname = "SEC-Operator";};
case 4: {_rankname = "SEC-Boss";};
case 5: {_rankname = "SEC-CEO";};
};

_header = format["%1 Shop",_rankname];
_all = [];


			_all pushback["SMG_02_F",nil,1000];
			_all pushback["30Rnd_9x21_Mag",nil,250];
			_all pushback["hgun_Pistol_heavy_02_F",nil,500];
			_all pushback["6Rnd_45ACP_Cylinder",nil,40];
			_all pushback["optic_Holosight",nil,1500];
			_all pushback["Binocular",nil,150];
			_all pushback["SmokeShellBlue",nil,1000];
			_all pushback["ItemMap",nil,100];
			_all pushback["ItemWatch",nil,100];
			_all pushback["ItemCompass",nil,100];
			_all pushback["ItemGPS",nil,100];
			_all pushback["ToolKit",nil,250];
			_all pushback["FirstAidKit",nil,150];
			_all pushback["NVGoggles",nil,2000];

		if(_rank > 1) then {
			_all pushback["LMG_Zafir_F",nil,1000];
			_all pushback["150Rnd_762x54_Box_Tracer",nil,1500];
			_all pushback["Optic_Aco",nil,3000];
			_all pushback["bipod_02_F_blk",nil,4500];
			_all pushback["Rangefinder",nil,15000];
		};
		if(_rank > 2) then {
			_all pushback["LMG_Mk200_F",nil,150000];
			_all pushback["200Rnd_65x39_cased_Box_Tracer",nil,6000];
			_all pushback["optic_MRCO",nil,35000];
			_all pushback["muzzle_snds_H",nil,30000];
		};
		if(_rank > 3) then {
			_all pushback["MMG_01_hex_F",nil,650000];
			_all pushback["150Rnd_93x64_Mag",nil,9000];
			_all pushback["muzzle_snds_93mmg_tan",nil,20000];
		};
		if(_rank > 4) then {
			_all pushback["DemoCharge_Remote_Mag",nil,150000];
		};
		if((player getVariable ["LHM_Donatorlevel",0]) > 0) then {
			_all pushback ["O_UavTerminal",nil,150000];
			_all pushback ["O_UAV_01_backpack_F",nil,450000];
			_all pushback["O_Static_Designator_02_weapon_F",nil,200000];
		};

		_ret = [_header,_all];
		_ret;
