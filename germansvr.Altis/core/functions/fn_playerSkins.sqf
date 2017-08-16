#include "..\..\script_macros.hpp"
/*
    File: fn_playerSkins.sqf
    Author: Daniel Stuart

    Description:
    Sets skins for players by their side and uniform.
*/
private ["_skinName"];

switch (playerSide) do {
    case civilian: {};

    case west: {};

    case independent: {
        if (uniform player isEqualTo "U_MillerBody") then {
            player setObjectTextureGlobal [0, "textures\medic_uniform.paa"];
        };
		switch(backpack player) do
		{			
			case "B_Kitbag_sgg": {
				(unitBackpack player) setObjectTextureGlobal [0,"textures\medic_backpack.jpg"];
			};
		};
    };
	case east: {};
};
