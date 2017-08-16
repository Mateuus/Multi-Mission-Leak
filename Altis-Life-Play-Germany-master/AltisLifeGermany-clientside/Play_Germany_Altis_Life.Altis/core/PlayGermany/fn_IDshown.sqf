/*
	File : fn_showID.sqf
	Author: RafiQuak for PlayGermany
	Based on too much other stuff to list that here

	Description:
	Displays the "ID" with the given Message
*/
private["_message","_guy"];

_message = _this select 0;
_guy = _this select 1;
hint parseText _message;
PG_knownPersons pushBackUnique _guy;
_guy setVariable["undercover",([_this,2,false,[false]] call BIS_fnc_param)];