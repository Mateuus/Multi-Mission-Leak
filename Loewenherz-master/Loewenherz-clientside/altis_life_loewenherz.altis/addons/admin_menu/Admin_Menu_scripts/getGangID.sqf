
testIndex  = _this select 1;
_thePlayer = _this select 2;

// foreach loop
{
	if (name _x == _thePlayer) then
	{ 
		gObJPlayer = _x;
		
	};
} foreach playableUnits;

closeDialog 0;
sleep 0.2;

[[gObJPlayer,player],"build_fnc_getGangID",false,false] call lhm_fnc_mp;

sleep 0.5;

gObJPlayer = nil;