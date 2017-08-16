private["_find","_limit","_select","_array","_return"];
_find = _this select 0;
_array = _this select 1;

if!(_array isEqualType []) exitWith {};
_limit = (count _array)-1;
for "_i" from 0 to _limit do
{
  _select = _array select _i;
  if!(_select isEqualType []) exitWith {diag_log format ["fnc_index _find: %1 , _select: %2 is no array", _find ,_select]};
  if((_find in _select) && (isNil {_return})) then
  {
    _return = _i;
  };
};

if(isNil {_return}) then {_return = -1;};
_return;
