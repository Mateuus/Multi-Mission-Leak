/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_license", "", [""]]
];

//--- Error checks
if (_license == "") exitWith {false};

//--- Get license price
private _price = [_license] call life_fnc_licensePrice;

//--- Get license level
private _level = [_license] call GTA_fnc_licenseLevel;

//--- Convert license handle to var
_license = [_license, 0] call life_fnc_licenseType;

//--- Check level
if (GTA_perks_level < _level) exitWith {[1, ["STR_GTA_LICENSES_LEVEL_REQ", _level], ["Warning", "#ff8800"]] call GTA_fnc_broadcast; false};

//--- Check cash
if (GTA_money_cash < _price) exitWith {[1, "STR_GTA_MONEY_INSUFFICIENTCASH", ["Warning", "#ff8800"]] call GTA_fnc_broadcast; false};
GTA_money_cash = GTA_money_cash - _price;

//--- Buy license
missionNamespace setVariable [_license select 0, true];
//[1, "STR_Shop_SyncYourFuckingShit", ["Warning", "#ff8800"]] call GTA_fnc_broadcast;

//--- Update cash and license
[0] call GTA_fnc_updatePlayerPartial;
[2] call GTA_fnc_updatePlayerPartial;

true
