/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params ["_target", "_caller", "_index", "_action", "_actionName"];
if ([] call GTA_fnc_isInputBlocked) exitWith {true};
if (_action in ["TakeWeaponFromBody", "TakeWeapon", "TakeMagazine", "TakeItem", "Rearm"]) exitWith {true};

//--- Heal
if (_action in ["HealSoldier", "HealSoldierSelf"]) then {
  [_target] call GTA_fnc_onHandleHeal;
};

false
