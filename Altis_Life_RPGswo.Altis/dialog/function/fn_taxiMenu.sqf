/*
	ORIGINAL:
	File: fn_spawnMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	MODIFIED:
	File: fn_taxiMenu.sqf
	Autor: MarkusSR1984
	
	
	Description:
	Öffnet und Konfiguriert das Taxi Menu zur Zielauswahl
	
	
	
	
	
*/
private["_spCfg","_sp","_ctrl"];
disableSerialization;



if(!(createDialog "DWEV_taxi_ziel")) exitWith {[] call DWEV_fnc_taxiMenu;};
(findDisplay 38600) displaySetEventHandler ["keyDown","_this call DWEV_fnc_displayHandler"];

_spCfg = [(side player)] call DWEV_fnc_taxiPointCfg;

_ctrl = ((findDisplay 38600) displayCtrl 38610);
{
	_ctrl lnbAddRow[(_spCfg select _ForEachIndex) select 1,(_spCfg select _ForEachIndex) select 0,""];
	_ctrl lnbSetPicture[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 2];
	_ctrl lnbSetData[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 0];
} foreach _spCfg;

_sp = _spCfg select 0; //First option is set by default

[((findDisplay 38600) displayCtrl 38602),1,0.1,getMarkerPos (_sp select 0)] call DWEV_fnc_setMapPosition;
DWEV_taxi_point = _sp;

ctrlSetText[38601,format["%2: %1",_sp select 1,"Aktuelles Reiseziel"]];