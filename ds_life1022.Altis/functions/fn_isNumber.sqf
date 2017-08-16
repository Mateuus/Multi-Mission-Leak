/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Is value a number
*/

private ["_numbers","_array","_return"];

params [["_value","",[0,""]]];

if(_value isEqualType 0)then{_value = (_value toFixed 0);};

_numbers = ["0","1","2","3","4","5","6","7","8","9"];
_array = _value splitString "";
_return = true;

{
	if(!(_x in _numbers))exitWith {
		_return = false;
	};
} forEach _array;

_return;