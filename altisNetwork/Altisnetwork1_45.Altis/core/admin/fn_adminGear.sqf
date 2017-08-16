#include "..\..\script_macros.hpp"
/*
	Equips admin uniform and gear.
*/

if (FETCH_CONST(life_adminLevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

player addHeadgear "H_HelmetO_ViperSP_ghex_F";
player forceAddUniform "U-O_V_Soldier_Viper_F";
