/*
	File: fn_playerCount.sqf
	
	
	Description:
	Retrieves the amount of players on per side specified.
*/
private["_faction"];
_faction = param [0,civilian,[independent]];

{side _x == _faction} count playableUnits;