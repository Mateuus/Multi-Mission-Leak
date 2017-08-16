#include "..\..\macros.hpp"
/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
_crew = crew cursorTarget;

if (((side player) == west) || (__GETC__(DWEV_adminlevel) > 2)) then   //ab A
{
	{
		[] remoteExec ["DWEV_fnc_pulloutVeh", _x];
		false;
	} count _crew;
}
else
{

	//rausziehen geht nicht in safezones für Zivilisten
	if(call DWEV_fnc_isSafeZone) exitWith {hint "In einer absoluten Safezone kannst du keine Leute aus dem Fahrzeug ziehen!!!"};
	{
		[] remoteExec ["DWEV_fnc_pulloutVeh", _x];
		false;
	} count _crew;
};