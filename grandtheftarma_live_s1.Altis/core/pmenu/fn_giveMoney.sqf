private ["_target", "_money"];
_money = parseNumber ctrlText 2018;

if (lbCurSel 2022 == -1) exitWith {hint "No one was selected!"};
_target = call compile format ["%1", lbData [2022, lbCurSel 2022]];
if (isNil "_target") exitWith {};
if (isNull _target) exitWith {};
if (_target == player) exitWith {};

//--- Send money
[_target, _money, false] call GTA_fnc_sendMoney;

//--- Update GUI
[] call life_fnc_p_updateMenu;
