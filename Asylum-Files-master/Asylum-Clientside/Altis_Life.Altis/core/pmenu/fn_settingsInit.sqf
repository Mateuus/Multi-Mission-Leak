/*
	File: fn_settingsInit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes key parts for the Settings menu for View distance and other stuff.
*/
tawvd_foot = (profileNamespace getVariable["AsylumSettings",[1200,1200,1200,true,false]]) select 0;
tawvd_car = (profileNamespace getVariable["AsylumSettings",[1200,1200,1200,true,false]]) select 1;
tawvd_air = (profileNamespace getVariable["AsylumSettings",[1200,1200,1600,true,false]]) select 2;
tawvd_addon_disable = true;
//The hacky method... Apparently if you stall (sleep or waitUntil) with CfgFunctions you stall the mission initialization process... Good job BIS, why wouldn't you spawn it via preInit or postInit?
[] spawn
{
	private["_recorded"];
	while {true} do
	{
		_recorded = vehicle player;
		[] call life_fnc_updateViewDistance;
		waitUntil {sleep 5; (_recorded != vehicle player || !alive player)};
	};
};