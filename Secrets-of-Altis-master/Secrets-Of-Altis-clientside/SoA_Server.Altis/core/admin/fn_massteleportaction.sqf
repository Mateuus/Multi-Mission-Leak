/*
		fn_massteleportaction.sqf
		Author: G00golplexian
		
		Description: Action for massteleport.
*/
private["_pos","_name","_yes"];

_pos = _this select 0;
_name = _this select 1;

_yes = [
		format["%1 möchte dich zu ihm teleportieren!",_name],
		"Teleportation annehmen",
		"Ja",
		"Nein"
	] call BIS_fnc_guiMessage;

if (_yes) then {
	player setPos _pos;
};