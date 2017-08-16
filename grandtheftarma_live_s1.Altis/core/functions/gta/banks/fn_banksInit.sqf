/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (!isServer) exitWith {};

//--- Configs
{
  private ["_bank", "_name", "_location", "_bankMarker"];
  _bank = configName _x;
  _name = getText (_x >> "name");
  _location = getArray (_x >> "location");

  //--- Format name
  _name = [_bank] call GTA_fnc_bankName;

  //--- Create marker
  _bankMarker = createMarker [format ["bank_%1", _bank], _location];
  _bankMarker setMarkerType "loc_Tourism";
  _bankMarker setMarkerColor "ColorBlue";
  _bankMarker setMarkerText _name;

  //--- Vaults
  {
    private ["_vault", "_position", "_doors", "_building", "_vaultMarker"];
    _vault = configName _x;
    _position = getArray (_x >> "position");
    _doors = getArray (_x >> "doors");
    _building = getText (_x >> "building");
    _vaultMarker = getNumber (_x >> "marker");

    //--- Get nearest building
    _building = nearestObject [_position, _building];

    //--- Set variables
    _building setVariable ["bank", _bank, true];
    _building setVariable ["bankVault", _vault, true];

    //--- Disable damage
    _building allowDamage false;
    _building enableSimulation false;

    //--- Lock doors
    {
      _building setVariable [format ["BIS_disabled_door_%1", _x], 1, true];
    } forEach _doors;

    //--- Create marker
    if (_vaultMarker > 0) then {
      _vaultMarker = createMarker [format ["bank_%1_%2", _bank, _vault], position _building];
      _vaultMarker setMarkerType "mil_triangle";
      _vaultMarker setMarkerColor "ColorBlue";
      _vaultMarker setMarkerAlpha 0.5;
    };
  } forEach configProperties [_x >> "Vaults", "true"];
} foreach configProperties [missionConfigFile >> "GTA_CfgBanks", "true"];
