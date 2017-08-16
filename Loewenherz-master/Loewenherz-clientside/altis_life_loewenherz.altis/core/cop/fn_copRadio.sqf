/*
file name: fn_say3D.sqf

Author: Blackd0g
Description : plays a local sound on each client with lhm_fnc_mp
*/
private ["_radios","_delay","_count"];
if(radiospamhorn) exitWith {};

_radios = ["cop_radio1","cop_radio2","cop_radio3"];
_delay = 24.7;
_count = 0;
antispamhorn = true;
playsound "switch";
titletext ["Polizeifunk AN","PLAIN"];

while {true} do
{
	if(!alive vehicle player || !antispamhorn || isNull vehicle player || vehicle player == player) exitWith {antispamhorn = false; radiospamhorn = false; playsound "switch"; titletext ["Polizeifunk AN","PLAIN"]; };
	if(_count > 3) then {_count = 0;};
	[[vehicle player,_radios select _count],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp;
	uisleep _delay;
	_count = _count + 1;
	if(!alive vehicle player || !antispamhorn || isNull vehicle player || vehicle player == player) exitWith {antispamhorn = false; radiospamhorn = false; playsound "switch"; titletext ["Polizeifunk AUS","PLAIN"]; };
	radiospamhorn = false;
	Uisleep 0.5;
};