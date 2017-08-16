/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private _cfg = missionConfigFile >> "GTA_CfgGathering";

//--- Exit if "swimming"
if (underwater player) exitWith {};

//--- Determine gather
_cfg = {
  private "_positions";
  _positions = getArray (_x >> "positions");

  if (count _positions > 0 && {
    //--- Check distances
    {
      if ([player, (_x select 0) call BIS_fnc_position] call BIS_fnc_distance2D < _x select 1) exitWith {true};
      false
    } forEach _positions
  }) exitWith {_x};
} forEach configProperties [_cfg, "getNumber (_x >> ""scope"") > 0"];

//--- Exit if no position could be found
if (isNil "_cfg") exitWith {};

//--- Configuratrion
private _factions = getArray (_cfg >> "factions");
private _radius = getNumber (_cfg >> "radius");
private _resources = getArray (_cfg >> "resources");
private _requiredItems = getArray (_cfg >> "requiredItems");
private _requiredLicenses = getArray (_cfg >> "requiredLicenses");
private _requiredPerks = getArray (_cfg >> "requiredPerks");
private _actionTime = getNumber (_cfg >> "actionTime");
private _actionTitle = if (isText (_cfg >> "actionTitle")) then {getText (_cfg >> "actionTitle")} else {"Gathering"};

//--- Exit if no resources defined
if (count _resources == 0) exitWith {};

//--- Required faction
if (count _factions > 0 && {!([] call GTA_fnc_faction in _factions)}) exitWith {};

//--- Required item(s)
if (count _requiredItems > 0 && {
    {
      _x = [_x, 0] call life_fnc_varHandle;

      //--- Check item var
      if (missionNamespace getVariable [_x, 0] <= 0) exitWith {true};
      false
    } forEach _requiredItems;
  }
) exitWith {
  //--- List of redable required items
  private "_message";
  _message = "";
  {_message = _message + format ["%1<br />", [[_x, 0] call life_fnc_varHandle] call life_fnc_varToStr]} forEach _requiredItems;

  //--- License(s) missing
  [1, ["STR_GTA_GATHERING_NOITEM", _message], ["Warning", "#ff8800"]] call GTA_fnc_broadcast;
};

//--- Required license(s)
if (count _requiredLicenses > 0 && {
    {
      //--- Check player has license
      if !([_x] call GTA_fnc_hasLicense) exitWith {true};
      false
    } forEach _requiredLicenses;
  }
) exitWith {
  //--- List of redable required licenses
  private "_message";
  _message = "";
  {_message = _message + format ["%1<br />", [([_x, 0] call life_fnc_licenseType) select 0] call life_fnc_varToStr]} forEach _requiredLicenses;

  //--- License(s) missing
  [1, ["STR_GTA_GATHERING_NOLICENSE", _message], ["Warning", "#ff8800"]] call GTA_fnc_broadcast;
};

//--- Required perk(s)
if (count _requiredPerks > 0 && {
    {
      //--- Check player has perk
      if !([_x] call GTA_fnc_hasPerk) exitWith {true};
      false
    } forEach _requiredPerks;
  }
) exitWith {};

//--- Events
private _onBeforeGather = getText (_cfg >> "Events" >> "onBeforeGather");
private _onAfterGather = getText (_cfg >> "Events" >> "onAfterGather");

//--- Event functions
_onBeforeGather = missionNamespace getVariable _onBeforeGather;
_onAfterGather = missionNamespace getVariable _onAfterGather;

//--- Check if any resources are illegal
private _isLegal = true;

{
  if !([_x select 0] call GTA_fnc_isVirtualItemLegal) exitWith {_isLegal = false};
} forEach _resources;

//--- Gathering speed perks
_actionTime = (
  if (_isLegal) then {

    //--- Farmer
    switch (["farmer"] call GTA_fnc_perkRank) do {
      case 1: {_actionTime * 0.9};
      case 2: {_actionTime * 0.75};
      case 3: {_actionTime * 0.5};
      default {_actionTime};
    };
  } else {
    //--- Harvester
    switch (["harvester"] call GTA_fnc_perkRank) do {
      case 1: {_actionTime * 0.9};
      case 2: {_actionTime * 0.75};
      case 3: {_actionTime * 0.5};
      default {_actionTime};
    };
  }
);

//--- Check if resource can be gathered
if (
  {
    private _resource = _x select 0;
    private _count = _x select 1;

    //--- Check diff
    if ([_resource, _count, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff > 0) exitWith {false};
    true
  } forEach _resources
) exitWith {[1, "STR_GTA_INVENTORY_FULL", ["Warning", "#ff8800"]] call GTA_fnc_broadcast;};

//--- Before gather event
if (!isNil "_onBeforeGather" && {!(["BeforeGather"] call _onBeforeGather)}) exitWith {};

//--- Gather action
if ([_actionTime, _actionTitle] call GTA_fnc_action) then {
  //--- After gather event
  if (!isNil "_onAfterGather" && {!(["AfterGather"] call _onAfterGather)}) exitWith {};

  //--- Loop through resources
  {
    private _resource = _x select 0;
    private _count = _x select 1;

    //--- Loop through item count
    for "_x" from 1 to _count do {
      //--- Add item
      [true, _resource, 1] call life_fnc_handleInv;
    };
  } forEach _resources;

  //--- Add experience
  ["gather", "Gathering"] call GTA_fnc_addExp;
};
