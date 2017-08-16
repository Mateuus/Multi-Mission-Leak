/*
	File: fn_storageSell.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Sell the storage container and everything in it.
*/

private["_item", "_house", "_owners", "_uid", "_maxCount", "_count", "_handle"];

_item = [_this,0,objNull,[objNull]] call BIS_fnc_param;

_house = _item getVariable ["house", objNull];
if (!(_house in life_houses)) exitWith { hint "You do not own this crate and thus cannot destroy it!"; };

_handle = ["<t align='center'>Are you sure you want to destroy this storage container? Everything inside will be lost!</t>"] spawn life_fnc_confirmMenu;
waitUntil {scriptDone _handle};
if(!life_confirm_response) exitWith {};

[[_item, player],"ASY_fnc_removeStorage",false,false] spawn life_fnc_MP;
[[451, player, format["Sold storage in house %1", [_house] call life_fnc_getBuildID]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;