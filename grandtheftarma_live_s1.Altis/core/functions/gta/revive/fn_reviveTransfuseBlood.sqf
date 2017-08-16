/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {};

//--- Transfuse action
if ([30, "Transfusing Blood", nil, {!isNull _this && {"FirstAidKit" in items player} && {player distance _this <= 3} && {alive _this}}, _unit] call GTA_fnc_action) then {
  //--- Fatigue and damage the player
  player setFatigue 1;
  player setDamage (getDammage player + 0.35);

  //--- Consume first aid kit
  player removeItem "FirstAidKit";

  //--- "Transfuse"
  _unit setVariable ["GTA_revive_bleedStart", time, true];
  _unit setVariable ["GTA_revive_damage", 0, true];
};
