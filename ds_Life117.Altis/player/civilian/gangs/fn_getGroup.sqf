/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Returns the group name of the selected gang
*/

private ["_gangName","_groupObject"];

_gangName = _this select 0;
_groupObject = grpNull;
{
	if(_gangName == (_x select 1))then
		{
		_groupObject = _x select 0;
		};
}forEach DS_gangList;
_groupObject;

