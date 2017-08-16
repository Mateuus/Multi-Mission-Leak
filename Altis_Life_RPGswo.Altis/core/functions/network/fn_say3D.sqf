private["_object","_sound"];
_object = param [0,ObjNull,[ObjNull]];
_sound = param [1,"",[""]];

if(isNull _object OR _sound == "") exitWith {};
_object say3D _sound;