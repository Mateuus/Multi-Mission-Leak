/*
	File: fn_spawnPointSelected.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sorts out the spawn point selected and does a map zoom.
	
	
	Modified for Taxi use by MarkusSR1984
*/
disableSerialization;
private["_control","_selection","_spCfg","_sp"];
_control = param [0,controlNull,[controlNull]];
_selection = param [1,0,[0]];

_spCfg = [(side player)] call DWEV_fnc_taxiPointCfg;
_sp = _spCfg select _selection;


	if (typeName (_sp select 0) == "ARRAY") then 
	{
		[((findDisplay 38600) displayCtrl 38602),1,0.1,(_sp select 0)] call DWEV_fnc_setMapPosition;
	}
	else
	{
		[((findDisplay 38600) displayCtrl 38602),1,0.1,getMarkerPos (_sp select 0)] call DWEV_fnc_setMapPosition;	
	};

DWEV_taxi_point = _sp;

ctrlSetText[38601,format["%2: %1",_sp select 1,"Aktuelles Reiseziel"]];