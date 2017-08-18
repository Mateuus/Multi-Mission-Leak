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

if ( life_cash < 2000 ) exitWith { systemChat "You need $2,000 to send a message !"; }; // Hint if person haves no 6000 dollar
if ( playerSide != civilian ) exitWith { systemChat "You must be a civilian to send a message !"; }; // Hint if not civilian
if !( life_channel_send ) exitWith { systemChat "Wait 10 minutes before you send a new message!"; }; //Gives Player the Hint to Wait 10 mins
life_cash = life_cash - 2000;

_message = ctrlText 9001;
[[2,format ["%1 sends this from Channel7 to all: %2",name player,_message]],"life_fnc_broadcast",true,false] call life_fnc_MP;

life_channel_send = false;

[] spawn
{
	sleep 600;
	life_channel_send = true;
};