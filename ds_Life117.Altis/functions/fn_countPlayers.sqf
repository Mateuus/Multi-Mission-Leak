/*
	File: fn_countPlayers.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Returns either a teams online numbers or checks if a team has enough players to perform an action
*/

private ["_number","_side","_bool","_players","_return"];

_pubs = 0;
_number = _this select 0;
_players = 0;
_return = false;

{
	if((side _x == west)&&(!(str(_x) in ["cop_1","cop_3","cop_4","cop_5"]))) then 
	{_players = _players + 1;}
} foreach playableUnits;

if(!(miscInfoArray select 7))then
	{
	_players = _players + 1;
	};
	
if(_players >= _number)then
	{
	_return = true;
	};
	
_return;
