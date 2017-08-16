/*
	File: fn_howMuch.sqf
	Author: Firly | Division-Wolf.de
	
	Description:
	Öffnet ein GUI, fragt wie viel!
    Parameter 1: Frage
    Parameter 2: Function, an die Rückgabewert gesendet werden soll
    (Parameter 3: Function, an die Rückgabewert gesendet werden soll) -> standard 1
*/
disableSerialization;
private ["_frage","_zielfkt","_standardwert","_control"];

_frage = param [0,"",[""]];
_zielfkt = param [1,"",[""]];
_standardwert = param [2,"1",["1"]];

if(_zielfkt == "") exitWith { hint "Fehler beim aufrufen des Vertrags!" };



if(!(createDialog "DWEV_howmuch")) exitWith {hint "Abfrage konnte nicht geöffnet werden."};
ctrlSetText[26651,_frage];
ctrlSetText[26552,_standardwert];

_control = (findDisplay 2659) displayCtrl 507006;
_control ctrlSetEventHandler ["ButtonClick", format["[ctrlText((findDisplay 2659) displayCtrl 26552)] call %1; closeDialog 0;", _zielfkt]];