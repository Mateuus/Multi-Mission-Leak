private["_find","_limit","_select","_array","_return"];
_find = _this select 0;
_array = _this select 1;

_limit = (count _array)-1;
for "_i" from 0 to _limit do
{
	_select = _array select _i;
	if((_find in _select) && (isNil {_return})) then
	{
		_return = _i;
	};
};

if(isNil {_return}) then {_return = -1;};
_return;