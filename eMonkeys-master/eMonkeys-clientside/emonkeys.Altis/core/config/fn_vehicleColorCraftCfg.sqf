/*
	File: fn_vehicleColorCraftCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle weight.
*/
private["_newItem"];
_newItem = [_this,0,"",[""]] call BIS_fnc_param;

switch (_newItem) do
{
	case "C_Offroad_01_F": {23};
	case "C_SUV_01_F": {17};
	default {0};
};