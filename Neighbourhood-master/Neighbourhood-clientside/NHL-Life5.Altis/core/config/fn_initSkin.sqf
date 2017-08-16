#include <macro.h>
/*
	File: fn_initSkin.sqf
	
	Description:
	Skin changer
*/
while {true} do
	{
	if(playerSide == west) then 
	{	
		
		if (uniform player == "U_Rangemaster" && (__GETC__(life_coplevel)< 5)) then {
			player setObjectTextureGlobal[0,"Texturen\Kleidung\cop\uniform_cadet.paa"];
		};
		if (uniform player == "U_Rangemaster" && (__GETC__(life_coplevel)>= 5)) then {
			player setObjectTextureGlobal[0,"Texturen\Kleidung\cop\uniform_sgt.paa"];
		};
		/*if (uniform player == "U_Marshal") then {
			player setObjectTextureGlobal[0,"Texturen\Kleidung\cop\uniform_sgt.paa"];
		};*/
		if (uniform player == "U_B_CombatUniform_mcam") then {
			player setObjectTextureGlobal[0,"Texturen\Kleidung\cop\uniform_department.paa"];
		};


	};
	if(playerSide == independent) then
	{
		if (uniform player == "U_I_CombatUniform") then {
			player setObjectTextureGlobal[0,"Texturen\Kleidung\medic\medic_uniform.paa"];
		};
	};
	if(playerSide == civilian) then
	{
		if (uniform player == "U_C_WorkerCoveralls") then {
			player setObjectTextureGlobal[0,"Texturen\Kleidung\ziv\knacki.paa"];
		};
		
	};
	sleep 45;//safe some cpu
};