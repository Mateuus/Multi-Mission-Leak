/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_object", "_isVehicle", "_time", "_chance"];
_object = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
_isVehicle = [_object, ["Car_F", "Tank_F", "Ship_F", "Air", "Slingload_01_Base_F"]] call GTA_fnc_isKindOf;

//--- Error checks
if (isNull _object) exitWith {};

//--- Has lockpick or snap gun
if (life_inv_lockpick <= 0 && {life_inv_snapgun <= 0}) exitWith {};

//--- Check snap gun requirements
if (life_inv_snapgun > 0 && {playerSide != west && {!license_civ_advrebel} && {!([] call GTA_fnc_isHATO)}}) exitWith {hint "Snap Guns can only be used by trained professionals"};

//--- Lockpicking enabled
if (_isVehicle && {playerSide != west} && {getNumber (missionConfigFile >> "GTA_CfgVehicles" >> typeOf _object >> "disableLockpick") > 0}) exitWith {};

//--- Lock difficulty
if (_isVehicle && {life_inv_snapgun <= 0} && {getNumber (missionConfigFile >> "GTA_CfgVehicles" >> typeOf _object >> "lockDifficulty") > 0}) exitWith {
  [1, ["STR_GTA_VEHICLES_LOCKDIFFICULT", getText (configFile >> "CfgVehicles" >> typeOf _object >> "displayName")], ["Error", "#ff0000"]] call GTA_fnc_broadcast;
};

//--- Has vehicle keys
if (_isVehicle && {_object in life_vehicles}) exitWith {titleText ["You already have keys to this vehicle", "PLAIN"]};

//--- Restrained player checks
if (!_isVehicle && {!isPlayer _object}) exitWith {};
if (!_isVehicle && {!(_object getVariable ["restrained", false])}) exitWith {};


//--- Determine time and chance (depending on item used)
_chance = [20, 40] select (life_inv_snapgun > 0);
_time = [25, 50] select (life_inv_snapgun > 0);

//--- Remove lockpick if used
if (life_inv_lockpick > 0 && {life_inv_snapgun <= 0}) then {
  [false, "lockpick", 1] call life_fnc_handleInv;
};

//--- Locksmith perk
switch (["master_thief"] call GTA_fnc_perkRank) do {
  case 1: {_time = _time * 0.9};
  case 2: {_time = _time * 0.75};
  case 3: {_time = _time * 0.5};
};

//--- Vehicle alarm
if (_isVehicle) then {
  [[_object], "GTA_fnc_vehicleAlarm"] call GTA_fnc_remoteExec;
};

//--- Action
if ([_time, "Picking Lock", nil, {!isNull _this && {[player, _this, 2] call GTA_fnc_boundingCollision}}, _object] call GTA_fnc_action) then {
  //--- Check if vehicle
  if (_isVehicle) then {
    //--- Master thief perk
    switch (["locksmith"] call GTA_fnc_perkRank) do {
    case 1: {_chance = _chance + 5};
    case 2: {_chance = _chance + 10};
    case 3: {_chance = _chance + 15};
    };

    //--- Roll dice
    if ([_chance] call GTA_fnc_rollDice) then {

    //--- OST
    titleText [localize "STR_ISTR_Lock_Success", "PLAIN"];

    //--- Give keys
    [_object] call life_fnc_addvehicle2chain;

    //--- Add wanted
    if (playerSide == civilian) then {
      [[getPlayerUID player, profileName, "487"], "life_fnc_wantedAdd", false, false] call GTA_fnc_remoteExec;
    };

    } else {
      //--- OST
      titleText [localize "STR_ISTR_Lock_Failed", "PLAIN"];

      if (playerSide == civilian) then {
        //--- Broadcast lockpick message
        [[0, ["STR_ISTR_Lock_FailedNOTF", profileName]], "GTA_fnc_broadcast", west] call GTA_fnc_remoteExec;

        //--- Add wanted
        [[getPlayerUID player, profileName, "215"], "life_fnc_wantedAdd", false, false] call GTA_fnc_remoteExec;
      };
    };
  } else {
    //--- Unrestrain
    [_object, player, false] call GTA_fnc_restrain;
  };
};
