
#include <macro.h>
/*
		File: UniformsColor.sqf
		Author: Maximum
		
*/

#define __GETC__(var) (call var)

if(side player == independent) then {
	if ((uniform player) == "U_C_Scientist") then {
		player setObjectTextureGlobal [0, "textures\medic_uniform.paa"];
	};
	
	if (backpack player == "B_Carryall_cbr") then {
		backpackContainer player setObjectTextureGlobal [0, "textures\med_backpack.paa"];
	};
};
/*
if(side player == WEST) then {
	// Basic cop uniform.
	if (uniform player == "U_B_CombatUniform_mcam" && (__GETC__(life_coplevel) == 1)) then {
		player setObjectTextureGlobal [0, "textures\police\pcso_uniform.paa"]; 
	};
	// Basic cop uniform.
	if (uniform player == "U_B_CombatUniform_mcam" && (__GETC__(life_coplevel) == 2 OR __GETC__(life_coplevel) == 3)) then {
		player setObjectTextureGlobal [0, "textures\police\police_low.paa"]; 
	};
	// Basic cop uniform.
	if (uniform player == "U_B_CombatUniform_mcam" && (__GETC__(life_coplevel) == 4 OR __GETC__(life_coplevel) == 5 OR __GETC__(life_coplevel) == 6 OR __GETC__(life_coplevel) == 7)) then {
		player setObjectTextureGlobal [0, "textures\police\police_high.paa"]; 
	};
	// Basic cop uniform.
	if (uniform player == "U_B_CombatUniform_mcam" && (__GETC__(life_coplevel) == 8 OR __GETC__(life_coplevel) == 9 OR __GETC__(life_coplevel) == 10 OR __GETC__(life_coplevel) == 11 OR __GETC__(life_coplevel) == 12)) then {
		player setObjectTextureGlobal [0, "textures\police\police_high.paa"]; 
	};
	// SCO cop uniform.
	if (uniform player == "U_B_CombatUniform_mcam" && (__GETC__(life_coplevel) == 13)) then {
		player setObjectTextureGlobal [0, "textures\police\sco19.paa"]; 
	};

	
};
*/
if(side player == civilian) then {
	// Prisoner 
	if(side player == civilian && uniform player == "U_B_CombatUniform_mcam_vest") then {
	player setObjectTextureGlobal [0, "textures\prisoner.jpg"];
	};
	//SPAWN SKIN
	if(side player == civilian && uniform player == "U_C_Poloshirt_blue") then {
	player setObjectTextureGlobal [0, "textures\elmo.jpg"];
	};
	if(side player == civilian && uniform player == "U_C_Poloshirt_burgundy") then {
	player setObjectTextureGlobal [0, "textures\kermit.jpg"];
	};
	if(side player == civilian && uniform player == "U_C_Poloshirt_stripped") then {
	player setObjectTextureGlobal [0, "textures\mario.jpg"];
	};
	if(side player == civilian && uniform player == "U_C_Poloshirt_tricolour") then {
	player setObjectTextureGlobal [0, "textures\meg.jpg"];
	};
	if(side player == civilian && uniform player == "U_C_Commoner1_1") then {
	player setObjectTextureGlobal [0, "textures\zoidberg.jpg"];
	};
	if (side player == civilian && uniform player == "U_C_Commoner1_2" && (__GETC__(life_donator) > 1)) then {
	player setObjectTextureGlobal [0, "textures\handciv.jpg"]; 
	};	
	if (side player == civilian && (backpack player == "B_HuntingBackpack") && (__GETC__(life_donator) > 1)) then {
	backpackContainer player setObjectTextureGlobal [0, "textures\murica_bag.jpg"];
	};	
};
