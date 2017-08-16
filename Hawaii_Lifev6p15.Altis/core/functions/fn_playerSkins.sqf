#include "..\..\script_macros.hpp"
/*
    File: fn_playerSkins.sqf
    Author: Daniel Stuart

    Description:
    Sets skins for players by their side and uniform.
*/
switch(playerSide) do {
	case civilian: {
		if(uniform player == "U_C_Poloshirt_stripped") then {
			player setObjectTextureGlobal [0, "textures\human\civ\hawaii_shirt.paa"];
		};
		if(uniform player == "U_C_Poloshirt_redwhite") then {
			player setObjectTextureGlobal [0, "textures\human\civ\hawaii_shirt_grn.paa"];
		};
		if(uniform player == "U_C_Poloshirt_burgundy") then {
			player setObjectTextureGlobal [0, "textures\human\civ\polo_red.paa"];
		};

		if((FETCH_CONST(life_donatorlvl) >= 2)) then {
			if(uniform player == "U_O_CombatUniform_ocamo") then {
				player setObjectTextureGlobal [0, "textures\vip\gold\don_digi_sand.paa"];
			};
		};
	};
	case west: {
		if(uniform player == "U_Rangemaster") then {
			player setObjectTextureGlobal [0, "textures\human\cop\recoff.paa"];
		};
		
		if(uniform player == "U_B_SpecopsUniform_sgg") then {
			switch (FETCH_CONST(life_coplevel)) do {
				case 3: {player setObjectTextureGlobal [0, "textures\human\cop\detsgt.paa"];};
				case 4: {player setObjectTextureGlobal [0, "textures\human\cop\detsgt.paa"];};
				case 5: {player setObjectTextureGlobal [0, "textures\human\cop\ltcpt.paa"];};
				case 6: {player setObjectTextureGlobal [0, "textures\human\cop\ltcpt.paa"];};
				case 7: {player setObjectTextureGlobal [0, "textures\human\cop\ltcpt.paa"];};
				case 8: {player setObjectTextureGlobal [0, "textures\human\cop\ltcpt.paa"];};
				default {};
			};
		};
		if (uniform player == "U_B_CombatUniform_mcam") then {
			if(license_cop_dea) then {
				player setObjectTextureGlobal [0, "textures\human\cop\dea.paa"];
			};
		};
		if (uniform player == "U_OG_Guerilla1_1") then {
			if(license_cop_civ) then {
				player setObjectTextureGlobal [0, "\a3\characters_f\Civil\Data\c_cloth1_kabeiroi_co.paa"];
			};
		};
	};
	
	case independent: {
		if(uniform player == "U_I_CombatUniform") then {
			player setObjectTextureGlobal [0, "textures\human\THW\THW_Uniform.paa"];
		};
		if(uniform player == "U_I_CombatUniform_shortsleeve") then {
			player setObjectTextureGlobal [0, "textures\human\THW\THW_Uniform.paa"];
		};
	};
};
