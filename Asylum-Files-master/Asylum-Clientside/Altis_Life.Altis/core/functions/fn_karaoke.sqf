/*
	File: fn_karaoke.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Begins some awesomeness.
*/

_song = [_this,3,"",[""]] call BIS_fnc_param;

if (_song == "") exitWith {};
if (life_karaoke != "") exitWith {hint "There's already a song playing. Be patient!"};

life_karaoke = _song;
publicVariable "life_karaoke";

hint "Playing selected karaoke song. Good luck!";
[[player,_song],"ASY_fnc_startKaraoke",false,false] spawn life_fnc_MP;