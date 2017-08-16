#include <macro.h>
/*
	Author: Demigod
	
	Description:
	Purge Server Event setup. Sends a faction announcement, plays a sound file from an object
	and toggles a variable.
*/
private["_message"];
if(FETCH_CONST(life_adminlevel) < 2) exitWith {closeDialog 0; hint "You need to be an Admin to use this function.";};
//if(life_event) exitWith {closeDialog 0; hint "There is already a server event under-way.";};
//life_event = true;
_message = "This is not a test. This is your emergency broadcast system announcing the commencement of the Annual Purge sanctioned by the Takistan Government. If you do not want to participate, leave the city and run to the outskirts or stay in a small room inside your house. All Emergency Services must end their shift and go home.";[[_message,name player,6],"TON_fnc_clientMessage",true,false] spawn life_fnc_MP;
[[Tower1, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower2, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower3, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower4, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower5, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower6, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower7, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower8, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower9, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower10, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower11, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower12, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower13, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower14, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower15, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower16, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower17, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower18, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower19, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
sleep 70;
_message = "The Purge begins NOW! There will be messages sent out alerting you how long is left for the event. Fight or Hide, that is your choice.<br/><br/>Let the killing...<br/><br/><t size='2.5'><t color='#FF1500'>BEGIN!!</t></t>";[[_message,name player,6],"TON_fnc_clientMessage",civilian,false] spawn life_fnc_MP;
sleep 180;
sleep 180;
sleep 180; //For some reason, anything over 250 wouldn't work, so i split them up.
sleep 180;
sleep 180;
_message = "The Purge is Half way through! There is only 15 Minutes left!";[[_message,name player,6],"TON_fnc_clientMessage",civilian,false] spawn life_fnc_MP;
sleep 180;
sleep 180;
sleep 180;
sleep 180;
sleep 180;
_message = "The Purge will only last for another 5 Minutes!";[[_message,name player,6],"TON_fnc_clientMessage",civilian,false] spawn life_fnc_MP;
sleep 150;
sleep 150;
_message = "The Purge has now officially ended. Thank you for participating, we hope you enjoyed yourself and are cleansed. All Emergency services will now be active and all crime is illegal.<br/><br/><t size='2.5'><t color='#FF1500'>All Server Rules are now back into effect.</t></t>";[[_message,name player,6],"TON_fnc_clientMessage",civilian,false] spawn life_fnc_MP;//[[3,"STR_ISTR_Item_Alert",true,[profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
//life_event = false; 