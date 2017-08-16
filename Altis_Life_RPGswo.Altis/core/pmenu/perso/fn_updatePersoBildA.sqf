/*
	Autor: Felix von Studsinske
	Dateiname: fn_updateStrasseA.sqf
	Beschreibung:
	Aktualisiert die Liste der Strassen
*/
if(playerside != civilian) exitWith {}; 
disableSerialization;
_display = findDisplay 70000;

_bild = _display displayCtrl 70017;
_bildID = call compile format ["%1",lbValue[70018,(lbCurSel 70018)]];
_pfad = getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> str(_bildID) >> "pfad");

_bild ctrlSetText format["%1",_pfad];