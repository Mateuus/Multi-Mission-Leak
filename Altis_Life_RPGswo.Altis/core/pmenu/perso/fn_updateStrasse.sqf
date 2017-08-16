/*
	Autor: Felix von Studsinske
	Dateiname: fn_updateStrasse.sqf
	Beschreibung:
	Aktualisiert die Liste der Strassen
*/
disableSerialization;
_display = findDisplay 60000;

_lb_plzStadtList = _display displayCtrl 60012;
_lb_Strasse = _display displayCtrl  60010;
_lb_Hausnr = _display displayCtrl 60011;
lbClear _lb_Strasse;
_plz = call compile format ["%1",lbValue[60012,(lbCurSel 60012)]];
_str = getArray(missionConfigFile >> "Personalausweis" >> "persoOrt" >> str(_plz) >> "str");

{
	_lb_Strasse lbAdd format["%1",_x select 0];
	_lb_Strasse lbSetData[(lbSize _lb_Strasse)-1,str(_x select 0)];
} forEach _str;
lbSetCurSel [60010,0];