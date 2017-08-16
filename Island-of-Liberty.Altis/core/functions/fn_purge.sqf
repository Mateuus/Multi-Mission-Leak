#include "..\..\script_macros.hpp"
/*
	Author: Demigod
	
	Description:
	Purge Server Event setup. Sends a faction announcement, plays a sound file from an object
	and toggles a variable.
*/
private["_message"];
if(FETCH_CONST(life_adminlevel) < 2) exitWith {closeDialog 0; hint "Du musst ein Admin mit dem entsprechenden Rang haben um dies zu starten.";};
//life_event = true;
_message = "Dies ist kein Test. Dies ist Ihr Notfalluebertragungs System, hat denn Beginn des Events Seuberung durch die Regierung sanktioniert angekündigt. Wenn Sie nicht teilnehmen wollen , gehen Sie in ein Haus irgendwo am Ufer und bleiben Sie während dem Event in der hintersten kleinsten Ecke bis dass Event beendet ist. Alle Notdienste müssen ihre Einsätze beenden und in ihre Haupquartiere gehen.";[[_message,name player,7],"TON_fnc_clientMessage",true,false] spawn life_fnc_MP;
[objNull,"purge"] call life_fnc_globalSound;
/*[[Tower1, "purge",5000],"life_fnc_globalSoundClient",true,false] spawn life_fnc_MP;

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
[[Tower20, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
*/
sleep 70;
_message = "Die Seuberung hat begonnen! Die Regierung hat ab jetzt jegliche Rechte aufgehoben entweder versteck dich und sei ein Feigling oder Kaempfe wie ein harter Rebelle das ist deine Wahl.<br/><br/>Toeten oder Sterben...<br/><br/><t size='2.5'><t color='#FF1500'>BEGIN!!</t></t>";[[_message,name player,7],"TON_fnc_clientMessage",civilian,false] spawn life_fnc_MP;
sleep 180;
sleep 180;
sleep 180; //For some reason, anything over 250 wouldn't work, so i split them up.
sleep 180;
sleep 180;
_message = "Die Saeuberung ist auf halbem weg durch! Es geht noch 15 Minuten";[[_message,name player,7],"TON_fnc_clientMessage",civilian,false] spawn life_fnc_MP;
sleep 180;
sleep 180;
sleep 180;
sleep 180;
sleep 180;
_message = "Die Seuberung dauert noch 5 Minuten!";[[_message,name player,7],"TON_fnc_clientMessage",civilian,false] spawn life_fnc_MP;
sleep 150;
sleep 150;
_message = "Die Seuberung ist Offiziel beendet. Vielen Dank für eure teilnahme, Wir hoffen Sie hatten sich selbst und andere gereinigt. Alle Notfalldienste werden wieder zu Ihrem Dienst antretten und gehen ihren Pflichten nach.<br/><br/><t size='2.5'><t color='#FF1500'>Alle Server Regeln sind nun wieder in Kraft.</t></t>";[[_message,name player,7],"TON_fnc_clientMessage",civilian,false] spawn life_fnc_MP;//[[3,"STR_ISTR_Item_Alert",true,[profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
//life_event = false; 