/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Is value a number
*/
private ["_value","_numbers","_return","_array","_valueStr"];

_value = _this select 0;
_return = true;
_valueStr = format ["%1",_value];
_numbers = ["0","1","2","3","4","5","6","7","8","9"];
_array = [_valueStr] call KRON_StrToArray;
{
	if(!(_x in _numbers))then
		{
		_return = false;
		};
}forEach _array;

_return;




