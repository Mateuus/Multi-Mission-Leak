/*
	File: fn_extinguishJoint.sqf
	Author: Mario
	
	Description:
	Extinguish the Joint of yourself or and Opponent.
*/

private["_unit"];

if(player getVariable ["smoke_weed",false]) then
{
	player setVariable["smoke_weed",false,true];
} else {
	_unit = cursorObject;
	if(isNull _unit) exitWith {}; //Not valid
	if(!(_unit getVariable ["smoke_weed",false])) exitWith {};
	if(side _unit == west) exitWith {};
	if(player == _unit) exitWith {};
	if(!isPlayer _unit) exitWith {};
	_unit setVariable["smoke_weed",false,true];
};