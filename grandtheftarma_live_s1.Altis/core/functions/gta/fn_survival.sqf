/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_enable";
_enable = [_this, 0, true, [true]] call GTA_fnc_param;

if (_enable) then {
  GTA_fnc_survival_thread = [] spawn {
    #define TIME_DELTA 1
    #define HUNGER_TIME (140 * 60)
    #define THIRST_TIME (120 * 60)

    private	["_speed", "_hunger", "_thirst", "_retention", "_death", "_exit"];
    _exit = false;

    //--- Default survial values
    GTA_hunger = 100;
    GTA_thirst = 100;

    while {true} do {
      //--- Calculate player speed
      _speed = (velocity player vectorDistance [0, 0, 0]) * 3.6;

      //--- Clamp speed
      _speed = 24 min _speed;

      //--- Hunger/thirst delta
      _hunger = TIME_DELTA * (100 / HUNGER_TIME);
      _thirst = TIME_DELTA * (100 / THIRST_TIME);

      //--- Check if player is on foot
      if (vehicle player == player && {_speed > 0}) then {
        //--- Factor in player speed
        _hunger = _hunger + (_hunger * (_speed / 10));
        _thirst = _thirst + (_thirst * (_speed / 10));
      };

      //--- Retention perk
      _retention = switch (["retention"] call GTA_fnc_perkRank) do {
        case 1: {0.25};
        case 2: {0.5};
        case 3: {0.75};
        default {0};
      };

      //--- Retention factor
      if (_retention > 0) then {
        _hunger = _hunger - (_hunger * _retention);
        _thirst = _thirst - (_thirst * _retention);
      };

      //--- Clamp hunger and thirst
      _hunger = 100 min (0 max (GTA_hunger - _hunger));
      _thirst = 100 min (0 max (GTA_thirst - _thirst));

      //--- Apply new hunger and thirst values
      GTA_hunger = _hunger;
      GTA_thirst = _thirst;

      //--- Injured effect
      if (damage player >= 0.85 || {GTA_hunger < 5} || {GTA_thirst < 5}) then {
        addCamShake	[2, 1, 25];
      };

      if (GTA_hunger	<= 0 || {GTA_thirst <= 0}) then {
        //--- Fatigue the player
        player setFatigue 1;

        //--- For the player to walk
        player forceWalk true;
      } else {
        if (isForcedWalk player) then {
          player forceWalk false;
        };
      };

      uiSleep TIME_DELTA;
    };
  };
} else {
	//--- Terminate
	if (!isNil "GTA_fnc_survival_thread" && {!isNull GTA_fnc_survival_thread}) then {terminate GTA_fnc_survival_thread};
};
