/*
    File: initServer.sqf
    Author:

    Description:
    Starts the initialization of the server.
*/
if (!(_this select 0)) exitWith {}; //Not server
[] call compile preprocessFileLineNumbers "\life_server\init.sqf";
[] call compile PreprocessFileLineNumbers "\life_server\initMSG.sqf";
[] spawn (compile PreprocessFileLineNumbers "core\jip.sqf");