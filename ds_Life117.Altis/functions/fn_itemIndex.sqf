/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Returns index of selected item
*/

private["_item","_return"];

_item = _this select 0;
_return = 0;
{
	if((DS_masterItemArray select _forEachIndex) == _item)then
		{
		_return = _forEachIndex;
		};
}forEach DS_masterItemArray;

_return;