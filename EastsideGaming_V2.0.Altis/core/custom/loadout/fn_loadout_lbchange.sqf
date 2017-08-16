/*
	Datei: fn_loadout_lbchange.sqf
	Autor: Basti | John Collins
	
	Beschreibung:
	LB Eventhandler.
	
	This file was written for EastSide-Gaming.de
	Diese Datei wurde für EastSide-Gaming.de geschrieben.
	©2017 by Basti | John Collins
*/
disableSerialization;
_lb = ((findDisplay 3333) displayCtrl 1500);
_name = ((findDisplay 3333) displayCtrl 1400);
_preis = ((findDisplay 3333) displayCtrl 1404);
_name ctrlsettext format ["%1",((ESG_loadout select (lbCursel _lb)) select 1)];
_preis ctrlsettext format ["Preis: %1$",if(((ESG_loadout select (lbCursel _lb)) select 1) != "Nicht belegt") then {((ESG_loadout select (lbCursel _lb)) select 2)}else{"-/-"}];
if(life_atmbank < ((ESG_loadout select (lbCursel _lb)) select 2)) then {
	_preis ctrlSetTextColor [1,0,0,1];
};