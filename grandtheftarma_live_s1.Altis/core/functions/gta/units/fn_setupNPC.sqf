/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (isNil "_thisScript") exitWith {_this spawn (missionNamespace getVariable _fnc_scriptName)};
private ["_unit", "_uniform", "_textures", "_title", "_subtitle", "_icon"];
_unit = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
_uniform = [_this, 1, "", [""]] call GTA_fnc_param;
_textures = [_this, 2, [], [[]]] call GTA_fnc_param;
_title = [_this, 3, "", [""]] call GTA_fnc_param;
_subtitle = [_this, 4, "NPC", [""]] call GTA_fnc_param;
_icon = [_this, 5, "NPC", [""]] call GTA_fnc_param;

//--- Error checks
if (isNull _unit) exitWith {};
  //--- Disable damage and simulation
  _unit enableSimulation false;
  _unit allowDamage false;

  //--- Nametag
  if (_title != "") then {
    _unit setVariable ["nametag_title", _title];
    _unit setVariable ["nametag_subtitle", _subtitle];
    _unit setVariable ["nametag_icon", _icon];
  };

  if (_uniform != "") then {
    //--- Add uniform
    if (local _unit) then {
    _unit forceAddUniform _uniform;
  };

  //--- Wait
  waitUntil { uniform _unit == _uniform };
};

//--- Set textures
{
  _unit setObjectTexture [_forEachIndex, _x];
} forEach _textures;
