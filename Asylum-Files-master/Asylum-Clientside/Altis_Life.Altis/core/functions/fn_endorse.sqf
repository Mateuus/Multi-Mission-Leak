/*
	File: fn_endorse.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Convert prestige to hard cash!
*/

private ["_display","_val","_cash"];

if (life_wealthPrestige < 1) exitWith {};

disableSerialization;
waitUntil {!isnull (findDisplay 6700)};
_display = findDisplay 6700;

_val = parseNumber(ctrlText 6702);
if(!([str(_val)] call life_fnc_isnumber)) exitWith {hint "That isn't in an actual number format."};
if(_val > 999999) exitWith {hint "You can't convert more then $999,999";};
if(_val < 31) exitWith {hint "You must convert over $1000"};
if(_val < 0) exitwith {};
if (_val > life_wealthPrestige) exitWith {hint "You don't have that much prestige to convert!"};

_cut = floor((life_wealthPrestige * 75) / life_endorse_max); // 75% cut at max
if (_cut > 75) then { _cut = 75; };
if (_cut < 15) then { _cut = 15; };
_cash = _val - (floor (_val * (_cut / 100)));

if ((_cash + life_money) > 1000000) exitWith {hint format["An endorsement of %1 would result in $%2, which would exceed your bank account limit by %3.", [_val] call life_fnc_numberText, [_cash] call life_fnc_numberText, [1000000 - (_cash + life_money)] call life_fnc_numberText]};
systemChat format["You've converted %1 prestige into $%2 after a %3 percent cut.", [_val] call life_fnc_numberText, [_cash] call life_fnc_numberText];
life_wealthPrestige = life_wealthPrestige - _val;
["atm","add",_cash] call life_fnc_uC;

closeDialog 0;
[] call life_fnc_achievementScan;
[] call life_fnc_sessionUpdate;