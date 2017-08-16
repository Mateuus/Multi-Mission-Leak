/*
	File: fn_taxiRequest.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Notifies the taxi driver that someone has requested a taxi.
*/

if (!(18 in life_talents) && !(109 in life_talents)) exitWith {};

private["_caller","_callerName"];
_caller = _this;
if(isNull _caller) exitWith {}; //Bad data
_callerName = name _caller;

["TaxiRequest",[format["%1 requests taxi. Inform them if you're en-route.",_callerName]]] call BIS_fnc_showNotification;
[_callerName, getPos _caller, "Taxi Pickup"] spawn life_fnc_createMarker;