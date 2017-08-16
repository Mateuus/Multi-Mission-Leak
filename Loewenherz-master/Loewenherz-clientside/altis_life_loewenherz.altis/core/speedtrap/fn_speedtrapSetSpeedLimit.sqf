/*
	File: fn_speedtrapSetSpeedLimit.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	speedtrap is a speedtrap and sometimes a speedtrap
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/



private["_speedtrap","_speedlimit","_speedlimit_text","_display","_var_laptop","_value_laptop"];
disableSerialization;

_speedtrap = cursorTarget;
if(isNull _speedtrap) exitwith {};

//_var_laptop = ["laptop",0] call lhm_fnc_varHandle;
//_value_laptop = missionNamespace getVariable _var_laptop;
//if(_value_laptop <= 0) exitWith {titleText["Du brauchst einen Laptop","PLAIN"];};

_speedlimit = _speedtrap getVariable["speedtrap_speedlimit", 30];

createDialog "king_speedtrap";
_display = findDisplay 8000;
_speedlimit_text = _display displayCtrl 8001;
_speedlimit_text ctrlSetText str(_speedlimit); 
