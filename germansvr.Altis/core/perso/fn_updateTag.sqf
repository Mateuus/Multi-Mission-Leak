/*
	Autor: Felix von Studsinske
	Dateiname: fn_updateTag.sqf	
	Beschreibung:
		Überprüft, ob das ausgewählte Jahr ein Schaltjahr ist und gibt dementsprechend nur x-viele Tage zur Verfügung.
*/

disableSerialization;
if(isNull (findDisplay 60000)) exitWith {hint "Fehler";};
_display = findDisplay 60000;
_lb_bdayTagList = _display displayCtrl 60008;
lbClear _lb_bdayTagList;
_sel = call compile format["%1",(lbValue[60010,(lbCurSel 60010)])];
_sel_M = call compile format["%1",(lbValue[60009,(lbCurSel 60009)])];
_check = if (_sel mod 4 == 0) then // Rest == 0
{
    if (_sel mod 100 == 0) then // Rest == 0
    {
		if (_sel mod 400 == 0) then // Rest == 0
		{
			true;
		} 
		else
		{
			false;
		};
	}
	else
	{
        false;
    };
} 
else
{
    false;
};
_tage = switch (_sel_M) do
{
	case 1: {31};
	case 2: {28};
	case 3: {31};
	case 4: {30};
	case 5: {31};
	case 6: {30};
	case 7: {31};
	case 8: {31};
	case 9: {30};
	case 10: {31};
	case 11: {30};
	case 12: {31};
};
if(_check && (_sel_M == 2)) then {
	_tage = _tage + 1;
};
_tage = _tage;
for "_bT" from 1 to _tage do
{
	_lb_bdayTagList lbAdd format["%1",_bT];
	_lb_bdayTagList lbSetValue [(lbSize _lb_bdayTagList)-1,_bT];
};
lbSetCurSel [60008,0];