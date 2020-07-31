/*
	File: fn_civpulloutAction.sqf

	Pulls all players from a vehicle
*/
private["_crew"];
_crew = crew cursorTarget;

_randycunt = 3;
_num = 1;
_myposy = getPos player;
while {_randycunt > _num} do {
_randycunt = _randycunt - 1;
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
uiSleep 0.5;
};
if( _unit distance _myposy > 7 ) then { 
		["Cel znajduje sie za daleko!", false] spawn domsg;
} else {
	_x setVariable ["transporting", nil, true]; 
	_x setVariable ["Escorting", nil, true];
	[_x] remoteExecCall ["life_fnc_pulloutVeh",_x];
} foreach _crew;