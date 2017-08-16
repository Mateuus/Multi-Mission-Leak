/*
	Autor: Felix von Studsinske
	Dateiname: fn_updateHsnrA.sqf
	Beschreibung:
	Aktualisiert die Liste der Hausnummer
*/
if(playerside != civilian) exitWith {}; 
disableSerialization;
_display = findDisplay 70000;

_lb_plzStadtList = _display displayCtrl 70013;
_lb_Strasse = _display displayCtrl  70011;
_lb_Hausnr = _display displayCtrl 70012;

lbClear _lb_Hausnr;
_plz = call compile format ["%1",lbValue[70013,(lbCurSel 70013)]];
_hsnr = getArray(missionConfigFile >> "Personalausweis" >> "persoOrt" >> str(_plz) >> "str");
_hsnr = (_hsnr select (lbCurSel 70011))select 1;
for "_i" from 0 to _hsnr do
{
	_lb_Hausnr lbAdd format["%1",_i];
	_lb_Hausnr lbSetValue[(lbSize _lb_Hausnr)-1,_i];
};
lbSetCurSel [70012,0];