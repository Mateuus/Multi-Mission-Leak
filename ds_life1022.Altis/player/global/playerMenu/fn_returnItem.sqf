/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Returns overflow when a a player could not hold all the items they were given
*/

private ["_value","_unit","_parsed","_held","_index","_myself","_weight","_difference","_overflow"];

_item = _this select 0;
_value = _this select 1;
_myself = _this select 2;
_unit = _this select 3;
if(_unit != player)exitwith{};//Opps? Target not found
[_item,true,_value] call DS_fnc_handleInventory;
hint format ["%1 was not able to carry all of the items, %2 was returned to your inventory",(name _myself),_value];