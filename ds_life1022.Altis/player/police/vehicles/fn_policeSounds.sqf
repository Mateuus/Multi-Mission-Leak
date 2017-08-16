/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Plays sounds from police officers and their vehicles
*/

private ["_targets"];

params ["_key"];

if((isNull objectParent player)||(!(driver (vehicle player) isEqualTo player)))exitWith{};
if(isNil "DS_yelp")then{DS_yelp = false};
if(DS_yelp)exitWith{};

switch(_key)do {
	case 1: {
		_targets = allPlayers select {(_x distance player) < 500};
		[(vehicle player),"yelp",true] remoteExecCall ["DS_fnc_playSounds",_targets];
	};
	case 2: {
		_targets = allPlayers select {(_x distance player) < 500};
		[(vehicle player),"pullOver",true] remoteExecCall ["DS_fnc_playSounds",_targets];
	};
	case 3: {
		_targets = allPlayers select {(_x distance player) < 500};
		[(vehicle player),"policeSound1",true] remoteExecCall ["DS_fnc_playSounds",_targets];
	};
};

DS_yelp = true;
if(((DS_infoArray select 19) > 35)&&(player getVariable ["security",false]))then {
	sleep 10;
} else {
	sleep 20;
};
DS_yelp = false;