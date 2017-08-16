/*
	File: fn_acceptWar.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Accept a gang war challenge
*/

private ["_dialog", "_gang"];

disableSerialization;

_dialog = findDisplay 9580;
_gang = (lbData[9581,(lbCurSel 9581)]);

if (life_gang == "0") exitWith {};
if (!(_gang in life_gang_challenges)) exitWith {};

hint "Accepting war challenge...";
closeDialog 0;

[[life_gang,_gang,true],"ASY_fnc_updateWar",false,false] spawn life_fnc_MP;