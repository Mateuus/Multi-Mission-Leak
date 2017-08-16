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
        if(uniform player isEqualTo "U_C_Scientist") then {
            player setObjectTextureGlobal [0, "textures\civ\prisoner.jpg"];
        };

        //packs
        if(backpack player isEqualTo "B_Carryall_ocamo") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\cat.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_oucamo") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\votetrump.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_mcamo") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\twitch.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_oli") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\adc.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_khk") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\kindmessage.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_cbr") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\sponge.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_ocamo_AAA") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\nike.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_ocamo_Eng") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\addidas.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_oucamo_AAT") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\grabshirt.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_mcamo_AAA") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\breakingbad.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_mcamo_AAT") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\rpg.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_cbr_AAT") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\colors\black.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_ocamo_AAR") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\colors\brown.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_oucamo_Eng") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\colors\blue.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_oucamo_Exp") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\colors\pink.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_oucamo_AAR") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\colors\purple.paa"];
        };
        if(backpack player isEqualTo "B_Carryall_ocamo_Exp") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\colors\orange.paa"];
        };
        /*if(backpack player isEqualTo "B_Carryall_oucamo_AAA") then {
            (backpackContainer player) setObjectTextureGlobal [0, "textures\civ\packs\colors\yellow.paa"];
        };*/

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
            _skinName = "textures\cop\cop_uniform_1.jpg";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 1) then {
                if (FETCH_CONST(life_coplevel) >= 1) then {
                    _skinName = ["textures\cop\cop_uniform_",(FETCH_CONST(life_coplevel)),".jpg"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName];
        };
        if ((backpack player) == "B_Carryall_cbr") then {
            (unitbackpack player) setObjectTextureGlobal [0,""];
        };
    };

    case independent: {
        if (uniform player isEqualTo "U_Rangemaster") then {
            player setObjectTextureGlobal [0, "textures\medic\medic_uniform.jpg"];
        };
        if(backpack player isEqualTo "B_Bergen_sgg") then {
            (backpackContainer player) setObjectTextureGlobal [0,"textures\medic\medic_backpack.jpg"];  
        };
    };
};
