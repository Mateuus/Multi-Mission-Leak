/*
	File: fn_seizePlayerWeapon.sqf
	Author: Skalicon

	Description:
	Preforms the seizePlayerWeaponAction script on the cursorTarget
*/
_handle = [format["Do you wish to seize %1's weapons and illegal items?",name cursorTarget]] spawn life_fnc_confirmMenu;
waitUntil {scriptDone _handle};
if(!life_confirm_response) exitWith {};

if(isPlayer cursorTarget) then{
	[[],"life_fnc_seizePlayerIllegalAction",cursorTarget,false] spawn life_fnc_MP;
	titleText format["You have seized %1's illegal items", name cursorTarget];
} else {
	titleText ["Unable to seize illegal items. Please try again."];
};

//titleText format["Seized weapons from %1", name cursorTarget];
//[[52, player, format["Seized weapons from %1", name cursorTarget]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
