/*
	File: initServer.sqf
	
	Description:
	Starts the initialization of the server.
	 
*/
if(!(_this select 0)) exitWith {}; //Not server

[] call compile PreprocessFileLineNumbers "\DS_server\init.sqf";
onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";
DS_copLevel = 7;
DS_clanBase7 = ["76561197992718808"];//TF
DS_markerArray = [];
publicVariable "DS_markerArray";
relics4_3_2 setVectorUp [0,5,0];
DS_lastPostPlaying = false;
publicVariable "DS_lastPostPlaying";
