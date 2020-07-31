/*
File: destroy evidence
*/
private["_curtarget","_unit"];

_curTarget = cursorTarget;

["Niszcze dowody..", false] spawn domsg;
titleFadeOut 3;
uiSleep 3;
hint "Usuniecie tego zajmie mi troche czasu.";
titleFadeOut 120;
_cme = 1;
_myposy = getPos player;

while {true} do {
	life_action_inUse = true;
	uiSleep 1;
	if( player distance _myposy > 5 ) exitwith { 
		hint "Za bardzo sie oddaliles. Kappa";
		life_action_inUse = false;
	};
	_cme = _cme + 1;

	if(_cme > 120) exitwith {
	life_action_inUse = false;
		deleteVehicle _curTarget;
		hint "Zniszczyles dowody";
	};
};
life_action_inUse = false;
