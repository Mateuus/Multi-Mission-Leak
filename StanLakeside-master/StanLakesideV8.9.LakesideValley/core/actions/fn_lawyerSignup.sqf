/*
lawyer sign up
koils a fuck
*/
private["_unit"];
_unit = player;
_myposy = getPos player;
if(life_signedIn) exitWith {
	["You are already signed in as a lawyer.", false] spawn domsg;
};

_nearestPlayer = nearestObjects[getPosATL _unit,["man"],3] select 1; 

if(player getVariable ["restrained", false]) exitWith {};
if(isNil "_nearestPlayer") exitwith {["You need a Police Officer standing next to you to sign up.", false] spawn domsg;};
_cm = 1;
if ( side _nearestPlayer == west && side player != west) then {
	[0,format["%1 just signed up for bonus Government Payments.",name player]] remoteExecCall ["life_fnc_broadcast", _nearestPlayer];
	life_signedIn = true;
	while{life_signedIn} do {
		uiSleep 1;
		_cm = _cm + 1;
		if(_cm == 300) then {
			_cm = 1;
			["cash","add",1950] call life_fnc_handleCash;
			["You just got paid 1950 for Government Work", false] spawn domsg;
		};
		if( player distance _myposy > 100 ) exitwith {
			["Your Government Payments have stopped.", false] spawn domsg;
			life_signedIn = false;
		};
		if (deadPlayer) exitWith {
			life_signedIn = false;
		};
	};

} else {
	["You need a Police Officer standing next to you to sign up.", false] spawn domsg;	
};
