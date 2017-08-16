#include <macro.h>
private["_message"];
disableSerialization;
waitUntil {!isnull (findDisplay 9000)};
if ( argent_liquide < 2500 ) exitWith { systemChat "Vous devez avoir 2500€ pour envoyer un message !"; }; // Hint if person haves no 25000 dollar
if ( playerSide != civilian ) exitWith { systemChat "Vous devez etre un civil pour envoyer un message !"; }; // Hint if not civilian
if !( life_channel_send ) exitWith { systemChat "Attendez 10 minutes avant d'envoyer un nouveau message !"; }; //Gives Player the Hint to Wait 10 mins
argent_liquide = argent_liquide - 2500;
_message = ctrlText 9001;
[[3,format ["FLASH INFO DE %1 : %2",name player,_message]],"life_fnc_broadcast",true,false] call life_fnc_MP;
life_channel_send = false;
[] spawn
{
	uiSleep 600;
	life_channel_send = true;
};