/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [["_safe", objNull, [objNull]], ["_bank", "", [""]], ["_vault", "", [""]]];

//--- Exit if null
if (isNull _safe) exitWith {};

if (isServer) then {
  //--- Disable cleanup
  _safe setVariable ["cleanup_ignore", true];
};

//--- Disable simulation and damage
_safe enableSimulation false;
_safe allowDamage false;
if (local _safe) then {
  _safe setDamage 1;
};

//--- Bank variables
_safe setVariable ["safe_bank", _bank];
_safe setVariable ["safe_vault", _vault];

if (hasInterface) then {
  //--- Action
  _safe addAction [
    "<t color='#ff0000'>[Bank]</t> Steal Money</t>",
    {_safe = _this select 0; [_safe, _safe getVariable ["safe_bank", ""], _safe getVariable ["safe_vault", ""]] call GTA_fnc_bankStealSafe},
    nil,
    0,
    true,
    true,
    "",
    "playerSide == civilian && {player distance _target < 4} && {isNull (_target getVariable [""safe_thief"", objNull])}"
  ];
};
