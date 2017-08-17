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
    if (uniform player isEqualTo "U_C_WorkerCoveralls") then {
            player setObjectTextureGlobal [0, "images\textures\Uniform\Civ\prisoner_uniform.paa"];
        };
    };

    case west: {
        if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 1) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\1cop_uniform_cadet.paa"];
            };
        };
        if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 2) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\2cop_uniform_PO.paa"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 3) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\3cop_uniform_SPO.paa"];
            };
        };
        if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 4) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\3cop_uniform_SPO.paa"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 5) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\4cop_uniform_sgt.paa"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 6) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\5cop_uniform_staffSGT.paa"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 7) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\6cop_uniform_Lt.paa"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 8) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\7cop_uniform_Cpt.paa"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 9) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\8cop_uniform_Maj.paa"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 10) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\9cop_uniform_Dep_Chief.paa"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 11) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\10cop_uniform_Chief.paa"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 12) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\11cop_uniform_Com.paa"];
            };
        };
        if( backpack player == "B_Carryall_cbr") then {
            (backpackContainer player) setObjectTextureGlobal [0,""];
        };
    };

    case independent: {
        if( backpack player == "B_TacticalPack_blk") then {
            (backpackContainer player) setObjectTextureGlobal [0,""];
        };
        if (uniform player isEqualTo "U_C_WorkerCoveralls") then {
             player setObjectTextureGlobal [0, "images\Textures\Uniform\Med\paramedic.paa"];
        };
    };
};
