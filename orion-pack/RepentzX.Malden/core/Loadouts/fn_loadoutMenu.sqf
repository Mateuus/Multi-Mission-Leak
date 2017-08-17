/*
	File: fn_loadoutMenu.sqf
	Author: Jason_000
*/
disableSerialization;
if(playerSide != west) exitWith {["You must be a cop!",false,"slow"] call life_fnc_notificationSystem;};
if (mav_ttm_var_loadouts == 0) exitwith {["You need the perk (Police Loadouts) to use this!",false,"slow"] call life_fnc_notificationSystem;};


if (!dialog) then {
	createDialog "life_loadoutsPanel";
};

private _list = ((findDisplay 4000) displayCtrl 4002);
lbClear _list;

Loadout = profileNamespace getVariable['Loadout',[]];

if !(Loadout isEqualTo []) then {
	{findDisplay 4000 displayCtrl 4002 lbAdd _x;} forEach Loadout;
};
