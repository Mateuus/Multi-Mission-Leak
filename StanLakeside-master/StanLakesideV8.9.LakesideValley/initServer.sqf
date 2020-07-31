/*
	File: initServer.sqf
	
	Description:
	Starts the initialization of the server.
*/

if(!(_this select 0)) exitWith {}; //Not server
[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
[] call compile PreprocessFileLineNumbers "\life_server\initA3L.sqf";
master_group attachTo[bank_obj,[0,0,0]];
carSalesmanList = [];
publicVariable "carSalesmanList";
onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";
setTimeMultiplier 24;
setDate [2035,12,8,5,15]