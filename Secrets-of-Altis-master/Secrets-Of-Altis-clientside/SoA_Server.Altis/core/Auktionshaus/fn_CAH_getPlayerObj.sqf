_pid = _this select 0;
_obj = objNull;
_players = [];

{
	if (isPlayer _x) then
	{
		_players pushBackUnique [_x,getPlayerUID _x];
	};
} forEach playableUnits;

{
	if ((_x select 1) == _pid) exitWith {_obj = _x select 0;};
} forEach _players;

_obj;