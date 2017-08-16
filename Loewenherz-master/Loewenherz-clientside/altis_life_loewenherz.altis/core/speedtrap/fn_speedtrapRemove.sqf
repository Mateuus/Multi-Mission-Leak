/*
	File: fn_speedtrapRemove.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	speedtrap is a speedtrap and sometimes a speedtrap
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/
private["_speedtrap"];

if(playerSide != west) exitWith {};

_speedtrap = cursorTarget;
if(isNull _speedtrap) exitwith {};

deleteVehicle _speedtrap;

[true,"LHM_Speedtrap",1] call lhm_fnc_handleInv;
