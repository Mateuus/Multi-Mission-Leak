/*
File: destroy evidence
*/
private["_curtarget","_unit"];

_curTarget = cursorTarget;

["Niszcze dowody..", false] spawn domsg;
titleFadeOut 3;
uiSleep 3;
["Posprzatanie tego zajmie mi kilka minut bez miotly", false] spawn domsg;
titleFadeOut 120;
_cme = 1;
_myposy = getPos player;

while {true} do {
	life_action_inUse = true;
	uiSleep 1;
	if( player distance _myposy > 5 ) exitwith { 
		["Za bardzo sie oddalilem - nie zniszczylem dowodow", false] spawn domsg;
		life_action_inUse = false;
	};
	_cme = _cme + 1;

	if(_cme > 120) exitwith {
	life_action_inUse = false;
		deleteVehicle _curTarget;
		["Zniszczylem dowody..", false] spawn domsg;
	};
};
life_action_inUse = false;
