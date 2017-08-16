/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_atm", objNull, [objNull]],
  ["_marker", true, [true]]
];

//--- Error checks
if (isNull _atm) exitWith {};

//--- Create marker
if (_marker) then {
  private _pos = ASLtoAGL getPosASL _atm;
  private _marker = createMarkerLocal [format ["atm_%1", _pos], _pos];
  _marker setMarkerTypeLocal "loc_Tourism";
  _marker setMarkerColorLocal "ColorGreen";
  _marker setMarkerTextLocal "ATM";
};

//--- Disable simulation and damage
_atm enableSimulation false;
_atm allowDamage false;

//--- Action
_atm addAction ["<t color='#ADFF2F'>ATM</t>", life_fnc_atmMenu, "", 0, false, false, "", "vehicle player == player && {player distance _target < 4}"];
_atm addAction ["<t color='#00EEEE'>Deposit Box</t>", {createDialog "GTA_DisplayDepositBox"}, "", 0, false, false, "", "vehicle player == player && {player distance _target < 4}"];
