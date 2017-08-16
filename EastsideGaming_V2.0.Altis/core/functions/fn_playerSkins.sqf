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
		if(uniform player isEqualTo "U_C_Poloshirt_blue")then {
			player setObjectTextureGlobal [0, "texture\uni\esg_spawn.paa"];
		};
	};
    case west: {
        if (uniform player isEqualTo "U_Rangemaster") then {
            player setObjectTextureGlobal [0, "texture\uni\cop_1.paa"];
        };
		
		if (uniform player in ["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest"]) then {
            player setObjectTextureGlobal [0, "texture\uni\cop_2.paa"];
        };
		
		if (uniform player in ["U_I_CombatUniform","U_I_CombatUniform_shortsleeve"]) then {
            player setObjectTextureGlobal [0, "texture\uni\cop_3.paa"];
        };
		
		if((backpack player) != "")then {
			(unitBackpack player) setObjectTextureGlobal [0, ""];
		};
    };
    case independent: {
        if (uniform player in ["U_I_CombatUniform","U_I_CombatUniform_shortsleeve"]) then {
			if((FETCH_CONST(life_medicLevel)) isEqualTo 1) then {
				player setObjectTextureGlobal [0, "texture\uni\fw_1.paa"];
			} else {
				if((FETCH_CONST(life_medicLevel)) > 4) then {
					player setObjectTextureGlobal [0, "texture\uni\fw_3.paa"];
				} else {
					player setObjectTextureGlobal [0, "texture\uni\fw_2.paa"];
				};
			};
        };
		
		if((backpack player) != "")then {
			(unitBackpack player) setObjectTextureGlobal [0, ""];
		};
    };
};