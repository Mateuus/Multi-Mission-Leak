/*
	File: fn_marktQuery.sqf
	Author: MarkusSR1984
	
	Description:
	Fragt die aktuellen Marktwerte ab und Zeigt sie im Dialog an
*/
private["_display","_text","_info","_prim","_sec","_vest","_uni","_bp","_attach","_tmp"];
disableSerialization;
_display = findDisplay 4000;
_text = _display displayCtrl 4003;
_info = lbData[4002,lbCurSel (4002)];
//_info = call compile format["%1", _info];
_text ctrlSetText "Marktwert abfragen...";

_index = [_info,sell_array] call DWF_fnc_index;

_index2 = [_info,market_array] call DWF_fnc_index;


if ( _index == _index2 ) then
{
	_diff_string = "";
	_diff = (((sell_array) select _index) select 1) - (((market_array) select _index) select 2);
	if (_diff >= 0) then {_diff_string = format ["+%1",_diff];} else {_diff_string = format ["%1",_diff];};

	_type = "";
	if (((market_array select _index) select 7) < 3) then {_type = "Legal";} else {_type = "Illegal";};

	_text ctrlSetStructuredText parseText format["%1<br/><br/>Aktueller Wert: %2<br/>Seit Restart: %3<br/><br/>Type: %4<br/>Gewicht: %5",
	(((market_array) select _index) select 9), 	// %1 = Name
	(((sell_array) select _index) select 1), 	// %2 = Aktueller Wert
	_diff_string, 								// %3 = Veränderung seit Restart
	_type, 										// %4 = Type Legal / Illegal
	(((market_array) select _index) select 12) // %5 = Gewicht
	];


}
else
{
	_text ctrlSetText "Es ist ein Fehler aufgetreten. Dieser Wert kann zur zeit nicht abgefragt werden";
};

