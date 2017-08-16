testIndex  = _this select 1;
_thePlayer = _this select 2;



// foreach loop
{
	if (name _x == _thePlayer) then
	{
		_thePos = getPosASL _x;
		player setPosASL [(_thePos select 0) + 1, _thePos select 1, _thePos select 2];
	};
} foreach playableUnits;

[["admin",(format["%1 with UID %2 ported Player (%3) to him",name player,getPlayerUID player,_thePlayer])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;