/*
	File: fn_playerCount.sqf
	Author: Bryan "Tonic" Boardwine
	modified by Silex 29.07
 
	Description:
	Retrieves the amount of players on per side specified.
 
	//0 = MEDIC
	//1 = sicherheit
	//2 = COPS
	//3 = CIVS
*/
private["_type","_count"];
_type = param [0,-1,[0]];
_count = 0;
 
 
 
switch(_type) do
{	
	case 0:
	{
		_count = ({alive _x && side _x == independent} count playableUnits);
	};
	
	//sicherheit
	case 1:
	{
		_count = ({alive _x && side _x == east} count playableUnits);
	};
	
	//polizei
	case 2:
	{
		_count = ({alive _x && side _x == west} count playableUnits);
	};
	//civilian
	case 3:
	{
		_count = ({alive _x && side _x == civilian} count playableUnits);
	};
};
 
_count;