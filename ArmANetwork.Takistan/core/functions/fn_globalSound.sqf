params [
	["_source",ObjNull,[ObjNull]],
	["_sound",""]
];

if(isNull _source) exitWith {};
if(_sound == "") exitWith {};
[_source,_sound] remoteExecCall ["life_fnc_globalSoundClient",-2];