/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	returns the total weight of the item in question
*/

private["_item","_value","_weight"];

_item = [_this,0,"",[""]] call BIS_fnc_param; 
_value = [_this,1,0,[0]] call BIS_fnc_param; 
_weight = 0;

switch(_item)do
	{
	case "DS_item_heroinu": {_weight = 6};
	};
	
_weight = (_weight*_value);

_weight;