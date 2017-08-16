/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_house", objNull, [objNull]]
];

//--- Error checks
if (
  isNull _house
  || {(_house getVariable "house_owner") select 0 != getPlayerUID player}
) exitWith {};

//--- Read the current lock quality
private _lockQuality = _house getVariable ["lock_quality", 0];

//--- Cost
private _cost = 10000000 + (1000000 * _lockQuality);

//--- Confirmation
if ([format [localize "STR_GTA_HOUSING_UPGRADELOCKWARNING", [_cost] call life_fnc_numberText, _lockQuality], "Warning", "Yes", "No"] call BIS_fnc_guiMessage) then {
  //--- Check funds
  if (GTA_money_bank < _cost) exitWith {hint localize "STR_ATM_NotEnoughFunds"};

  //--- Upgrade
  _house setVariable ["lock_quality", _lockQuality + 1, true];
  [_house] remoteExec ["GTA_db_fnc_upgradeHouseLocks", 2];

  //--- Update bank
  GTA_money_bank = GTA_money_bank - _cost;
  [1] call GTA_fnc_updatePlayerPartial;
};
