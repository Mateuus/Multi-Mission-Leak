/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

switch playerSide do {
	case civilian: {
    //--- Fishing net
    life_actions = [player addAction [localize "STR_pAct_DropFishingNet", life_fnc_dropFishingNet, "", 0, false,false, "", '
    (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];

    //--- Rob
    player addAction [
    "Rob Person",
    life_fnc_robAction,
    "",
    0,
    false,
    false,
    "",
    "
      isPlayer cursorObject
      && {player distance cursorObject < 3.5}
      && {animationState cursorObject in [""incapacitated"", ""amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon""] || {group player == cursorObject getVariable [""restrained_group"", grpNull]}}
    "];
  };
};

//--- "Click" event
player addAction ["", {
  params ["_unit"];
  private _weapon = currentWeapon _unit;

  //--- Get fire mode sound
  private _sound = getArray (configFile >> "CfgWeapons" >> _weapon >> "changeFiremodeSound");

  //--- Exit if no sound data
  if (_sound isEqualTo []) exitWith {};

  //--- Explode sound data
  _sound params ["_filename", ["_volume", 1], ["_soundPitch", 1], ["_distance", 5]];

  //--- Exit if no sound file
  if (_filename == "") exitWith {};

  //--- Add file extension .wss as default
  if !(toLower (_filename select [count _filename - 4]) in [".wav", ".ogg", ".wss"]) then {
    _filename = format ["%1.wss", _filename];
  };

  //--- Get right hand position
  private _position = AGLToASL (_unit modelToWorldVisual (_unit selectionPosition "RightHand"));

  playSound3D [_filename, objNull, false, _position, _volume, _soundPitch, _distance];
}, "", 0, false, true, "DefaultAction", "(!isNil ""GTA_disableFire"" && {GTA_disableFire}) || {_target getVariable [""restrained"", false]} || {_target getVariable [""tased"", false]}"];
