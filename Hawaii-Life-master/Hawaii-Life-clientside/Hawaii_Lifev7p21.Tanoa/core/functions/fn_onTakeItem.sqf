#include "..\..\script_macros.hpp"
/*
	File: fn_onTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blocks the unit from taking something they should not have.
*/
private["_unit","_item"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

if(isNull _unit OR _item isEqualTo "") exitWith {}; //Bad thingies?

switch(playerSide) do
{
	case west: {
		if(_item in ["U_C_Poloshirt_stripped","U_C_Poloshirt_redwhite","U_O_CombatUniform_ocamo","U_C_Poloshirt_burgundy","U_C_Poloshirt_blue","U_C_Poloshirt_salmon","U_Rangemaster","U_B_CombatUniform_mcam"]) then {
			[] call life_fnc_playerSkins;
		};
	};
	case civilian: {
		//Currently stoping the civilians from taking the Rangemaster clothing from medics or cops.
		
		if(_item in ["U_B_GEN_Soldier_F","U_B_GEN_Commander_F","U_B_CombatUniform_mcam_worn","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam"]) then {
			[_item,false,false,false,false] call life_fnc_handleItem;
		};
			
		if(_item in ["U_C_Poloshirt_stripped","U_C_Poloshirt_redwhite","U_O_CombatUniform_ocamo","U_C_Poloshirt_burgundy","U_C_Poloshirt_blue","U_C_Poloshirt_salmon","U_Rangemaster","U_C_Driver_1_blue","U_C_Driver_1_green","U_C_Driver_1_orange","U_C_Driver_1_yellow"]) then {
			[] call life_fnc_playerSkins;
		};
	};
	case independent: {
		if(_item in ["U_I_CombatUniform","U_I_CombatUniform_shortsleeve"]) then {
			[] call life_fnc_playerSkins;
		};
	};
};