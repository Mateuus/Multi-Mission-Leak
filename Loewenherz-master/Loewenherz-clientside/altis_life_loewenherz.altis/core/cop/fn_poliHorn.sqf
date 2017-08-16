/*
	
	@file Version: 1.a
	
	@file name: radio.sqf
	
	@file Author: xXthexXmasterXx

	@file edit: 10/25/2013

	@description: Handles radio sounds for vehicles
*/

if(radiospamhorn) exitWith {};
_sound = floor ( random (count music3));
_song = (music3 select _sound) select 0;
_delay = (music3 select _sound) select 1;

antispamhorn = true;
playsound "switch";


while {true} do
{
	if(!alive vehicle player || !antispamhorn || isNull vehicle player || vehicle player == player) exitWith {antispamhorn = false; radiospamhorn = false; playsound "switch"; titletext ["Polizeisirene AN","PLAIN"]; };
	[[vehicle player,_song],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp;
	radiospamhorn = true;
	sleep _delay;
	if(!alive vehicle player || !antispamhorn || isNull vehicle player || vehicle player == player) exitWith {antispamhorn = false; radiospamhorn = false; playsound "switch"; titletext ["Polizeisirene AUS","PLAIN"]; };
	radiospamhorn = false;
	sleep 2;
};