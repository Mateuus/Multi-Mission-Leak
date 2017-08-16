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


if (ES_cash <= 6000 ) exitWith { systemChat "You need 60000€ for writing a message"; };
if (playerSide != civilian ) exitWith { systemChat "You have to be a civilian"; };
ES_cash = ES_cash - 60000;


_message = ctrlText 9001;


[[3,format ["%1 sends the following message to all: %2",name player,_message]],"ES_fnc_broadcast",true,false] call ES_fnc_MP;
ES_channel_send = false;


[] spawn
{
    sleep 600;
    ES_channel_send = true;