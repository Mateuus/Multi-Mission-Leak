/*
	Datei: fn_loadoutUpdateRequest.sqf
	Autor: Basti | John Collins
	
	Beschreibung:
	Sendet Update für Loadouts an den Server.
	
	This file was written for EastSide-Gaming.de
	Diese Datei wurde für EastSide-Gaming.de geschrieben.
	©2017 by Basti | John Collins
*/
private ["_packet","_array","_flag","_alive","_position"];
disableSerialization;

[] call life_fnc_saveGear;
_name = ctrlText ((findDisplay 3333) displayCtrl 1400);
if(_name isEqualTo "")exitWith {hint "Du musst einen Namen eingeben!"};
_lb = ((findDisplay 3333) displayCtrl 1500);
_loadout = lbCurSel _lb;
_preis = [] call ESG_fnc_getLoadoutPrice;

ESG_loadout set [_loadout,[life_gear,_name,_preis]];
hint "Loadout erfolgreich gespeichert!";
[8]call SOCK_fnc_updatePartial;
closeDialog 0;