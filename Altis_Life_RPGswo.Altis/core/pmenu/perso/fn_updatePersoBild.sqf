/*
	Autor: Felix von Studsinske
	Dateiname: fn_updateStrasse.sqf
	Beschreibung:
	Aktualisiert die Liste der Strassen
*/
disableSerialization;
_display = findDisplay 60000;

_bild = _display displayCtrl 60016;
_bildID = call compile format ["%1",lbValue[60017,(lbCurSel 60017)]];
_pfad = getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> str(_bildID) >> "pfad");

_bild ctrlSetText format["%1",_pfad];