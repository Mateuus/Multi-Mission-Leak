/*
	File: fn_speedtrapActivate.sqf
	Author: Wolfgang Bahmüller

	Description:
	speedtrap is a speedtrap and sometimes a speedtrap

    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!
*/



private["_speedtrap", "_status"];

_speedtrap = cursorTarget;
if(isNull _speedtrap) exitwith {};

_status = _speedtrap getVariable ["speedtrap_active", false];

if(_status) then
{
    _status = false;
    Hint "Radarfalle ist scharf!";
}
else
{
    _status = true;
    Hint "Radarfalle ausgeschaltet!";
};

_speedtrap setVariable ["speedtrap_active", _status, true];


