/*
	File: fn_seizePlayerWeapon.sqf
	Author: Skalicon
	
	Description:
	Preforms the seizePlayerWeaponAction script on the cursorTarget
*/
[[],"life_fnc_seizePlayerIllegalAction",cursorTarget,false] spawn BIS_fnc_MP;
//titleText format["Seized weapons from %1", name cursorTarget];
//[[52, player, format["Seized weapons from %1", name cursorTarget]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;