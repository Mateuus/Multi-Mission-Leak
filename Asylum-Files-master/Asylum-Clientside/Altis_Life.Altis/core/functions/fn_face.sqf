/*
	File: fn_face.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Set facial expression.
*/

_unit = _this select 0;
_msg = _this select 1;

_mimics = [
	["normal",""],
	["dead", "dead"],
	["danger", "danger"],
	["hurt", "hurt"],
	["aware", "aware"],
	["safe", "safe"],
	["combat", "combat"]
];

_message = [_msg, 3] call aniChatEvents_substr;
if ((_message call aniChatEvents_strlen) > 0) then
{
	_index = [_message,_mimics] call life_fnc_index;
	if (_index < 0) exitWith {};
	_anim = (_mimics select _index) select 1;
	[[player,_anim,"mimic"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
}
else
{
	_anims = "Valid facial expressions are: ";
	{ _anims = _anims + (_x select 0); if ((_forEachIndex + 1) < (count _mimics)) then { _anims = _anims + ", "; }; } forEach _mimics;
	_anims = _anims + ".";
	systemChat _anims;
};