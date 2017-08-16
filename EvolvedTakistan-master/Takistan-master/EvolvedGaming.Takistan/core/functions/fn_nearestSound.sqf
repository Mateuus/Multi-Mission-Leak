/*
	fn_nearestSound.sqf
*/

private ["_players","_receivedfrom","_soundtoplay","_vehicles"];

_receivedfrom = _this select 0;
_soundtoplay = _this select 1;

_players = _receivedfrom nearEntities [["Man"], 8];

[[_receivedfrom,_soundtoplay],"life_fnc_say3d",_players,false,true] call BIS_fnc_MP;


