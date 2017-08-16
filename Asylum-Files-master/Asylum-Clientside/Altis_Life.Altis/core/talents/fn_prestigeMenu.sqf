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
_unlearn = _display displayCtrl 1711;
if(playerSide == civilian) then {_unlearn ctrlEnable false} else {_unlearn ctrlShow false};
_stats = _display displayCtrl 1712;
(_display displayCtrl 1703) ctrlSetText format["Select a speciality from the list to the left for more information on its requirements and the benefits it brings. You must have enough %1 in order to learn a speciality.",if(playerSide == civilian) then {"honor"} else {"prestige"}];
//Purge List
lbClear _list;

// Disable buttons by default since none are pre-selected
_learn ctrlShow false;

// Populate general talent stats
_word = if(playerSide == civilian) then {["Honor",life_honor]} else {["Prestige",life_prestige]};
_stats ctrlSetText format["Available %2: %1", [_word select 1] call life_fnc_numberText,_word select 0];

// And populate the talents
[_list, 0, 0] call life_fnc_addPrestigeRow;