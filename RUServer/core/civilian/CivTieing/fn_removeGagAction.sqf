/*
    File: fn_removeGagAction.sqf
    Author: Lowheartrate & Panda
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {};
if(!(_unit getVariable "gagged")) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
_unit setVariable["gagged",false,true];