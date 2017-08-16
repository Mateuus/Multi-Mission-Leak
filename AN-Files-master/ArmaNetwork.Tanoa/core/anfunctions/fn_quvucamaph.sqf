params [
  ["_source",objNull,[objNull]],
  ["_sound","",[""]],
  ["_distance",0,[0]]
];
if(isNull _object OR {_sound isEqualTo ""}) exitWith {};
if(player distance _source > _distance) exitWith {};
_source say3D _sound;
