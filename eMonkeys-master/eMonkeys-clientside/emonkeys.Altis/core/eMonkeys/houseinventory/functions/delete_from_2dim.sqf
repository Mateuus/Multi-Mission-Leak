//Function zum löschen aus dem 2 Dim Array mit unterschiedlichen Geararten
//Parameter [das 2 Dim Array mit dem Gear,Integer (0-Laenge 2Dim Array -1),Array mit zu löschendem Gear]
//WICHTIG  Die Arrays sollten alle nur ein und den selben Datentyp enthalten (z.B String)
private ["_type_of_gear","_helper","_gear_Array","_delete"];
_gear_array = _this select 0;
_type_of_gear = _this select 1;
_delete =_this select 2;
_helper = (_gear_array select _type_of_gear);
//Herauslöschen der übergebenen Arrays. Geht nicht mit "-" Operator, da Duplikate gleich mit entfernt werden
{
	for [{_y = 0},{_y < count _helper},{_y = _y+1}] do {
		if (_helper select _y == _x) exitWith {_helper set [_y,"deleteThis"]};
	};
} foreach _delete;
_helper = _helper - ["deleteThis"];
//Löschen beendet
_gear_array set[ _type_of_gear ,_helper];
_gear_array;