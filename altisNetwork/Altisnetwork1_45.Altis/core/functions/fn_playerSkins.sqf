#include "..\..\script_macros.hpp"
/*
    File: fn_playerSkins.sqf
    Author: Daniel Stuart

    Description:
    Sets skins for players by their side and uniform.
*/
private["_skinName"];

switch(playerSide) do {
	case civilian: {

		if (uniform player isEqualTo "U_B_CombatUniform_mcam_worn") then {
                player setObjectTextureGlobal [0, "textures\bountyhunter\bountyhunterskin.paa"];
        };
		if (uniform player isEqualTo "U_B_CombatUniform_mcam_vest") then {
				player setObjectTextureGlobal [0, "textures\Civ\U\prisoner.paa"];
		};
		if (uniform player isEqualTo "U_C_Poloshirt_blue") then {
				player setObjectTextureGlobal [0, "textures\Civ\meme1.jpg"];
		};
		if (uniform player isEqualTo "U_C_Poloshirt_burgundy") then {
				player setObjectTextureGlobal [0, "textures\Civ\meme2.jpg"];
		};
	};
   case west: {
	   //Normal Police uniforms
		if(uniform player isEqualTo "U_B_CombatUniform_mcam") then {
			if(FETCH_CONST(life_coplevel) >= 1) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\police_pcsouniform.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 2) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\police_blackuniform.paa"];
				};	
			if(FETCH_CONST(life_coplevel) >= 3) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\police_blackuniform.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 4) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\police_blackuniform.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 5) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\police_blackuniform.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 6) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\police_blackuniform.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 7) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\police_blackuniform.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 8) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\police_blackuniform.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 9) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\police_blackuniform.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 10) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\police_blackuniform.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 11) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\police_blackuniform.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 12) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\police_blackuniform.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 13) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\police_blackuniform.paa"];
				};
			};
			//SCO uniforms from rank 4
		if(uniform player isEqualTo "U_B_CTRG_1") then {
			if(FETCH_CONST(life_coplevel) >= 4) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\sco19.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 5) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\sco19.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 6) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\sco19.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 7) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\sco19.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 8) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\sco19.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 9) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\sco19.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 10) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\sco19.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 11) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\sco19.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 12) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\sco19.paa"];
				};
			if(FETCH_CONST(life_coplevel) >= 13) then 
				{
					player setObjectTextureGlobal [0, "textures\police\U\sco19.paa"];
				};
			};
		 if ((backpack player) == "B_Carryall_mcamo") then {
			    (unitbackpack player) setObjectTextureGlobal [0,""];
         };
		 if ((backpack player) == "B_ViperLightHarness_blk_F") then {
			    (unitbackpack player) setObjectTextureGlobal [0,""];
         };
		 if ((backpack player) == "B_ViperHarness_blk_F") then {
			    (unitbackpack player) setObjectTextureGlobal [0,""];
         };
	};

   case independent: {
	   //--Medic Uniforums
        if (uniform player isEqualTo "U_B_CombatUniform_mcam") then {
			if(FETCH_CONST(life_mediclevel) >= 1) then 
			{
				player setObjectTextureGlobal [0, "textures\nhs\U\Paramedic_Uniform.paa"];
			};
			if(FETCH_CONST(life_mediclevel) >= 2) then 
			{
				player setObjectTextureGlobal [0, "textures\nhs\U\Paramedic_Uniform.paa"];
			};
			if(FETCH_CONST(life_mediclevel) >= 3) then 
			{
				player setObjectTextureGlobal [0, "textures\nhs\U\Paramedic_Uniform.paa"];
			};
			if(FETCH_CONST(life_mediclevel) >= 4) then 
			{
				player setObjectTextureGlobal [0, "textures\nhs\U\Paramedic_Uniform.paa"];
			};
			if(FETCH_CONST(life_mediclevel) >= 5) then 
			{
				player setObjectTextureGlobal [0, "textures\nhs\U\Paramedic_Uniform.paa"];
			};
		};
	//-- Medic Backpacks
	if ((backpack player) == "B_Carryall_mcamo") then {
		(unitbackpack player) setObjectTextureGlobal [0,""];
	};
	if ((backpack player) == "B_ViperLightHarness_blk_F") then {
		(unitbackpack player) setObjectTextureGlobal [0,""];
    };
	if ((backpack player) == "B_ViperHarness_blk_F") then {
		(unitbackpack player) setObjectTextureGlobal [0,""];
    };
};
};