/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params ["_display", "_code", "_shift", "_ctrl", "_alt"];
private ["_handled", "_userKeys"];
_handled = false;

//--- Incapacitated suicide
if (_code == 1 && {player getVariable ["incapacitated", false]} && {player getVariable ["GTA_revive_blood", 1 ] <= 0.7}) then {
  forceRespawn player;
};

//--- Block
if (
  [] call GTA_fnc_isInputBlocked
  && {!(_code in actionKeys "PushToTalk" + actionKeys "VoiceOverNet" + actionKeys "PushToTalkDirect" + actionKeys "PrevChannel" + actionKeys "NextChannel" + actionKeys "Chat")}
) exitWith {true};

//--- User keys
_userKeys = [];
for "_x" from 1 to 20 do {
  //--- Get user key
  private "_userKey";
  _userKey = actionKeys format ["User%1", _x];

  //--- Push user key to user keys array
  _userKeys pushBack (if (count _userKey > 0) then [{_userKey select 0}, {-1}]);
};

//--- Action keys handler
switch true do {
  //--- Movement
  case (_code in actionKeys "MoveForward");
  case (_code in actionKeys "MoveBack");
  case (_code in actionKeys "TurnLeft");
  case (_code in actionKeys "TurnRight"): {
    //--- Interupt action
    if (GTA_actionLock && {!GTA_actionInterrupt}) then {
      GTA_actionInterrupt = true;
      _handled = true;
    };
  };

  //--- Fire
  case (_code in actionKeys "Fire"): {
    _handled = (!isNil "GTA_disableFire" && {GTA_disableFire});
  };

  //--- Force Commanding Mode
  case (_code in actionKeys "ForceCommandingMode"): {
    _handled = true;
  };

  //--- Tactical View
  case (_code in actionKeys "TacticalView"): {
    _handled = true;
  };

  //--- Diary
  case (_code in actionKeys "Diary"): {
    _handled = true;
  };

  //--- Select Unit
  case (_code in actionKeys "SelectGroupUnit0");
  case (_code in actionKeys "SelectGroupUnit1");
  case (_code in actionKeys "SelectGroupUnit2");
  case (_code in actionKeys "SelectGroupUnit3");
  case (_code in actionKeys "SelectGroupUnit4");
  case (_code in actionKeys "SelectGroupUnit5");
  case (_code in actionKeys "SelectGroupUnit6");
  case (_code in actionKeys "SelectGroupUnit7");
  case (_code in actionKeys "SelectGroupUnit8");
  case (_code in actionKeys "SelectGroupUnit9");
  case (_code in actionKeys "GroupPagePrev");
  case (_code in actionKeys "GroupPageNext"): {
    _handled = true;
  };

  //--- Select All Units
  case (_code in actionKeys "SelectAll"): {
    _handled = true;
  };

  //--- Commanding Menu
  case (_code in actionKeys "CommandingMenu0");
  case (_code in actionKeys "CommandingMenu1");
  case (_code in actionKeys "CommandingMenu2");
  case (_code in actionKeys "CommandingMenu3");
  case (_code in actionKeys "CommandingMenu4");
  case (_code in actionKeys "CommandingMenu5");
  case (_code in actionKeys "CommandingMenu6");
  case (_code in actionKeys "CommandingMenu7");
  case (_code in actionKeys "CommandingMenu8");
  case (_code in actionKeys "CommandingMenu9"): {
    _handled = true;
  };
};

//--- Key code handler
switch _code do {
  //--- Holster / Unholster
  case 34: {
    _handled = _shift;
  };

  //--- Holster / Unholster
  case 35: {
    if (_shift && !_ctrl && currentWeapon player != "") then {
      life_curWep_h = currentWeapon player;
      player action ["SwitchWeapon", player, player, 100];
      player switchcamera cameraView;
    };

    if (!_shift && _ctrl && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
      if (life_curWep_h in [primaryWeapon player, secondaryWeapon player, handgunWeapon player]) then {
        player selectWeapon life_curWep_h;
      };
    };
  };

  //--- Messaging (Shift + M)
  case 50: {
    _handled = !_alt && {!_ctrl} && {_shift};
  };

  //--- Restraining (Shift + R)
  case 19: {
    if (player getVariable ["restrained", false]) exitWith {};
    private _target = [] call GTA_fnc_cursorTarget;

    if (_shift) then {
      //--- Side check
      if (
        playerSide == west && {side group _target != playerSide}
        || {playerSide == civilian && {license_civ_rebel || {license_civ_advrebel} || {["bounty_hunter"] call GTA_fnc_hasPerk}} && {life_inv_zipties > 0 || {license_civ_advrebel}}}
     ) then {
       //--- Check target
       if (
          !isNull _target
          && {isPlayer _target}
          && {_target distance player < 3.5}
          && {speed _target < 1}
          && {_target getVariable ["surrender", false] || {_target getVariable ["unconscious", false]} || {_target getVariable ["incapacitated", false]} || {_target getVariable ["tased", false]} || {playerSide == west}}
          && {!(_target getVariable ["restrained", false])}
          && {!(_target getVariable ["escorting", false])}
          && {!(_target in units player && {[_target] call GTA_fnc_reviveStatus == "INCAPACITATED"})}
        ) then {
          //--- Restrain
          [_target, player, true] spawn GTA_fnc_restrain;

          //--- Remove cuffs from civilians
          if (playerSide == civilian && {!license_civ_advrebel}) then {
            [false, "zipties", 1] call life_fnc_handleInv
          };
        };
      };

      _handled = true
    };
  };

  //--- Emergency Lights (L)
  case 38: {
    _handled = _shift;
  };

  //--- Suppress sound (App Menu) (User Key 9)
  case (_userKeys select 8);
  case 221: {
    if (!GTA_soundMuted && !GTA_soundSuppressed && !_shift && !_ctrl && !_alt) then {
      GTA_soundSuppressed = true;

      0 fadeSound (["Audio_EffectsMuted"] call GTA_fnc_getSetting);
      0 fadeMusic (["Audio_MusicMuted"] call GTA_fnc_getSetting);
      ["onToggleSound", [true]] call GTA_RscSoundStatus_script;
    };
  };
};

_handled
