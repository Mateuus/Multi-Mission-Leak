/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params ["_display", "_code", "_shift", "_ctrl", "_alt"];
private ["_handled", "_userKeys"];
_handled = false;

//--- User keys
_userKeys = [];
for "_x" from 1 to 20 do {
  //--- Get user key
  private "_userKey";
  _userKey = actionKeys format ["User%1", _x];

  //--- Push user key to user keys array
  _userKeys pushBack (if (count _userKey > 0) then [{_userKey select 0}, {-1}]);
};

//--- Block
if (
  [] call GTA_fnc_isInputBlocked
  && {!(_code == 21 && {["GTA_adminLevel", 0] call GTA_fnc_getConstant >= 3})}
  && {!(_code in [220, 221, _userKeys select 7, _userKeys select 8])}
) exitWith {true};

switch _code do {
  //--- Interaction Key (Left Windows) (User Key 10)
  case 219;
  case (_userKeys select 9): {
    [] call GTA_fnc_interact;
    _handled = true;
  };

  //--- Wave (F1)
  case 59: {
    player playAction (["GestureHi", "GestureHiC"] call BIS_fnc_selectRandom);
    _handled = true;
  };

  //--- Sassy (F2)
  case 60: {
    player playAction "GestureHiB";
    _handled = true;
  };

  //--- Nod (F3)
  case 61: {
    player playAction "GestureNod";
    _handled = true;
  };

  //--- Debug camera (F11)
  case 87: {
    if (["Debug", 0] call BIS_fnc_getParamValue > 0) then {
      [] spawn (uiNamespace getVariable "BIS_fnc_camera");
      _handled = true;
   };
 };

 //--- Toggle HUD (grave)
 case 41: {
   if (["GTA_RscHUD"] call GTA_fnc_hasDisplay) then {
     ["GTA_RscHUD"] call GTA_fnc_destroyRscLayer;
     } else {
       ["GTA_RscHUD"] call GTA_fnc_createRscLayer;
     };

     _handled = true;
   };

   //--- Menu (Y)
   case 21: {
     if (!_alt && !_ctrl && !_shift) then {
       if (!dialog) then {
         createDialog "GTA_RscDisplayMenu";
         _handled = true;
         } else {
           if !(isNull (uiNamespace getVariable ["GTA_RscDisplayMenu", displayNull])) then {
             (uiNamespace getVariable ["GTA_RscDisplayMenu", displayNull]) closeDisplay 2;
             _handled = true;
           };
         };
       };
     };

     //--- Messaging (Shift + M)
     case 50: {
       if (!_alt && {!_ctrl} && {_shift}) then {
         if (!dialog) then {
           //--- Check for radio
           if !("ItemRadio" in assignedItems player) exitWith {hint "A radio is required to access messaging";};

           //--- Open messaging
           createDialog "GTA_RscDisplayMessaging";
           _handled = true;
         };
       };
     };

     //-- Knock Out (G)
     case 34: {
       if (_shift) then {
      _target = [] call GTA_fnc_cursorTarget;

      if (!isNull _target && {isPlayer _target} && {alive _target} && {_target distance player < 4} && {speed _target < 2}) then {
        if (
          getFatigue player <= 0.4
          && {animationState _target != "incapacitated" && {!(_target getVariable ["incapacitated", false])}}
          && {currentWeapon player in [primaryWeapon player, secondaryWeapon player, handgunWeapon player] && {currentWeapon player != ""}}
          && {!life_knockout && {!(player getVariable ["tased", false])}} && {!(player getVariable ["surrender", false])}
          && {_target getVariable ["surrender", false] || {["brawler"] call GTA_fnc_hasPerk && {currentWeapon _target == "" || {currentWeapon _target == binocular _target}}}}
        ) then  {
          [_target] spawn life_fnc_knockoutAction;
        };
      };

      _handled = true;
    };
  };

  //--- Trunk (T)
  case 20: {
    //--- Surrender
    if (_shift) then {
      if (vehicle player == player && {!(player getVariable ["restrained", false])} && {animationState player != "incapacitated"} && {!(player getVariable ["tased", false])}) then {
        if (player getVariable ["surrender", false]) then {
          player setVariable ["surrender", false, true];
          } else {
            [] spawn life_fnc_surrender;
          };
        };

        _handled = true
      };

    //--- Trunk
    if (!_alt && {!_ctrl} && {!_shift}) then {
      if (vehicle player != player && {alive vehicle player} && {!(vehicle player isKindOf "Plane")}) then {
        //--- In vehicle
        if (vehicle player in life_vehicles) then {
          [vehicle player] call life_fnc_openInventory;
        };
        } else {
        _target = [] call GTA_fnc_cursorTarget;

        //--- Cursor vehicle
        if (
          [player, _target, 2] call GTA_fnc_boundingCollision
          && {alive _target}
          && {_target in life_vehicles || {!(_target getVariable ["locked", true])}}
          && {[_target, ["Car", "Air", "Ship", "Tank", "House_F", "Slingload_01_Base_F"]] call GTA_fnc_isKindOf}
        ) then {
          [_target] call life_fnc_openInventory;
        };
      };

      _handled = true
    };
  };

  //--- Siren (F)
  case 33: {
    if (!_ctrl && {!_alt} && {!_shift}) then {
      //--- Conditions for siren
      if (vehicle player != player && {driver vehicle player == player} && {playerSide == west || {[] call GTA_fnc_isMedic}} && {!(vehicle player isKindOf "Air")}) then {
        if (vehicle player getVariable ["siren", false]) then {
          //--- OST
          titleText ["Sirens Off", "PLAIN"];

          //--- Siren off
          [vehicle player, false] remoteExecCall ["GTA_fnc_vehicleSiren", -2];
        } else {
          //--- OST
          titleText ["Sirens On", "PLAIN"];

          //--- Siren on
          [vehicle player, true] remoteExecCall ["GTA_fnc_vehicleSiren", -2];
        };
      };
    };
  };

  //--- Emergency Lights (Shift + L)
  case 38: {
    if (!_ctrl && {!_alt} && {_shift}) then {
      //--- Conditions for siren
      if (
        vehicle player != player
        && {driver vehicle player == player}
        && {playerSide in [west, independent]}
        && {typeOf vehicle player in ["C_Offroad_01_F", "C_Van_01_transport_F", "I_Truck_02_box_F", "C_Offroad_01_repair_F", "B_MRAP_01_F", "C_SUV_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Van_01_box_F", "C_Van_01_fuel_F", "I_MRAP_03_F", "B_G_Offroad_01_F", "B_G_Offroad_01_armed_F"]} //--- TODO: Config based solution
      ) then {
        if (vehicle player getVariable ["emergencyLights", false]) then {
          //--- OST
          titleText ["Emergency Lights Off", "PLAIN"];

          //--- Lights off
          [vehicle player, false] remoteExecCall ["GTA_fnc_vehicleEmergencyLights", -2];
        } else {
          //--- OST
          titleText ["Emergency Lights On", "PLAIN"];

          //--- Lights on
          [vehicle player, true] remoteExecCall ["GTA_fnc_vehicleEmergencyLights", -2];
        };
      };
    };
  };

  //--- Unlock (U)
  case 22: {
    if (!_alt && !_ctrl) then {
      private "_vehicle";
      if (vehicle player == player) then {
        _vehicle = [] call GTA_fnc_cursorTarget;
      } else {
        _vehicle = vehicle player;
      };

      if (_vehicle isKindOf "House_F" && playerSide == civilian) then {
        if (_vehicle in life_vehicles && player distance _vehicle < 8) then {
          _door = [_vehicle] call GTA_fnc_nearestDoor;
          if (_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
          _locked = _vehicle getVariable [format ["bis_disabled_Door_%1", _door], 0];

          if (_locked == 0) then {
            _vehicle setVariable[format ["bis_disabled_Door_%1", _door], 1,true];
            _vehicle animate [format ["door_%1_rot", _door], 0];
            systemChat localize "STR_House_Door_Lock";
            [[player, "key_jangling", 15], "life_fnc_playSound",true,false] call GTA_fnc_remoteExec;
          } else {
            _vehicle setVariable[format ["bis_disabled_Door_%1", _door], 0,true];
            _vehicle animate [format ["door_%1_rot", _door], 1];
            systemChat localize "STR_House_Door_Unlock";
            [[player, "key_jangling", 15], "life_fnc_playSound",true,false] call GTA_fnc_remoteExec;
          };
        };
      } else {
        if (_vehicle in life_vehicles && {[_vehicle, ["Car", "Air", "Ship", "Tank"]] call GTA_fnc_isKindOf} && {[player, _vehicle, 2] call GTA_fnc_boundingCollision}) then {
          if (locked _vehicle == 2) then {
            _vehicle lock 0;
            [[_vehicle, 0],  "lock", _vehicle, false] call GTA_fnc_remoteExec;
            [[player, "unlock", 15],  "life_fnc_playSound", true, false] call GTA_fnc_remoteExec;
            systemChat localize "STR_MISC_VehUnlock";
          } else {
            _vehicle lock 2;
            [[_vehicle, 2],  "lock", _vehicle, false] call GTA_fnc_remoteExec;
            [[player, "unlock", 15],  "life_fnc_playSound", true, false] call GTA_fnc_remoteExec;
            systemChat localize "STR_MISC_VehLock";
          };
        };
      };
    };
  };

  //--- Virtual inventory (P)
  case 25: {
    if (!_shift && !_ctrl && !dialog) then {
      //--- Open inventory
      [] call life_fnc_p_openMenu;
      _handled = true;
    };
  };

  //--- Radar (Numpad /)
  /*case 181: {
    if (playerSide == west) then {
      if (["GTA_RscSpeedRadar"] call GTA_fnc_hasDisplay) then {
        //--- Create radar
        ["GTA_RscSpeedRadar"] call GTA_fnc_destroyRscLayer;
      } else {
        //--- Condition to use
        if !((goggles player) in ["G_Tactical_Black", "G_Tactical_Clear"]) exitWith {hint "You need to be wearing tactical glasses to use the speed radar.";};
        if (dialog) exitWith {};

        //--- Destroy radar
        ["GTA_RscSpeedRadar"] call GTA_fnc_createRscLayer;
      };

      _handled = true;
    };
  };*/

  //--- Mute/unmute sound (Right Windows) (User Key 8)
  case (_userKeys select 7);
  case 220: {
    if (!_shift && !_ctrl && !_alt) then {
      GTA_soundMuted = !GTA_soundMuted;

      0 fadeSound ([1, ["Audio_EffectsMuted"] call GTA_fnc_getSetting] select GTA_soundMuted);
      0 fadeMusic ([1, ["Audio_MusicMuted"] call GTA_fnc_getSetting] select GTA_soundMuted);
      ["onToggleSound", [GTA_soundMuted]] call GTA_RscSoundStatus_script;
    };
  };

  //--- Suppress sound (App Menu) (User Key 9)
  case (_userKeys select 8);
  case 221: {
    if (!GTA_soundMuted && GTA_soundSuppressed /*&& !_shift && !_ctrl && !_alt*/) then {
      GTA_soundSuppressed = false;
      0 fadeSound 1;
      0 fadeMusic 1;
      ["onToggleSound", [false]] call GTA_RscSoundStatus_script;
    };
  };
};

_handled
