private ["_amount","_cops"];

_amount = [_this,0,0,[0]] call BIS_fnc_param;

_cops = [];
{
	if (side _x == west && _x distance (getMarkerPos "Respawn_west") > 300) then { _cops pushBack _x };
} forEach allPlayers;

_amount = floor (_amount / (count _cops));

{
	BANK = BANK + _amount;
} forEach _cops;

[[0,format["All active police have received $%1 helping transport the gold.", [_amount] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn BIS_fnc_MP;