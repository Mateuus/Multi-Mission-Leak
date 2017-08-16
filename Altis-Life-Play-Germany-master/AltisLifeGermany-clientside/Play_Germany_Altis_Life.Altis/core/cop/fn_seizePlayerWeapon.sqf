/*
	File: fn_seizePlayerWeapon.sqf
	Author: Skalicon
	
	Description:
	Preforms the seizePlayerWeaponAction script on the cursorTarget
*/
[[],"life_fnc_seizePlayerWeaponAction",cursorTarget,false] spawn life_fnc_MP;
[[52, player, format["Sie haben die Waffen und Magazine von %1 beschlagnahmt und auf die Fahndungsliste gesetzt", name cursorTarget]],"TON_fnc_logIt",false,false] spawn life_fnc_MP;