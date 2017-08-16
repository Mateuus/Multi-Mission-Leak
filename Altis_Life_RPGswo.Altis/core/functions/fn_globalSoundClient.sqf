/*

	Global sound wrapper

*/

private["_source","_sound"];
_source = param [0,ObjNull,[ObjNull]];
_sound = param [1,""];

if(isNull _source) exitWith {};
if(_sound == "") exitWith {};

_source say3D _sound;