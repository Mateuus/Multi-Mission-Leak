/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_target", objNull, [objNull]]
];

//--- Remove any previous event handler
if (!isNil "GTA_fnc_onHandleHeal_thread") then {
  terminate GTA_fnc_onHandleHeal_thread;
};

//--- Error checks
if (isNull _target) exitWith {};

//--- Healing hands perk
if !("Medikit" in items player) then {
  private _dice = random 100;
  private _chance = switch (["healing_hands"] call GTA_fnc_perkRank) do {
    case 1: {10};
    case 2: {25};
    case 3: {50};
    default {0};
  };

  if (_dice < _chance) then {
    player addItem "FirstAidKit";
  };
};

//--- Animation done event handler
GTA_fnc_onHandleHeal_thread = [_target, damage _target] spawn {
  params ["_target", "_damage"];

  //--- Wait
  waitUntil {damage _target < _damage};

  if (
    !(getNumber (configFile >> "CfgVehicles" >> typeOf player >> "attendant") > 0 && {"Medikit" in items player})
    && {["first_aid"] call GTA_fnc_hasPerk}
  ) then {
    //--- Damage and fatigue penalty
    private _firstAid = ["first_aid"] call GTA_fnc_perkRank;
    _damage = linearConversion [0, 5, _firstAid, 0.25, 0];
    private _fatigue = linearConversion [0, 5, _firstAid, 0.3, 1];

    //--- Apply damage and fatigue
    _target setDamage _damage;
    player setFatigue (getFatigue player + _fatigue);
  };

  //--- Add experience
  ["heal", "Healed"] call GTA_fnc_addExp;
};
