/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#define CURRENT_DAMAGE ([player getHitIndex _hitPartIndex, damage player] select (_hitPartIndex < 0));

params ["_unit", "_selectionName", "_damage", "_source", "_projectile", "_hitPartIndex"];

//--- Exit if incapacitated
if (_unit getVariable ["incapacitated", false]) exitWith {};

//--- Record combat tick
GTA_combat_lastTick = diag_tickTime;

if (!isNull _source) then {
  //--- Hit by vehicle
  if (isPlayer _source && {_projectile == ""} && {vehicle _source isKindOf "LandVehicle"}) exitWith {
    _damage = CURRENT_DAMAGE;
  };

  //--- Source is not self
  if (_source != _unit) then {
    //--- Taser
    if (_projectile in ["B_9x21_Ball", "B_45ACP_Ball"] && {currentWeapon _source in ["hgun_P07_snds_F", "hgun_Pistol_heavy_01_snds_F"]}) then {
      //--- Disable damage
      _damage = CURRENT_DAMAGE;

      //--- Distance check
      if (_selectionName != "" && {_unit distance _source < 50}) then {
        //--- Is not currently tased
        if(!(player getVariable ["tased", false]) && {!(_unit getVariable ["restrained", false])}) then {
          //--- Tase
          [_unit, true] spawn GTA_fnc_tase;
        };
      };
    };

    //--- Rubber bullets
    if (_projectile == "B_9x21_Ball" && {_damage > 0} && {currentWeapon _source == "SMG_02_ACO_F"}) then {
      //--- Disable damage
      _damage = CURRENT_DAMAGE;

      //--- Determine fatigue
      private _fatigue = (switch _selectionName do {
        case "pelvis";
        case "spine1";
        case "spine2";
        case "spine3";
        case "body": {0.2};

        case "head";
        case "face_hub";
        case "neck": {1};

        case "arms";
        case "legs": {0.1};

        case "hands": {0.05};

        default {0};
      });

      //--- Set fatigue
      _fatigue = getFatigue player + _fatigue;
      player setFatigue _fatigue;

      //--- Eject from certain vehicles & knock down
      if (!(player getVariable ["tased", false]) && {_fatigue >= 0.95}) then {
        //--- Knock down
        [_unit, false] spawn GTA_fnc_tase;
      };
    };
  };
};

_damage
