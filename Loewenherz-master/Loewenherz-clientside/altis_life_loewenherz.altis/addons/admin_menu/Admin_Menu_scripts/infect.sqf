
_thePlayer = _this select 2;

// foreach loop
{
	if (name _x == _thePlayer) then
	{
		[{ [] spawn LHM_fsm_fnc_disease;  },"BIS_fnc_spawn", [_x], false] call LHM_fnc_MP;
	};
} foreach playableUnits;

