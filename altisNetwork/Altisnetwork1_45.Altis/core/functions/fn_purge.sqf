#include "..\..\script_macros.hpp"
/*	
Author: Demigod
Edit by AmaZiinG for 4.4 R3		
Description:	Purge Server Event setup. Sends a faction announcement, 
plays a sound file from an object	and toggles a variable.
*/
private["_message"];
if(FETCH_CONST(life_adminlevel) < 5) exitWith {closeDialog 0; 
hint "You need to be an Admin to use this function.";};//
if(life_event) exitWith {closeDialog 0; hint "There is already a server event under-way.";};//
life_event = true;
_message = "This is not a test. This is your emergency broadcast system announcing the commencement of the Annual Purge sanctioned by the Government. If you do not want to participate, leave the city and run to the outskirts or stay in a small room inside your house. All Emergency Services must end their shift and go home.";
[_message,name player,6] remoteExec ["TON_fnc_clientMessage",0];
[Tower1, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower2, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower3, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower4, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower5, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower6, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower7, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower8, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower9, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower10, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower11, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower12, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower13, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower14, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower15, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower16, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower17, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower18, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower19, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower20, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower21, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower22, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower23, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower24, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower25, "purge",5000] remoteExec ["life_fnc_playSound",0];
[Tower26, "purge",5000] remoteExec ["life_fnc_playSound",0];
sleep 70;
_message = "The Purge begins NOW! There will be messages sent out alerting you how long is left for the event. Fight or Hide, that is your choice.<br/><br/>Let the killing...<br/><br/><t size='2.5'><t color='#FF1500'>BEGIN!!</t></t>";
[_message,name player,6] remoteExec ["TON_fnc_clientMessage",civilian];
[_message,name player,6] remoteExec ["TON_fnc_clientMessage",west];
sleep 180;
sleep 180;
sleep 180; 
//For some reason, anything over 250 wouldn't work, so i split them up.
sleep 180;
sleep 180;
_message = "The Purge is Half way through! There is only 15 Minutes left!";
[_message,name player,6] remoteExec ["TON_fnc_clientMessage",civilian];
[_message,name player,6] remoteExec ["TON_fnc_clientMessage",west];
sleep 180;
sleep 180;
sleep 180;
sleep 180;
sleep 180;
_message = "The Purge will only last for another 5 Minutes!";
[_message,name player,6] remoteExec ["TON_fnc_clientMessage",civilian];
[_message,name player,6] remoteExec ["TON_fnc_clientMessage",west];
sleep 150;
sleep 150;
_message = "The Purge has now officially ended. Thank you for participating, we hope you enjoyed yourself and are cleansed. All Emergency services will now be active and all crime is illegal.<br/><br/><t size='2.5'><t color='#FF1500'>All Server Rules are now back into effect.</t></t>";
[_message,name player,6] remoteExec ["TON_fnc_clientMessage",civilian];
[_message,name player,6] remoteExec ["TON_fnc_clientMessage",west];
[3,"STR_ISTR_Item_Alert",true,[profileName]] remoteExec ["life_fnc_broadcast",0];
life_event = false; 
