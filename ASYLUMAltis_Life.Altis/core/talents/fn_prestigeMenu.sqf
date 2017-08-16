/*
	File: fn_prestigeMenu.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Populates the prestige menu.
	Please either get Asylum permission to use this or create this system yourself.
*/

private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 1700)};
_display = findDisplay 1700;
_list = _display displayCtrl 1702;
_learn = _display displayCtrl 1710;
_stats = _display displayCtrl 1712;

//Purge List
lbClear _list;

// Disable buttons by default since none are pre-selected
_learn ctrlShow false;

// Populate general talent stats
_stats ctrlSetText format["Available Prestige: %1", [life_prestige] call life_fnc_numberText];

// And populate the talents
[_list, 0, 0] call life_fnc_addPrestigeRow;