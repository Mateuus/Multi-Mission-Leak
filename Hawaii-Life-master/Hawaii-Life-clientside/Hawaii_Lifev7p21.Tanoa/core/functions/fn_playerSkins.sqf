#include "..\..\script_macros.hpp"
/*
    File: fn_playerSkins.sqf
    Author: Daniel Stuart

    Description:
    Sets skins for players by their side and uniform.
*/
switch(playerSide) do {
	case civilian: {
		if(uniform player isEqualTo "U_C_Poloshirt_redwhite") then {
			player setObjectTextureGlobal [0, "textures\human\civ\hawaii_shirt.paa"];
		};
		if(uniform player isEqualTo "U_C_Poloshirt_stripped") then {
			player setObjectTextureGlobal [0, "textures\human\civ\hawaii_shirt_grn.paa"];
		};
		if(uniform player isEqualTo "U_C_Poloshirt_burgundy") then {
			player setObjectTextureGlobal [0, "textures\human\civ\polo_red.paa"];
		};
		if(uniform player isEqualTo "U_C_Poloshirt_blue") then {
			player setObjectTextureGlobal [0, "textures\human\civ\polo_legendary.paa"];
		};
		if(uniform player isEqualTo "U_C_Poloshirt_salmon") then {
			player setObjectTextureGlobal [0, "textures\human\civ\polo_sport.paa"];
		};
		if(uniform player isEqualTo "U_Rangemaster") then {
			player setObjectTextureGlobal [0, "textures\human\civ\anzug.paa"];
		};
		if(uniform player isEqualTo "U_C_Driver_1_blue") then {
			player setObjectTextureGlobal [0, "textures\neon\blue.paa"];
			player setObjectMaterialGlobal [0, "textures\vr_white.rvmat"];
		};
		if(uniform player isEqualTo "U_C_Driver_1_green") then {
			player setObjectTextureGlobal [0, "textures\neon\green.paa"];
			player setObjectMaterialGlobal [0, "textures\vr_white.rvmat"];
		};
		if(uniform player isEqualTo "U_C_Driver_1_orange") then {
			player setObjectTextureGlobal [0, "textures\neon\orange.paa"];
			player setObjectMaterialGlobal [0, "textures\vr_white.rvmat"];
		};
		if(uniform player isEqualTo "U_C_Driver_1_yellow") then {
			player setObjectTextureGlobal [0, "textures\neon\yellow.paa"];
			player setObjectMaterialGlobal [0, "textures\vr_white.rvmat"];
		};

		if((FETCH_CONST(life_donatorlvl) >= 2)) then {
			if(uniform player isEqualTo "U_O_CombatUniform_ocamo") then {
				player setObjectTextureGlobal [0, "textures\vip\gold\don_digi_sand.paa"];
			};
		};
	};
	case west: {
		if(license_cop_fbi) then {
			if (uniform player isEqualTo "U_B_CombatUniform_mcam") then {
				player setObjectTextureGlobal [0, "textures\human\cop\fbi.paa"];
			};
		};
		if(uniform player isEqualTo "U_C_Poloshirt_redwhite") then {
			player setObjectTextureGlobal [0, "textures\human\civ\hawaii_shirt.paa"];
		};
		if(uniform player isEqualTo "U_C_Poloshirt_stripped") then {
			player setObjectTextureGlobal [0, "textures\human\civ\hawaii_shirt_grn.paa"];
		};
		if(uniform player isEqualTo "U_C_Poloshirt_burgundy") then {
			player setObjectTextureGlobal [0, "textures\human\civ\polo_red.paa"];
		};
		if(uniform player isEqualTo "U_C_Poloshirt_blue") then {
			player setObjectTextureGlobal [0, "textures\human\civ\polo_legendary.paa"];
		};
		if(uniform player isEqualTo "U_C_Poloshirt_salmon") then {
			player setObjectTextureGlobal [0, "textures\human\civ\polo_sport.paa"];
		};
		if(uniform player isEqualTo "U_Rangemaster") then {
			player setObjectTextureGlobal [0, "textures\human\civ\anzug.paa"];
		};
	};
	
	case independent: {
		if(uniform player isEqualTo "U_I_CombatUniform") then {
			player setObjectTextureGlobal [0, "textures\human\THW\THW_Uniform.paa"];
		};
		if(uniform player isEqualTo "U_I_CombatUniform_shortsleeve") then {
			player setObjectTextureGlobal [0, "textures\human\THW\THW_Uniform.paa"];
		};
	};
};


//player setObjectMaterialGlobal [0, "textures\vr_white.rvmat"];