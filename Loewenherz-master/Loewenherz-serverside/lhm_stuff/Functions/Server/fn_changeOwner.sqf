/* 
Filename: fn_changeOwner.sqf 
 
Author: Blackd0g 
 
Description: change object owner to player 
*/ 
private ["_object","_unit"]; 
_object = _this select 0; 
_unit = _this select 1; 
 
if (isNull _object) exitWith {}; 
if (isNull _unit) exitWith {}; 
 
_object setOwner (owner _unit); 
 
diag_log format ["SERVER: Change Owner for '%1' to %2",_object,(name _unit)];