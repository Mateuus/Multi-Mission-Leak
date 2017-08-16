/*
	File: fn_showEndorse.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Updates data shown on endorsement UI
*/

disableSerialization;
waitUntil {!isnull (findDisplay 6700)};
if (life_wealthPrestige < 1) exitWith{closeDialog 0};

_display = findDisplay 6700;
_cutCtrl = _display displayCtrl 6703;
_prestige = _display displayCtrl 6704;

_cut = floor((life_wealthPrestige * 75) / life_endorse_max); // 75% cut at max
if (_cut > 75) then { _cut = 75; };
if (_cut < 15) then { _cut = 15; };

_cutCtrl ctrlSetStructuredText parseText format["The network's cut is %1 percent.", _cut];
_prestige ctrlSetStructuredText parseText format["Your current prestige: %1", [life_wealthPrestige] call life_fnc_numberText];