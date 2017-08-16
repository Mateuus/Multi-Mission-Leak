/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (isNil "GTA_player_received" || {!GTA_player_received} || {!isNil "GTA_disablePlayerUpdates" && {GTA_disablePlayerUpdates}}) exitWith {};

private ["_mode", "_params", "_update"];
_mode = [_this, 0, 0, [0]] call GTA_fnc_param;
_params = [];
_update = true;

switch _mode do {
  //--- Money
  case 0: {_params pushBack GTA_money_cash};

  //--- Bank
  case 1: {_params pushBack GTA_money_bank};

  //--- Licenses
  case 2: {
    private ["_type", "_licenses"];

    //--- Type handle
    _type = switch playerSide do {
      case west: {"cop"};
      case civilian: {"civ"};
      case independent: {"med"};
      default {};
    };

    //--- No type
    if (isNil "_type") exitWith {
      _update = false;
    };

    _licenses = [];
    {
      if (_x select 1 == _type) then {
        _licenses pushBack [_x select 0, missionNamespace getVariable (_x select 0)];
      };
    } foreach life_licenses;
    _params pushBack _licenses;
  };

  //--- Gear
  case 3: {
    if (playerSide == civilian) then {
      _params pushBack ([player, true] call GTA_fnc_saveInventory);
    } else {
      //--- Cancel update
      _update = false;
    };
  };

  //---
  case 4: {};

  //--- Arrested
  case 5: {_params pushBack life_is_gta_arrested;};

  //--- Money + Bank
  case 6: {
    _params pushBack GTA_money_cash;
    _params pushBack GTA_money_bank;
  };
};

//--- Exit update request
if (!_update) exitWith {};

//--- Send update request to server
[[_mode, getPlayerUID player, playerSide, _params], "GTA_db_fnc_updatePlayerPartial", false] call GTA_fnc_remoteExec;
