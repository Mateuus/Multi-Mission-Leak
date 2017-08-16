// sets the vehicle color
// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private ["_vehicle", "_colorIndex", "_color", "_config"];

if( !params [
    [ "_vehicle", objNull, [objNull] ],
    [ "_colorIndex", -1, [0] ]
  ]) exitWith {
  format [ "<CERROR> %1 (%2) called vehicleColor wrong : %3", profileName, getPlayerUID player, _this ] remoteExec ["XY_fnc_log", 2];
};

_config = [typeOf _vehicle, _colorIndex] call XY_fnc_colorConfig;

if( _config isEqualTo [] ) exitWith {};

{
    _vehicle setObjectTextureGlobal[ _forEachIndex, _x ];
} forEach (_config select 2);