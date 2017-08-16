/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params ["_unit", "_corpse", "_respawn", "_delay"];

//--- Default respawn time
setPlayerRespawnTime (getNumber (missionConfigFile >> "respawnDelay"));

//--- Player actions
[] call GTA_fnc_initActions;

if (_unit getVariable ["incapacitated", false]) then {
  //--- Disable damage
  _unit allowDamage false;

  //--- Reset variables
  _unit setVariable ["tased", nil, true];
  _unit setVariable ["escorting", nil, true];
  _unit setVariable ["transporting", nil, true];

  //--- Clothes
  removeUniform _unit;
  removeVest _unit;
  removeBackpack _unit;
  removeHeadgear _unit;
  removeGoggles _unit;
  removeAllWeapons _unit;
  removeAllAssignedItems _unit;

  _unit forceAddUniform (GTA_revive_loadoutIncapacitated select 0);
  _unit addVest (GTA_revive_loadoutIncapacitated select 1);
  _unit addBackpack (GTA_revive_loadoutIncapacitated select 2);
  _unit addHeadgear (GTA_revive_loadoutIncapacitated select 3);
  _unit addGoggles (GTA_revive_loadoutIncapacitated select 4);
  if (GTA_revive_loadoutIncapacitated select 5) then {
    _unit linkItem "ItemGPS";
  };

  //--- Unit textures
  [[_unit, uniform _unit, uniformContainer _unit], "GTA_fnc_setUnitTextures"] call GTA_fnc_remoteExec;

  //--- Disable collision
  //{_unit disableCollisionWith _x; [[_unit, _x], "disableCollisionWith", _x] call GTA_fnc_remoteExec} forEach ((switchableUnits + playableUnits) - [_unit]);

  //--- Set new unit position at corpse
  _unit setPosASL (getPosASL _corpse);
  _unit setDir (direction _corpse);

  //--- Injured animation
  [[_unit, "acts_InjuredLyingRifle02"], "switchMove"] call GTA_fnc_remoteExec;

  //--- Delete corpse
  if (_unit != _corpse) then {deleteVehicle _corpse};

  //--- Set status
  [_unit, "INCAPACITATED"] call GTA_fnc_reviveSetStatus;

  //--- Medic notification
  [[profileName], "GTA_fnc_reviveNotification", independent] call GTA_fnc_remoteExec;

  //--- First person
  _unit switchCamera "INTERNAL";

  //--- Incapacitated thread
  scriptName "GTA_fnc_reviveOnRespawn: incapacitated";
  params ["_unit"];

  //--- Fade in
  sleep 2;
  titleCut ["", "BLACK IN", 1];

  //--- Bleed out
  [_unit, true] call GTA_fnc_reviveBleedOut;
  _unit allowDamage true;

  //--- Revive IGUI
  ["GTA_RscRevive"] call GTA_fnc_createRscLayer;

  //--- Wait for revive
  waitUntil {!(_unit getVariable ["incapacitated", false])};

  //--- Destroy revive IGUI
  ["GTA_RscRevive"] call GTA_fnc_destroyRscLayer;

  //--- Reset status
  [_unit, "ALIVE"] call GTA_fnc_reviveSetStatus;

  //--- Revived
  if (alive _unit) then {
    //--- Enable collision
    //{_unit enableCollisionWith _x; [[_unit, _x], "disableCollisionWith", _x] call GTA_fnc_remoteExec} forEach ((switchableUnits + playableUnits) - [_unit]);

    //--- System message (revived)
    [[[0], ["STR_GTA_REVIVE_REVIVED", profileName]], "GTA_fnc_broadcast"] call GTA_fnc_remoteExec;

    //--- Load loadout
    [_unit, GTA_revive_loadout] call GTA_fnc_loadInventory;

    //--- Update
    [] spawn GTA_fnc_updatePlayer;

    //--- Unit textures
    [[_unit, uniform _unit, uniformContainer _unit], "GTA_fnc_setUnitTextures"] call GTA_fnc_remoteExec;

    //--- Fatigue
    _unit setFatigue 1;

    //--- Restrained
    if (_unit getVariable ["restrained", false]) then {
      //--- Set as unrestrained locally
      _unit setVariable ["restrained", false];

      //--- Restrain
      [player, _unit getVariable ["restrained_unit", objNull], true, false, false] spawn GTA_fnc_restrain;

      } else {
        //--- Revive animation
        [[_unit, "AmovPpneMstpSnonWnonDnon"], "switchMove"] call GTA_fnc_remoteExec;
      };

      //--- Enable HUD
      ["GTA_RscHUD"] call GTA_fnc_createRscLayer;

      //--- Enable name tags
      [true] call GTA_fnc_nameTags;
      } else {
        //--- System message (bleedout)
        [[[0], ["STR_GTA_REVIVE_BLEEDOUT", profileName]], "GTA_fnc_broadcast"] call GTA_fnc_remoteExec;
      };
} else {
  //--- Reset status
  [_unit, "ALIVE"] call GTA_fnc_reviveSetStatus;

  //--- Unrestrain
  [_unit, _unit, false, false, false] spawn GTA_fnc_restrain;

  //--- Delete corpse
  deleteVehicle _corpse;

  //--- Loadout
  [] call GTA_fnc_loadoutPlayer;

  //--- Destroy respawn time layers
  ["SplashNoise"] call GTA_fnc_destroyRscLayer;
  ["GTA_RscInfoText"] call GTA_fnc_destroyRscLayer;

  _this spawn {
    params ["_unit"];

    //--- Disable unit damage
    _unit allowDamage false;

    //--- Select spawn
    [] call GTA_fnc_selectSpawn;

    //--- Enable unit damage
    _unit allowDamage true;

    //--- Enable survival
    [] call GTA_fnc_survival;

    //--- Enable HUD
    ["GTA_RscHUD"] call GTA_fnc_createRscLayer;

    //--- Enable name tags
    [true] call GTA_fnc_nameTags;
  };
};

//--- Remove effects
[false] call GTA_fnc_reviveEffects;

//--- Enable player updates
GTA_disablePlayerUpdates = false;
