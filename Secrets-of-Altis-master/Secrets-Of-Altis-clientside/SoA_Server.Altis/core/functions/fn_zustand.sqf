/*

	fn_zustand.sqf
	Author: G00golplexian
	
	Description: Sets the status of a player.
*/

_zustand = _this select 0;

life_zustand = _zustand;
[] call life_fnc_hudUpdate;