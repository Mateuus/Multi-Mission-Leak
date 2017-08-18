/*
	File: fn_sendChannel.sqf
*/

private["_message"];
disableSerialization;

waitUntil {!isnull (findDisplay 9000)};
if (!license_civ_news) exitWith{ systemChat "You are not a news anchor!"; }; // Hint if person haves no 6000 dollar
if ( life_cash < 10000) exitWith { systemChat "You need 6000$ to send a message!"; }; // Hint if person haves no 6000 dollar
if ( playerSide != civilian ) exitWith { systemChat "You need to be a civilian!"; }; // Hint if not civilian
if !( life_channel_send ) exitWith { systemChat "You have to wait 10 minutes before sending another message!"; }; //Gives Player the Hint to Wait 10 mins
life_cash = life_cash - 10000;

_message = ctrlText 9001;
[[4,format ["%1 sends this from Channel 1 to all: %2",name player,_message]],"life_fnc_broadcast",true,false] call life_fnc_MP;
life_channel_send = false;

[] spawn
{
	sleep 600;
	life_channel_send = true;
};