params [
	["_source",ObjNull,[ObjNull]],
	["_sound",""]
];

if(isNull _source) exitWith {};
if(_sound == "") exitWith {};
_source say3D _sound;