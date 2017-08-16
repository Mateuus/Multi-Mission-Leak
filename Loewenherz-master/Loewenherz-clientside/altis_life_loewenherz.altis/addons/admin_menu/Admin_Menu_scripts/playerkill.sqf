testIndex  = _this select 1;
_thePlayer = _this select 2;

// foreach loop
{
	if (name _x == _thePlayer) then
	{
		_x setDamage 1;
	};
} foreach playableUnits;

[["admin",(format["%1 with UID %2 killed %3",name player,getPlayerUID player,_thePlayer])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;