#include "..\..\script_macros.hpp"
private["_strafliste","_valueindex","_bericht","_officer","_display","_Btn1","_Btn2"];
disableSerialization;

_strafliste = straftat GVAR [life_computergesucht,[]];
_display = findDisplay 6000;

_valueindex = lbValue[6012,(lbCurSel 6012)];
_bericht = "";
_officer = "";

{
	if (_x select 0 == _valueindex) exitwith 
	{
		_array = _x select 1;	
		_bericht = _array select 3 select 0;
		_officer = _array select 4 select 0;
	};
} foreach _strafliste;


_Btn1 = _display displayCtrl 6010;
_Btn1 ctrlEnable true;
_Btn2 = _display displayCtrl 6014;
_Btn2 ctrlEnable true;


CONTROL(6000,6006) ctrlSetStructuredText parseText format ["<t font='EtelkaNarrowMediumPro' size='0.7'>Bericht verfasst von: %1<br/><br/>%2</t>",_officer,_bericht];
	