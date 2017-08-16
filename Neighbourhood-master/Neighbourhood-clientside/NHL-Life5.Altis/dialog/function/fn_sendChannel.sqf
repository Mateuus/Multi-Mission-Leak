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

if ( life_cash < 50000 ) exitWith { systemChat "Du benötigst 50.000€ um eine Nachricht zu senden!"; }; // Hint if person haves no 6000 dollar
if ( playerSide != civilian ) exitWith { systemChat "Du musst Zivilist sein um einen Nachricht zu senden!"; }; // Hint if not civilian
if !( life_channel_send ) exitWith { systemChat "Warte 10 Minuten bevor du einen neue Nachricht sendest!"; }; //Gives Player the Hint to Wait 10 mins
life_cash = life_cash - 50000;


_message = ctrlText 9001;
[[3,format ["%1 hat die Nachricht über Channel 7 News an alle: %2",name player,_message]],"life_fnc_broadcast",true,false] call life_fnc_MP;
life_channel_send = false;

[] spawn
{
sleep 600;
life_channel_send = true;
};