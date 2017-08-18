/*
	File: fn_adminUnrestrainAction.sqf
	by Kevin
	
	description: This file is executed client-side to unrestrain a player.
	Called by the admin unrestrain function.
*/
private["_unit"];

player setVariable["restrained",FALSE,TRUE];
player setVariable["Escorting",FALSE,TRUE];
player setVariable["transporting",FALSE,TRUE];
player setVariable["zipTie",FALSE,TRUE];