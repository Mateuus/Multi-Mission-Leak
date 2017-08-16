/*
Datei : fn_scheinEntzug.sqf
Ersteller : xnetsrac
Link : http://www.global-gamer.com/home/wbb/index.php/Thread/501-Tutorial-Per-Interaktionbutton-Fahrerlizenz-abnehmen-Polizei/
*/

private["_unit"];
_unit = _this select 0;

if(isNull _unit) exitWith {}; //Not valid

_action = [
	"Welche Lizenz soll entzogen werden?",
	"Lizenzentzug",
	"Führerschein",
	"Flugschein"
] call BIS_fnc_guiMessage;

if(_action) then {[_unit,0] remoteExecCall ["life_fnc_scheinEntzugNow",_unit]} else {[_unit,1] remoteExecCall ["life_fnc_scheinEntzugNow",_unit]};