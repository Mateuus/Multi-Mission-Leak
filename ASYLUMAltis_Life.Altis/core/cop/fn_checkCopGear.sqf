/*
	File: fn_checkCopGear.sqf
	Author: Skalicon
	
	Description:
	Check and removed non whitelisted gear
*/

private["_gear","_whitelist","_recruit","_officer","_sergeant","_lieutenant","_captain","_depchief","_chief","_gear_x","_areEqual"];
if (life_coprole in ["all","detective"]) exitWith {}; // Doesn't apply to detectives
_gear = cop_gear;
if(isNil "_gear") exitWith {[] call life_fnc_copDefault;}; //Slot data doesn't exist
if(count _gear == 0) exitWith {[] call life_fnc_copDefault;}; //Slot data doesn't exist

_primary = _gear select 0;
_launcher = "";
_handgun = _gear select 1;
_magazines = _gear select 2;
_uniform = _gear select 3;
_vest = _gear select 4;
_backpack = _gear select 5;
_items = _gear select 6;
_primitems = _gear select 7;
_secitems = _gear select 8;
_handgunitems = _gear select 9;
_uitems = _gear select 10;
_vitems = _gear select 11;
_bitems = _gear select 12;

_cadet = [
	'H_Cap_police',
	'U_Competitor',
	'G_Shades_Black',
	'G_Shades_Blue',
	'G_Sport_Blackred',
	'G_Sport_Checkered',
	'G_Sport_Blackyellow',
	'G_Sport_BlackWhite',
	'G_Aviator',
	'RH_m9',
	'RH_15Rnd_9x19_M9',
	'hlc_smg_MP5N',
	'hlc_smg_mp5k_PDW',
	'hlc_smg_mp5a4',
	'hlc_rifle_vendimus',
	'hlc_rifle_Colt727',
	'hlc_rifle_bcmjack',
	'hlc_30Rnd_9x19_SD_MP5',
	'hlc_30rnd_556x45_EPR',
	'hlc_30rnd_556x45_SPR',
	'TRYK_H_PASGT_BLK',
	'hlc_rifle_CQBR',
	'CUP_optic_HoloBlack',
	'CUP_acc_Flashlight',
	'RH_20Rnd_57x28_FN',
	'RH_fn57',
	'CUP_sgun_M1014',
	'CUP_8Rnd_B_Beneli_74Slug',
	'CUP_8Rnd_B_Beneli_74Pellets',
	'TRYK_H_DELTAHELM_NV',
	'hlc_smg_mp5k',
	'G_Squares',
	'G_Combat',
	'G_Tactical_Black',
	'G_Tactical_Clear',
	'G_Goggles_VR',
	'ItemMap',
	'ItemCompass',
	'ItemWatch',
	'ItemRadio',
	'Binocular',
	'ItemGPS',
	'ToolKit',
	'FirstAidKit',
	'Medikit',
	'NVGoggles_OPFOR',
	'hgun_P07_snds_F',
	'16Rnd_9x21_Mag',
	'SmokeShell',
	'H_Beret_blk',
	'H_Beret_02',
	'H_Beret_Colonel',
	'V_BandollierB_cbr',
	'SMG_02_F',
	'SMG_01_F',
	'arifle_Mk20_F',
	'30Rnd_556x45_Stanag',
	'30Rnd_556x45_Stanag_Tracer_Green',
	'30Rnd_9x21_Mag',
	'B_UavTerminal',
	'B_UAV_01_backpack_F',
	'V_TacVest_blk_POLICE'
];
_constable = [
	'arifle_MXC_Black_F',
	'arifle_MX_Black_F',
	'30Rnd_65x39_caseless_mag',
	'30Rnd_65x39_caseless_mag_Tracer',
	'optic_Aco_smg',
	'optic_MRCO', 
	'optic_Hamr',
	'optic_Arco',
	'acc_pointer_IR',
	'MiniGrenade',
	'V_TacVest_blk',
	'U_Rangemaster',
	'optic_Holosight',
	'optic_Holosight_smg',
	'acc_flashlight',
	'acc_pointer_IR',
	'arifle_sdar_F'
];
_sergeant = [
	'arifle_MXM_Black_F'
];
_lieutenant = [
	'hgun_Pistol_heavy_01_F',
	'11Rnd_45ACP_Mag',
	'optic_MRD',
	'srifle_DMR_03_F',
	'20Rnd_762x51_Mag',
	'U_B_CombatUniform_mcam_worn'
];
_captain = [];

if (life_coplevel == 1) then {_whitelist = _cadet};
if (life_coplevel == 2) then {_whitelist = _cadet + _constable};
if (life_coplevel == 3) then {_whitelist = _cadet + _constable + _sergeant};
if (life_coplevel == 4) then {_whitelist = _cadet + _constable + _sergeant + _lieutenant};
if (life_coplevel == 5) then {_whitelist = _cadet + _constable + _sergeant + _lieutenant + _captain};
if (life_adminlevel > 0) exitWith {};

for "_x" from 0 to (count _gear) - 1 step 1 do {
	if (typeName(_gear select _x) == "ARRAY") then {
		_gear_x = _gear select _x;
		for "_y" from 0 to (count _gear_x) - 1 step 1 do {
			if (!(_gear_x select _y in _whitelist)) then {_gear_x set [_y,''];};
		};
		_gear set [_x,_gear_x];
	} else {
		if (!(_gear select _x in _whitelist)) then {_gear set [_x,''];};
	};
};
_areEqual = [cop_gear,_gear] call BIS_fnc_areEqual;
if (!_areEqual) then {
	cop_gear = _gear;
	[] spawn life_fnc_loadGear;
};
