#include "..\..\script_macros.hpp"
/*
    File: fn_playerSkins.sqf
    Author: Daniel Stuart

    Description:
    Sets skins for players by their side and uniform.
*/
private ["_skinName"];

switch (playerSide) do {
    case civilian: {
        if (LIFE_SETTINGS(getNumber,"civ_skins") isEqualTo 1) then {
            if (uniform player isEqualTo "U_C_Poloshirt_blue") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_1.jpg"];
            };
            if (uniform player isEqualTo "U_C_Poloshirt_burgundy") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_2.jpg"];
            };
            if (uniform player isEqualTo "U_C_Poloshirt_stripped") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_3.jpg"];
            };
            if (uniform player isEqualTo "U_C_Poloshirt_tricolour") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_4.jpg"];
            };
            if (uniform player isEqualTo "U_C_Poloshirt_salmon") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_5.jpg"];
            };
            if (uniform player isEqualTo "U_C_Poloshirt_redwhite") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_6.jpg"];
            };
            if (uniform player isEqualTo "U_C_Commoner1_1") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_7.jpg"];
            };
        };
    };

    case west: {
        if (uniform player isEqualTo "U_Rangemaster") then {
            _skinName = "textures\cop_uniform.jpg";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 1) then {
                if (FETCH_CONST(life_coplevel) >= 1) then {
                    _skinName = ["textures\cop_uniform_",(FETCH_CONST(life_coplevel)),".jpg"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName];
        };
		if (uniform player isEqualTo "U_IG_Guerilla2_1") then {
            _skinName = "textures\polizei.jpg";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 1) then {
                if (FETCH_CONST(life_coplevel) >= 2) then {
                    _skinName = ["textures\polizei_",(FETCH_CONST(life_coplevel)),".jpg"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName];
        };
		if (uniform player isEqualTo "U_IG_Guerilla2_3") then {
            _skinName = "textures\Kommissar.jpg";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 1) then {
                if (FETCH_CONST(life_coplevel) >= 5) then {
                    _skinName = ["textures\Kommissar_",(FETCH_CONST(life_coplevel)),".jpg"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName];
        };
		if (uniform player isEqualTo "U_B_CombatUniform_mcam_worn") then {
            _skinName = "textures\sek.jpg";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 1) then {
                if (FETCH_CONST(life_coplevel) >= 4) then {
                    _skinName = ["textures\sek_",(FETCH_CONST(life_coplevel)),".jpg"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName];
        };
		if (uniform player isEqualTo "U_B_CombatUniform_mcam_tshirt") then {
            _skinName = "textures\sek.jpg";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 1) then {
                if (FETCH_CONST(life_coplevel) >= 4) then {
                    _skinName = ["textures\sek_",(FETCH_CONST(life_coplevel)),".jpg"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName];
        };
		if ((backpack player) isEqualTo "B_FieldPack_cbr") then {
			(unitBackpack player) setObjectTextureGlobal [0, ""];
		};
		if ((backpack player) isEqualTo "B_AssaultPack_cbr") then {
			(unitBackpack player) setObjectTextureGlobal [0, ""];
		};
		if ((backpack player) isEqualTo "B_Kitbag_cbr") then {
			(unitBackpack player) setObjectTextureGlobal [0, ""];
		};
		if ((backpack player) isEqualTo "B_Bergen_sgg") then {
			(unitBackpack player) setObjectTextureGlobal [0, ""];
		};
		if ((backpack player) isEqualTo "B_Carryall_cbr") then {
			(unitBackpack player) setObjectTextureGlobal [0, ""];
		};
    };

    case independent: {
        if (uniform player isEqualTo "U_O_OfficerUniform_ocamo") then {
            player setObjectTextureGlobal [0, "textures\Feuer.jpg"];
        };
		if ((backpack player) isEqualTo "B_FieldPack_oli") then {
			(unitBackpack player) setObjectTextureGlobal [0, ""];
		};
    };
};
