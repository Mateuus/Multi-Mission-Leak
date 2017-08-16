/*
	File: fn_ch7Broadcast.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Display UI to send a message server wide
*/

if ((time - life_last_broadcast) < 2700) exitWith { hint "A broadcast was sent within the last 45 minutes.  Try again later."; };
if (life_atmmoney < 30000) exitWith { hint "You do not have $30,000 in your bank to send a broadcast."};
createDialog "life_broadcast_menu";