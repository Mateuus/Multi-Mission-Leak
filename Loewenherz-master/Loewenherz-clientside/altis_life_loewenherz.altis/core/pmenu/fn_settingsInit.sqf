/*
	File: fn_settingsInit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes key parts for the Settings menu for View distance and other stuff.
*/
tawvd_foot = viewDistance;
tawvd_car = viewDistance;
tawvd_air = viewDistance;
tawvd_addon_disable = true;

// LHM START
tawvd_auto = true;

[] spawn
{
	private["_recorded"];
	while {true} do
	{	
		_recorded = vehicle player;
		[] call lhm_fnc_updateViewDistance;
		waitUntil {sleep 2; _recorded != vehicle player || !alive player || tawvd_auto};
	};
};
// LHM START