/*
	File: fn_clothesColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = param [0,"",[""]];
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	
	case "U_BG_Guerilla2_1": // COP Uniform
	{
		_ret =
		[
			["textures\kleidung\cop\Ordnungsamt.paa"],
			["textures\kleidung\cop\Wachtmeister.paa"],
			["textures\kleidung\cop\Kommissar.paa"],
			["textures\kleidung\cop\Hauptkommissar.paa"],
			["textures\kleidung\cop\Oberkommissar.paa"],
			["textures\kleidung\cop\StellvPolizeipresident.paa"],
			["textures\vehicles\cop\hatchbackpol.paa","cop"],
			["textures\kleidung\cop\Polizeipresident.paa"]
		];
	};
	
	case "U_B_CombatUniform_mcam": // SEK Uniform
	{
		_ret =
		[
			["textures\kleidung\cop\sek.paa"]
		];
	};
	
	case "U_IG_Guerilla2_1": // MEDIC Uniform
	{
		_ret =
		[
			["textures\kleidung\med\uniform.paa"]
		];
	};
	
	case "U_I_Wetsuit": // MEDIC Taucher Uniform
	{
		_ret =
		[
			["textures\kleidung\med\taucher.paa"]
		];
	};
	
	case "B_Kitbag_cbr": // MEDIC Rucksack
	{
		_ret =
		[
			["textures\kleidung\med\backpack.paa"]
			// Weiberkleidung monsterhai fehlt freundchen xD
			// andere sachen fehlen auch noch
		];
	};
	
};

_ret;