/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */
 
private ["_maxLoadU", "_maxLoadV", "_maxLoadB", "_broadShoulders", "_strongBack"];
_maxLoadU = 0;
_maxLoadV = 0;
_maxLoadB = 0;

if (uniform player != "") then {
  _maxLoadU = [uniform player] call GTA_fnc_virtualInventoryContainerMaxLoad;
};

if (vest player != "") then {
  _maxLoadV = [vest player] call GTA_fnc_virtualInventoryContainerMaxLoad;

  //--- Broad shoulders perk
  _broadShoulders = switch (["broad_shoulders"] call GTA_fnc_perkRank) do {
    case 1: {5};
    case 2: {10};
    default {0};
  };

  _maxLoadV = _maxLoadV + _broadShoulders;
};

if (backpack player != "") then {
  _maxLoadB = [backpack player] call GTA_fnc_virtualInventoryContainerMaxLoad;

  //--- Strong back perk
  _strongBack = switch (["strong_back"] call GTA_fnc_perkRank) do {
    case 1: {5};
    case 2: {10};
    case 3: {15};
    default {0};
  };

  _maxLoadB = _maxLoadB + _strongBack;
};

//--- Apply max weight
life_maxWeight = life_maxWeightT + _maxLoadU + _maxLoadV + _maxLoadB;
