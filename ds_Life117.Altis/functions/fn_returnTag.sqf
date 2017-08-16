/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Gets details and returns to the seeker.
*/


private ["_player","_side","_myGang","_myName","_bad","_wanted","_uid","_testUID"];

_player = [_this,0,ObjNull,[""]] call BIS_fnc_param;
_side = "";
_myGang = "";
if(playerside == west)then
	{
		_side = "(Officer)  ";
		_myGang = "";
	};
if(playerside == civilian)then
	{
	_myGang = (group player) getVariable ["gangName","No Gang"];
	_myGang = format ["(%1)",_myGang];
	};
_myName = player getVariable ["name","Unknown Person"];
[[_myName,_side,_myGang],"DS_fnc_getTag",_player,false] spawn DS_fnc_MP;