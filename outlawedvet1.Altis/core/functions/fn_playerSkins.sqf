#include "..\..\script_macros.hpp"
/*
    File: fn_playerSkins.sqf
    Author: Daniel Stuart

    Description:
    Sets skins for players by their side and uniform.
*/
private["_skinName"];

switch (playerSide) do {
    case civilian: {
	
		if (uniform player isEqualTo "U_C_Scientist") then {
		player setObjectTextureGlobal [0,"textures\uniforms\combatlogger.paa"];
		};
		
		/*
		if (uniform player isEqualTo "U_B_CombatUniform_mcam") then {
		_texture = 
		switch (FETCH_CONST(life_donorlevel)) do
				{
					case 1: {"textures\uniforms\bcm.jpg"};
					case 2: {"textures\uniforms\bcm.jpg"};
					case 3: {"textures\uniforms\bcm.jpg"};
					case 4: {"textures\uniforms\bcm.jpg"};
					case 5: {"textures\uniforms\bcm.jpg"};
				};
				
		player setObjectTextureGlobal [0,_texture];
		};
		*/
    };

    case west: {
	
	    if (uniform player isEqualTo "U_B_CombatUniform_mcam") then {
		player setObjectTextureGlobal [0,"textures\uniforms\swat_shirt.paa"];
		};
			
	    if (uniform player isEqualTo "U_O_GhillieSuit") then {
		player setObjectTextureGlobal [0,"textures\uniforms\swat_shirt.paa"];
		};
		
        if (uniform player isEqualTo "U_Rangemaster") then {
		_texture = 
		switch (FETCH_CONST(life_coplevel)) do
				{
					case 0: {"textures\uniforms\police.jpg"};
					case 1: {"textures\uniforms\police.jpg"};
					case 2: {"textures\uniforms\police.jpg"};
					case 3: {"textures\uniforms\police.jpg"};
					case 4: {"textures\uniforms\police.jpg"};
					case 5: {"textures\uniforms\police.jpg"};
					case 6: {"textures\uniforms\police.jpg"};
					case 7: {"textures\uniforms\police.jpg"};
					case 8: {"textures\uniforms\police.jpg"};
					case 9: {"textures\uniforms\police.jpg"};
				};
				
		player setObjectTextureGlobal [0,_texture];
		};
    };

    case independent: {
        if (uniform player isEqualTo "U_B_CombatUniform_mcam_worn") then {
            player setObjectTextureGlobal [0, "textures\uniforms\medic.paa"];
        };
    };
};
