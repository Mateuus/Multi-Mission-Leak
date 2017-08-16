/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#define HAS_TOOLKIT "ToolKit" in items player || {"ToolKit" in itemCargo _vehicle}

params [
  ["_vehicle", objNull, [objNull]]
];

//--- Error checks
if (isNull _vehicle) exitWith {};

//--- Check if toolkit in car or on player
if (HAS_TOOLKIT) then {
  //--- Repair duration
  private _duration = 35;
  _duration = switch (["mechanic"] call GTA_fnc_perkRank) do {
    case 1: {_duration * 0.9};
    case 2: {_duration * 0.75};
    case 3: {_duration * 0.6};
    default {_duration};
  };

  //--- Action
  if ([_duration, "Repairing Vehicle", nil, {!isNull _this && {[player, _this, 2] call GTA_fnc_boundingCollision}}, _vehicle] call GTA_fnc_action) then {
    //--- Exit if no Toolkit
    if !(HAS_TOOLKIT) exitWith {titleText ["No toolkit found", "PLAIN"]};

    //--- Skip if HATO
    if !([] call GTA_fnc_isHATO) then {
      //--- Scrapper perk
      private _chance = switch (["scrapper"] call GTA_fnc_perkRank) do {
        case 1: {25};
        case 2: {50};
        case 3: {75};
        case 4: {100};
        default {0};
      };

      //--- Remove toolkit
      if !([_chance] call GTA_fnc_rollDice) then {
        if ("ToolKit" in items player) then {
          player removeItem "Toolkit";
        } else {
          //--- Retrive the item cargo
          private _itemCargo = getItemCargo _vehicle;
          private _toolkitIndex = (_itemCargo select 0) find "ToolKit";
          if (_toolkitIndex == -1) exitWith {};

          //--- Clear item cargo
          clearItemCargoGlobal _vehicle;

          //--- Remove a toolkit
          (_itemCargo select 1) set [_toolkitIndex, ((_itemCargo select 1) select _toolkitIndex) - 1];

          //--- Add items back to vehicle
          {_vehicle addItemCargoGlobal [_x, (_itemCargo select 1) select _forEachIndex]} forEach (_itemCargo select 0);
        };
      };
    };

    //--- Repair the vehicle
    _vehicle setDamage 0;

    //--- Repair message
    titleText ["Vehicle repaired", "PLAIN"];

    //--- Add fatigue
    player setFatigue (getFatigue player + 0.5);

    //--- Experience
    ["repair", "Repaired Vehicle", [1, 4] select ([] call GTA_fnc_isHATO)] call GTA_fnc_addExp;
  };
};
