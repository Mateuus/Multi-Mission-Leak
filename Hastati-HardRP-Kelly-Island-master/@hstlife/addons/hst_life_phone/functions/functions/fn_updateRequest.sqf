#include "\hst_life_phone\script_macros.hpp"
/*
	File: fn_cellphone.sqf
	Author: Alan
	
	Description:
	Opens the cellphone menu?
*/
private["_display","_list","_type"];
if(hst_life_phone_activeNumber != "") then {
	{
		if(_x select 0 == hst_life_phone_activeCard) exitWith {
			_x set [3, hst_life_phone_activeCardSaldo];
			[0,hst_life_phone_activeCard] spawn hst_life_phone_functions_fnc_cardUpdate;
		};
	} forEach hst_life_phone_cards;
};