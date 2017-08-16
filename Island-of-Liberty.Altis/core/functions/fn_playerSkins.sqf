#include "..\..\script_macros.hpp"
/*
    File: fn_playerSkins.sqf
    Author: Daniel Stuart

    Description:
    Sets skins for players by their side and uniform.
*/
switch(playerSide) do {
	case civilian: {
		if(EQUAL(LIFE_SETTINGS(getNumber,"civ_skins"),1)) then {
			if(uniform player == "U_C_Poloshirt_blue") then {
				player setObjectTextureGlobal [0, "textures\civi\kleidung\Zivi.paa"];
			};
			if(uniform player == "U_C_Poloshirt_burgundy") then {
				player setObjectTextureGlobal [0, "textures\civi\kleidung\Zivi.paa"];
			};
			if(uniform player == "U_C_Poloshirt_stripped") then {
				player setObjectTextureGlobal [0, "textures\civi\kleidung\Zivi.paa"];
			};
			if(uniform player == "U_C_Poloshirt_tricolour") then {
				player setObjectTextureGlobal [0, "textures\civi\kleidung\Zivi.paa"];
			};
			if(uniform player == "U_C_Poloshirt_salmon") then {
				player setObjectTextureGlobal [0, "textures\civi\kleidung\Zivi.paa"];
			};
			if(uniform player == "U_C_Poloshirt_redwhite") then {
				player setObjectTextureGlobal [0, "textures\civi\kleidung\Zivi.paa"];
			};
			if(uniform player == "U_C_Commoner1_1") then {
				player setObjectTextureGlobal [0, "textures\civi\kleidung\Zivi.paa"];
			};
			if(uniform player == "U_C_Scientist") then {
				player setObjectTextureGlobal [0, "textures\civi\kleidung\abcschutzanzug.paa"];
			};
			if(uniform player == "U_C_WorkerCoveralls") then {
				player setObjectTextureGlobal [0, "textures\civi\kleidung\prison.jpg"];
			};
		};
	};
	case west: {
	if(EQUAL(LIFE_SETTINGS(getNumber,"cop_skins"),1)) then {
		if(uniform player == "U_Rangemaster") then {
			player setObjectTextureGlobal [0, "textures\cop\kleidung\anwaerter_polizei.paa"];
		};
		if(uniform player == "U_B_SpecopsUniform_sgg") then {
			player setObjectTextureGlobal [0, "textures\cop\kleidung\uniform_einsatzleitung.paa"];
		};
		if(uniform player == "U_B_CombatUniform_mcam") then {
			player setObjectTextureGlobal [0, "textures\cop\kleidung\uniform_patrouille.paa"];
		};
		if(uniform player == "U_B_CombatUniform_mcam_vest") then {
			player setObjectTextureGlobal [0, "textures\cop\kleidung\uniform_streife.paa"];
		};
		if(uniform player == "U_B_CTRG_3") then {
			player setObjectTextureGlobal [0, "textures\cop\kleidung\uniform_zoll.paa"];
		};
		if(uniform player == "U_I_CombatUniform_shortsleeve") then {
			player setObjectTextureGlobal [0, "textures\cop\kleidung\sek_uniform.paa"];
		};
		if(uniform player == "U_MillerBody") then {
			player setObjectTextureGlobal [0, "textures\cop\kleidung\uniform_ausbilder.paa"];
		};
		if(uniform player == "U_B_CombatUniform_mcam_worn") then {
			player setObjectTextureGlobal [0, "textures\cop\kleidung\uniform_leitung.paa"];
		};
	};
};
	case independent: {
	if(EQUAL(LIFE_SETTINGS(getNumber,"mtd_skins"),1)) then {
		if(uniform player == "U_I_HeliPilotCoveralls") then {
			player setObjectTextureGlobal [0, "textures\mtd\kleidung\mtd_uniformb.paa"];
		};
	};
	};
};
