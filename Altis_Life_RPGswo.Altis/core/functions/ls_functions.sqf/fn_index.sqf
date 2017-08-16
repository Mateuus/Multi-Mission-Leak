private["_find","_limit","_select","_array","_return"];
_find = (_this select 0);
_array = (_this select 1);

diag_log format ["[DWEV_fnc_Index] try to find index %1",_this];

_limit = (count _array)-1;
_exit = false;
for "_i" from 0 to _limit do
{
	_select = _array select _i;
	if ((typeName _select) == "ARRAY") then
	{
		if((_find in _select) && (isNil {_return})) then
		{
			_return = _i;
			_exit = true;
		};
	};
	if (_exit) exitWith {};
};
if(isNil {_return}) then {_return = -1;};
_return;