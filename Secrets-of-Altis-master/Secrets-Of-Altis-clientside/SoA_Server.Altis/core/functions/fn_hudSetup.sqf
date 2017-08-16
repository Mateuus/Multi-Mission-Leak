/*
	File: fn_hudSetup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setups the hud for the player?
*/
private["_display","_alpha","_version","_p","_ui"];
disableSerialization;
2 cutRsc ["playerHUD","PLAIN",1];
[] call life_fnc_hudUpdate;