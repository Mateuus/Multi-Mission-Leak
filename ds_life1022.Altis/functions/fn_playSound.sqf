/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Just plays a sound to all those nearby
*/

params [
	["_source",objNull,[objNull]],
	["_sound","",[""]],
	["_long",false,[false]]
];

if(_long)then {
	_source say3D [_sound,500,1];
} else {
	_source say3D _sound;
};