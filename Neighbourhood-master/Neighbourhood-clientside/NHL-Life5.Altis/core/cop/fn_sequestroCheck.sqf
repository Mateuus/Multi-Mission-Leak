/*
	File: fn_sequestroCheck.sqf
	Author: Al Morise (Sink)
	Description:
	Rimuove equipaggiamento illegale dalla unit
*/
private ["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (isNull _unit) exitWith {};

if (player distance _unit > 5 || !alive player || !alive _unit) exitWith {};
_action = [format ["Alle illegalen Gegenstände von %1 beschlagnahmen?",name _unit],"Bitte Bestätigen","Ja","Nein"] call BIS_fnc_guiMessage;
if(_action) then {
hint format["Illegale Gegenstände von %1 werden beschlagnahmt. Bitte warten....",name _unit];
[[player],"life_fnc_sequestra",_unit,false] spawn life_fnc_MP;
sleep 3;
hint "Illegale Gegenstände wurden beschlagnahmt.";
};