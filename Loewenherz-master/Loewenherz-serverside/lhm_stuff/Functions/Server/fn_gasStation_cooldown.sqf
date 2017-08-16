/* 
 
Filename: fn_gasStation_cooldown.sqf 
 
Author: Blackd0g 
 
Description: Cooldown for Capturing! 
 
 
not much to see here....... 
*/ 
 
private ["_npc"]; 
_npc = param[0,objNull,[objNull]]; 
if(isnull _npc) exitWith {}; 
sleep (30 * 60); 
 
 
_npc setvariable["Cooldown",nil,true]; 
