private ["_exit"];

params [
	["_source",objNull,[objNull]],
	["_sound","",[""]],
	["_long",false,[false]]
];

private ["_exit"];

_exit = false;

if(_exit)exitWith{};

if(_long)then {
	_source say3D [_sound,500,1];
} else {
	if(player distance _source > 100)exitWith{};
	_source say3D _sound;
};