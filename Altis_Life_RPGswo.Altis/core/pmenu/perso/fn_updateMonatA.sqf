/*
	Autor: Felix von Studsinske	
	Dateiname: fn_updateMonatA.sqf
	Beschreibung:
	Dient mit zur Überprüfung ob Schaltjahr
*/
if(playerside != civilian) exitWith {}; 
disableSerialization;
if(isNull (findDisplay 70000)) exitWith {hint "Fehler";};
_display = findDisplay 70000;
_lb_bdayTagList = _display displayCtrl 70008;
_lb_bdayMonatList = _display displayCtrl 70009;
lbClear _lb_bdayMonatList;
lbClear _lb_bdayTagList;
for "_bM" from 1 to 12 do
{
	_lb_bdayMonatList lbAdd format["%1",_bM];
	_lb_bdayMonatList lbSetValue [(lbSize _lb_bdayMonatList)-1,_bM];
};
lbSetCurSel [70009,0];
