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
            _skinName = "textures\cop\Kleidung\polizei1.paa";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 1) then {
                if (FETCH_CONST(life_coplevel) >= 1) then {
                    _skinName = ["textures\cop\Kleidung\polizei1_",(FETCH_CONST(life_coplevel)),".paa"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName];
        };
		
		if (uniform player isEqualTo "U_BG_Guerilla2_1") then {
            _skinName2 = "textures\cop\Kleidung\polizei2.paa";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 1) then {
                if (FETCH_CONST(life_coplevel) >= 1) then {
                    _skinName2 = ["textures\cop\Kleidung\polizei2_",(FETCH_CONST(life_coplevel)),".paa"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName2];
        };
		
		if (uniform player isEqualTo "U_B_CombatUniform_mcam") then {
            _skinName3 = "textures\cop\Kleidung\swat1.paa";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 1) then {
                if (FETCH_CONST(life_coplevel) >= 1) then {
                    _skinName3 = ["textures\cop\Kleidung\swat1_",(FETCH_CONST(life_coplevel)),".paa"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName3];
        };
    };
	
//	_backpack = "";
//   for "_i" from 0 to 1 step 0 do {
//    waitUntil {backpack player != _backpack};
//    _backpack = backpack player;
//    if(playerSide in [west,independent]) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
//    };

    case independent: {
        if (uniform player isEqualTo "U_Rangemaster") then {
            player setObjectTextureGlobal [0, "textures\med\Kleidung\fara.paa"];
        };
	
	if (uniform player isEqualTo "U_BG_Guerilla2_1") then {
            player setObjectTextureGlobal [0, "textures\med\Kleidung\paramedic.paa"];
        };
	if (backpack player isEqualTo "B_TacticalPack_rgr") then {
            (unitBackpack player) setObjectTextureGlobal [0, "textures\med\Kleidung\fararucksack.paa"];
        };		
		
    };
	
	
};
