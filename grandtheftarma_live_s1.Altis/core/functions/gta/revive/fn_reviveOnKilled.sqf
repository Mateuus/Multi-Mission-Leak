/**
* Copyright © 2015 DnA, Grand Theft ArmA.
* All Rights Reserved.
*/

params ["_unit", "_killer", "_respawn", "_delay"];

//--- Detach
{detach _x} forEach attachedObjects player + [player];

//--- Close all displays
[] call GTA_fnc_closeAllDisplays;

//--- Disable HUD
["GTA_RscHUD"] call GTA_fnc_destroyRscLayer;

//--- Disable name tags
[false] call GTA_fnc_nameTags;

//--- Terminate survival system
[false] call GTA_fnc_survival;

//--- Disable player updates
GTA_disablePlayerUpdates = true;

if (_unit getVariable ["incapacitated", false]) then {
  //--- Drop items
  [_unit] call life_fnc_dropItems;

  //--- Reset
  life_carryWeight = 0;
  GTA_money_cash = 0;

  //--- NLR
  GTA_nlrTick = diag_tickTime;

  //--- Remove wanted
  [[getPlayerUID player], "life_fnc_wantedRemove", false] call GTA_fnc_remoteExec;

  //--- Player was killed when incapacitated
  [_unit, "ALIVE"] call GTA_fnc_reviveSetStatus;

  //--- Respawn countdown
  [] spawn {
    scriptName "GTA_fnc_reviveOnKilled: spawn countdown";

    ["SplashNoise", "BLACK"] call GTA_fnc_createRscLayer;
    ["GTA_RscInfoText"] call GTA_fnc_createRscLayer;

    GTA_RscInfoText_title = "You have died";
    GTA_RscInfoText_subtitle = "";

    while {playerRespawnTime > 0} do {
      GTA_RscInfoText_subtitle = format ["Respawning in %1", [playerRespawnTime, "MM:SS"] call BIS_fnc_secondsToString];
      uiSleep 0.01;
    };
  };
} else {
  //--- Save loadout
  GTA_revive_loadout = [_unit] call GTA_fnc_saveInventory;
  GTA_revive_loadoutIncapacitated = [uniform _unit, vest _unit, backpack _unit, headgear _unit, goggles _unit, [player] call GTA_fnc_hasGPS];

  //--- Prevent respawn
  setPlayerRespawnTime 10e10;

  //--- Log death
  [getPlayerUID _unit, getPlayerUID _killer, name _unit, name _killer, ASLtoAGL getPosASL _unit, ASLtoAGL getPosASL _killer, [_unit, true] call GTA_fnc_saveInventory, GTA_money_cash, [typeOf _killer, currentWeapon _killer] select (_killer isKindOf "Man")] remoteExec ["GTA_db_fnc_logDeath", 2];

  //--- Effects
  [true] call GTA_fnc_reviveEffects;

  //--- Remove all weapons
  removeAllWeapons _unit;

  //--- Register the unit as killed
  [_unit, "KILLED"] call GTA_fnc_reviveSetStatus;

  //--- Update (override)
  [true, 0, nil, []] spawn GTA_fnc_updatePlayer;

  //--- Add wanted to killer
  if (!isNull _killer && {alive _killer} && {side group _killer != west}) then {
    [[getPlayerUID _killer, _killer getVariable ["nametag_title", name _killer], "187"],"life_fnc_wantedAdd", false] call GTA_fnc_remoteExec;
  };

  //--- Disable collision
  //{_unit disableCollisionWith _x; [[_unit, _x], "disableCollisionWith", _x] call GTA_fnc_remoteExec} forEach ((switchableUnits + playableUnits) - [_unit]);

  [_unit] spawn {
    scriptName "GTA_fnc_reviveOnKilled: wait for incapacitated";
    params ["_unit"];

    //--- "Eject" the unit
    [_unit] call GTA_fnc_ejectVehicleUnit;

    waitUntil {vectorMagnitude velocity _unit <= 0};
    sleep 1;

    //--- Fade out screen
    titleCut ["", "BLACK OUT", 1];
    sleep 1;

    //--- Respawn player
    setPlayerRespawnTime 0;
  };
};

true
