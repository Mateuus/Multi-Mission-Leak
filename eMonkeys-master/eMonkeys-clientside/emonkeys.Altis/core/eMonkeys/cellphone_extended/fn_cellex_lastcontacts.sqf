/*
	Funktion für die Anzeige der letzten 5 Nachrichten die dem Spieler gesendet wurden.
*/
private ["_from","_array","_index0","_index1","_index2","_index3","_index4"];

_from = "";
_array = [];
_from = CPE_Last_Message;
_array = CPE_Last_Contacts;

if (_from in _array) exitWith {};
_array = _array + [_from];

if (count _array >= 5) then
	{
		_index0 = _array select 0;
		_index1 = _array select 1;
		_index2 = _array select 2;
		_index3 = _array select 3;
		_index4 = _array select 4;

		_index4 = _index3;
		_index3 = _index2;
		_index2 = _index1;
		_index1 = _index0;
		_index0 = _from;

		_array = [_index0,_index1,_index2,_index3,_index4];
	};

CPE_Last_Contacts = _array;