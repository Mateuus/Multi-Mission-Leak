if (isNil "_thisScript") exitWith {_this spawn (missionNamespace getVariable _fnc_scriptName)};
private ["_money", "_target", "_tax"];
_money = parseNumber ctrlText 2702;

if (lbCurSel 2703 == -1) exitWith {hint localize "STR_ATM_NoneSelected"};
_target = call compile format ["%1", lbData [2703, lbCurSel 2703]];
if (isNil "_target") exitWith {hint localize "STR_ATM_DoesntExist"};
if (isNull _target) exitWith {};

if (_money < 500000 || {[format [localize "STR_GTA_MONEY_WIREWARNING", [_money] call life_fnc_numberText, name _target], "Warning", "Yes", "No"] call BIS_fnc_guiMessage}) then {
  //--- Send money
  [_target, _money, true] call GTA_fnc_sendMoney;
};

//--- Update GUI
[] call life_fnc_atmMenu;
