/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns if there are equal to more cops on than the given amount
*/

private ["_number","_players","_return"];

_number = _this select 0;
_players = 0;
_return = false;

_players = {(isPlayer _x)&&((side _x) isEqualTo west)&&(!(_x getVariable ["pubCop",false]))} count allPlayers;
if(!(miscInfoArray select 7))then{_players = _players + 1;};
if(_players >= _number)then{_return = true;};

_return;