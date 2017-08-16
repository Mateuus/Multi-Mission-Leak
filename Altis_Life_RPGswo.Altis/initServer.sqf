/*
	File: initServer.sqf
	
	Description:
	Starts the initialization of the server.
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call DWEV_fnc_MPexec};
if(!(_this select 0)) exitWith {}; //Not server
[] call compile PreprocessFileLineNumbers "\DWEV_server\init.sqf";

if (worldName == "Altis") then
{
	master_group attachTo[bank_obj,[0,0,0]];
};


[8,true,12] execFSM "core\fsm\timeModule.fsm";