/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Displays search results of a civilian
*/

private ["_civ","_action","_special"];

_civ = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_special = "";
if(_this select 2)then
	{
	_special = _special + "This person has illegal documents\n";
	};
if(_this select 3)then
	{
	_special = _special + "This person has stolen goldbars\n";
	};
if(_this select 4)then
	{
	_special = _special + "This person is drunk\n";
	};

hint format ["Search results for %1\n\n%2\n\n%3\n\nIf this person has anything illegal on them, they must either hand over the goods or be sent to jail to clear their inventory",(name _civ),(_this select 1),_special];