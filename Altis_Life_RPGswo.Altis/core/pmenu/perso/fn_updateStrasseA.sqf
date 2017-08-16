/*
	Autor: Felix von Studsinske
	Dateiname: fn_updateStrasseA.sqf
	Beschreibung:
	Aktualisiert die Liste der Strassen
*/
if(playerside != civilian) exitWith {}; 
disableSerialization;
_display = findDisplay 70000;

_lb_plzStadtList = _display displayCtrl 70013;
_lb_Strasse = _display displayCtrl  70011;
_lb_Hausnr = _display displayCtrl 70012;
lbClear _lb_Strasse;
_plz = call compile format ["%1",lbValue[70013,(lbCurSel 70013)]];
_str = getArray(missionConfigFile >> "Personalausweis" >> "persoOrt" >> str(_plz) >> "str");

{
	_lb_Strasse lbAdd format["%1",_x select 0];
	_lb_Strasse lbSetData[(lbSize _lb_Strasse)-1,str(_x select 0)];
} forEach _str;
lbSetCurSel [70011,0];