/*
	Datei: fn_loadoutLaden.sqf
	Autor: Basti | John Collins
	
	Beschreibung:
	Lädt das ausgewählte Loadout.
	
	This file was written for EastSide-Gaming.de
	Diese Datei wurde für EastSide-Gaming.de geschrieben.
	©2017 by Basti | John Collins
*/
disableSerialization;
_lb = ((findDisplay 3333) displayCtrl 1500);
_gear =  _lb lbData (lbCurSel _lb);
if (_gear isEqualTo "[]") exitWith {hint "Diser Slot ist noch nicht belegt!"};
_preis = ((ESG_loadout select (lbCurSel _lb)) select 2);
_action = [
			format ["Möchtest du wirklich dieses Loadout für %1$ laden ? <br/>Deine alte Ausrüstung wird gelöscht!", [_preis]call life_fnc_numberText],
			 "Loadout laden ?",
			 "Ja",
			 "Nein"
		] call BIS_fnc_guiMessage;
if(!_action) exitWith {closeDialog 0; hint "Aktion abgebrochen";};		
if(life_atmbank < _preis) exitWith {hint "Du hast nicht genug Geld auf deinem Bankkonto!"};
_gearL = ((ESG_loadout select (lbCurSel _lb)) select 0);
life_gear = _gearL;
[true] spawn life_fnc_loadGear;
life_atmbank = life_atmbank - _preis;
hint "Loadout erfolgreich geladen!";