/*
	File: initServer.sqf
	
	Description:
	Starts the initialization of the server.
*/
if(!(_this select 0)) exitWith {}; //Not server
[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
[] spawn life_fnc_marketStart;
execVM "\hst_life_phone\init.sqf";
execVM "\hst_life_core\init.sqf";