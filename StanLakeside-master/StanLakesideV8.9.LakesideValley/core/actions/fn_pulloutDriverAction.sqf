/*
	File: fn_pulloutAction.sqf
	
	
	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];

driver (vehicle cursortarget) action["eject",vehicle cursortarget];