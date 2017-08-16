/*
	Autor: Felix von Studsinske
	Dateiname: fn_updateHsnr.sqf
	Beschreibung:
	Aktualisiert die Liste der Hausnummer
*/
disableSerialization;
_display = findDisplay 60000;

_lb_plzStadtList = _display displayCtrl 60012;
_lb_Strasse = _display displayCtrl  60010;
_lb_Hausnr = _display displayCtrl 60011;

lbClear _lb_Hausnr;
_plz = call compile format ["%1",lbValue[60012,(lbCurSel 60012)]];
_hsnr = getArray(missionConfigFile >> "Personalausweis" >> "persoOrt" >> str(_plz) >> "str");
_hsnr = (_hsnr select (lbCurSel 60010)) select 1;
for "_i" from 0 to _hsnr do
{
	_lb_Hausnr lbAdd format["%1",_i];
	_lb_Hausnr lbSetValue[(lbSize _lb_Hausnr)-1,_i];
};
lbSetCurSel [60011,0];