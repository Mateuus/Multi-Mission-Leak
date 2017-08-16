/*
Author: alleskapot

Description: Sends AAN News to the player

*/
private["_display","_message"];
disableSerialization;
_message = _this select 0;
[parseText format["<t size='2'>Channel 7 - Nachricht von: %1</t>",player getVariable["realname",name player]],parseText format["<t size='1.2'>%1 - %1 - %1</t>",_message]] spawn BIS_fnc_AAN;
sleep 30; //Time the News is shown
_display = uinamespace getvariable "BIS_AAN";
_display closeDisplay 0;