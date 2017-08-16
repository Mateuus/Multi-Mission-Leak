/*
	File: fn_sendChannel.sqf
	Author: alleskapot & Lifted
	Thanks again for all the help alleskapot!
	Description:
	Ermöglicht senden bzw. die Abfrage des Geschriebenen.

*/

private["_message"];
disableSerialization;

waitUntil {!isnull (findDisplay 9000)};


if ( EMonkeys_c164 < 6000 ) exitWith { systemChat "Du benötigst 6000€ um eine Nachricht zu senden!"; }; // Hint if person haves no 6000 dollar
if((["ap"] call EMonkeys_fnc_permLevel) < 1) exitWith {hint "Du bist kein Mitabrbeiter der Altis Presse!"; closeDialog 0;};
if !( eM_channel_send ) exitWith { systemChat "Warte 10 Minuten bevor du einen neue Nachricht sendest!"; }; //Gives Player the Hint to Wait 10 mins
EMonkeys_c164 = EMonkeys_c164 - 6000;

_message = ctrlText 9001;
[[3,format ["%1 : %2",name player,_message]],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_MP;
eM_channel_send = false;

[] spawn
{
	uisleep 600;
	eM_channel_send = true;
};
