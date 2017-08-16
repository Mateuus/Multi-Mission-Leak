/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Tells an admin everytime a large value of money is picked up
*/

private ["_player","_value","_str"];

if((DS_adminLevel < 1)||(!((getPlayerUID player) in DS_adminList1)))exitWith{};
if(!alive player)exitWith{};

_player = _this select 0;
_value = _this select 1;

_str = parseText format ["<t color='#0101DF' size='1.5'><br/>Admin Alert<br/><br/>Money Pick up</t><br/><br/>%1 has just picked up $%2",_player,[_value] call DS_fnc_numberText];
hint _str;