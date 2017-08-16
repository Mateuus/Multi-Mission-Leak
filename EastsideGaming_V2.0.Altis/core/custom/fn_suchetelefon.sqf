/*
	Datei: fn_suchtelefon.sqf
	Autor: Basti | John Collins
	
	Beschreibung:
	Suchfunktion für das Telefon.
	
	This file was written for EastSide-Gaming.de
	Diese Datei wurde für EastSide-Gaming.de geschrieben.
	Copyright © 2016 by Basti | John Collins
*/

disableSerialization;
_display = findDisplay 3000;
_listbox = _display displayCtrl 3004;
_edit = _display displayCtrl 1401;
_gesucht = ctrlText _edit;
_gesuchtespieler = [];
_sortiert = [];
lbClear _listbox;
{
	if([_gesucht,_x getVariable ["realname",name _x]]call bis_fnc_instring) then
	{
		if (alive _x && _x != player) then {
			_gesuchtespieler pushback _x;
		};
	};
}foreach playableUnits;

_sortiert = [_gesuchtespieler,[],{_x},"ASCEND"] call BIS_fnc_sortBy;
_listbox lbAdd "An die Polizei";
_listbox lbSetData [(lbSize _listbox)-1,"west"];
_listbox lbSetColor [(lbSize _listbox)-1, [0.259,0.655,0.957, 0.5]];
_listbox lbAdd "An die Feuerwehr";
_listbox lbSetData [(lbSize _listbox)-1,"independent"];
_listbox lbSetColor [(lbSize _listbox)-1, [0, 1, 0, 0.5]];
_listbox lbAdd "An die Admins";
_listbox lbSetData [(lbSize _listbox)-1,"anadmin"];
_listbox lbSetColor [(lbSize _listbox)-1, [1, 0, 0, 0.5]];
if((call life_adminlevel) > 1) then {
	_listbox lbAdd "Admin an Alle Spieler";
	_listbox lbSetData [(lbSize _listbox)-1,"analleadmin"];
	_listbox lbSetColor [(lbSize _listbox)-1, [1, 0, 0, 0.5]];
};
if((call life_coplevel) > 4) then {
	_listbox lbAdd "Polizeimeldung";
	_listbox lbSetData [(lbSize _listbox)-1,"copmeldung"];
	_listbox lbSetColor [(lbSize _listbox)-1, [0.259,0.655,0.957, 0.5]];
};
if((call life_mediclevel) > 4) then {
	_listbox lbAdd "Feuerwehr-Meldung";
	_listbox lbSetData [(lbSize _listbox)-1,"emsmeldung"];
	_listbox lbSetColor [(lbSize _listbox)-1, [0, 1, 0, 0.5]];
};
_listbox lbAdd "=========================";
_listbox lbSetData [(lbSize _listbox)-1,"strich"];
if(_sortiert isEqualTo []) exitWith
{
	_listbox lbadd "Kein Spieler gefunden.";
	_listbox lbSetData [(lbSize _listbox)-1,"KeinSpieler"];
};
{
	if (alive _x && _x != player) then {
        _type = switch (side _x) do {
			case west: {"Polizei"};
			case civilian: {"Zivilist"};
			case independent: {"Feuerwehr"};
		};
        _listbox lbAdd format ["%1 (%2)",_x getVariable ["realname",name _x],_type];
        _listbox lbSetData [(lbSize _listbox)-1,str(_x)];
    };
}foreach _sortiert;