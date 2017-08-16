/*
	Datei: fn_telefonswitch.sqf
	Autor: Basti | John Collins
	
	Beschreibung:
	Leitet die Listboxdata in Funktionen um.
	
	This file was written for EastSide-Gaming.de
	Diese Datei wurde für EastSide-Gaming.de geschrieben.
	Copyright © 2016 by Basti | John Collins
*/

disableSerialization;
_display = findDisplay 3000;
_listbox = _display displayCtrl 3004;
_data = _listbox lbData (lbCurSel _listbox);
if ((_data isEqualTo "KeinSpieler") || ((lbCurSel _listbox) isEqualTo -1))exitWith {hint "Du musst einen richtigen Spieler auswählen!"};
switch(_data) do 
{
	case "west": {
		[] call TON_fnc_cell_textcop;
	};
	
	case "independent": {
		[] call TON_fnc_cell_emsrequest
	};
	
	case "anadmin": {
		[] call TON_fnc_cell_textadmin;
	};
	
	case "strich": {
		hint "Bitte wähle eine richtige Person aus.";
	};
	
	case "analleadmin": {
		[] call TON_fnc_cell_adminmsgall;
	};
	
	case "copmeldung": {
		[] call TON_fnc_cell_copmeldung;
	};
	
	case "emsmeldung": {
		[] call TON_fnc_cell_emsmeldung;
	};
	
	default {
		[] call TON_fnc_cell_textmsg;
	};
};