/*
File: destroy evidence
*/
private["_curtarget","_unit"];

_curTarget = cursorTarget;

["Destroying Evidence..",5,"blue"] call RPG_Fnc_Msg;
titleFadeOut 3;
uiSleep 3;
["This will take a couple of minutes to clean up.",5,"blue"] call RPG_Fnc_Msg;
titleFadeOut 120;
_cme = 1;
_myposy = getPos player;

while {true} do {
	life_action_inUse = true;
	uiSleep 1;
	if( player distance _myposy > 5 ) exitwith { 
		["You moved to far - the evidence was not destroyed.",5,"gray"] call RPG_Fnc_Msg;
		life_action_inUse = false;
	};
	_cme = _cme + 1;

	if(_cme > 120) exitwith {
	life_action_inUse = false;
		deleteVehicle _curTarget;
		["You have destroyed the evidence..",5,"blue"] call RPG_Fnc_Msg;
	};
};
life_action_inUse = false;
