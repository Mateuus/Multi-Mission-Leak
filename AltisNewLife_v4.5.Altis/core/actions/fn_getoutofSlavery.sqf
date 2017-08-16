#include <macro.h>
if(life_inv_cigarette < 20) exitWith {hint "Vous devez travailler pour votre liberté, rouler 20 cigarettes !"};
if(life_inv_cigarette >= 20) then 
{
	[false,"cigarette",20] call life_fnc_handleInv;
	slave_task1 setTaskState "Vous avez gagné votre liberté !";
	player addUniform "U_C_Poloshirt_redwhite";
	player removeSimpleTask slave_task1;
	hint "Vous avez gagné votre liberté !";
};
life_enslaved = false;
player SVAR["enslaved",true,true];
uiSleep (10 * 60);
player SVAR["enslaved",false,true];
hint "Attention ! Vous pouvez a nouveau vous faire asservir en esclavage !";