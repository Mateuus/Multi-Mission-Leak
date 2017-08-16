/*
	File: fn_paroleAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the parole process.
*/
private["_unit"];
_unit = cursorTarget;
disableSerialization;
if(isNull _unit OR !isPlayer _unit) exitwith {};
//ctrlSetText[2651,format["Offering parole to %1...",name _unit]];
_unit spawn {
	_handle = [format["Do you wish to offer parole to %1?",name _this]] spawn life_fnc_confirmMenu;
	waitUntil {scriptDone _handle};
	if(!life_confirm_response) exitWith {};
	[[player],"life_fnc_parole",_this,false] spawn life_fnc_MP;
};