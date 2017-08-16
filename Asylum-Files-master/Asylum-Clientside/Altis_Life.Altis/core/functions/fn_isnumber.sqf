private["_valid","_value","_compare"];
_value = _this select 0;
_valid = ["0","1","2","3","4","5","6","7","8","9"];
_array = [_value] call KRON_StrToArray;
_return = true;

{
	if(_x in _valid) then	
	{}
	else
	{
		_return = false;
	};
} foreach _array;
_return;