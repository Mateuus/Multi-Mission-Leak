private["_source","_sound","_distance"];
_source = [_this,0] call BIS_fnc_param;
_sound = [_this,1,"",[""]] call BIS_fnc_param;
_distance = [_this,2] call BIS_fnc_param;

if (typeName _source isEqualTo typeName [] AND typeName _distance != typeName []) exitWith {};
if (typeName _source != typeName [] AND typeName _distance isEqualTo typeName []) exitWith {};

if (typeName _source isEqualTo typeName [] AND typeName _distance isEqualTo typeName []) exitWith {
  if (count _source != count _distance) exitWith {};
  {
    [_x, _sound, _distance select _forEachIndex] call life_fnc_playSound;
  } forEach _source;
};

if (player distance _source > _distance) exitWith {};

_source say3D _sound;
