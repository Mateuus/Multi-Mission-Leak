testIndex  = _this select 1;
_thePlayer = _this select 2;

// foreach loop
{
	if (name _x == _thePlayer) then
	{
	cutText ["","BLACK OUT"]; ["serverkick",false,0] call LHM_fnc_endMission;
	//disableUserInput true;
	_x enableSimulation false;
	0 fadeSound 0;
	0 fadeMusic 0;
	for '_i' from 0 to 100 do {(findDisplay _i) closeDisplay 0;};
	};
} foreach playableUnits;

[["admin",(format["%1 with UID %2 kicked %3 from the Server",name player,getPlayerUID player,name _thePlayer])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;