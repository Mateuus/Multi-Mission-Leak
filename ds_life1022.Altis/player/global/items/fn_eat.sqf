/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Eating
*/

private ["_item","_chance","_foodValue","_targets"];

_item = _this select 0;
_chance = 0;

switch(_item)do {
	case "tbacon": {
		_foodValue = 100;
	};
	case "pie": {
		_foodValue = 80;
	};
	case "burger": {
		_foodValue = 80;
	};
	case "doritos": {
		_foodValue = 60;
	};
	case "chips": {
		_foodValue = 60;
	};
	case "turtle": {
		_foodValue = 100;
	};
	case "tuna": {
		_foodValue = 100;
	};
	case "catshark": {
		_foodValue = 100;
	};
	default {
		_foodValue = 50;
	};
};

_foodValue = _foodValue + DS_hunger;
if(_foodValue > 100)then {
	_foodValue = 100;
};

_player = player;

if((random 6) > 3)then {
	_targets = allPlayers select {(_x distance player) < 50};
	[player,"eat"] remoteExecCall ["DS_fnc_playSounds",_targets];
} else {
	player say3D "eat";
};

_chance = random 100;

if((_chance > 50)&&(_item != "tbacon"))then {
	[]spawn {
		sleep (random 600) + 60;
		_type = round random 4;
		_player = player;
		if(_type == 0)then {
			if((random 6) > 3)then {
				_targets = allPlayers select {(_x distance player) < 50};
				[player,"fart1"] remoteExecCall ["DS_fnc_playSounds",_targets];
			} else {
				player say3D "fart1";
			};
		} else {
			if(_type < 3)then {
				if((random 6) > 3)then {
					_targets = allPlayers select {(_x distance player) < 50};
					[player,"fart2"] remoteExecCall ["DS_fnc_playSounds",_targets];
				} else {
					player say3D "fart2";
				};
			} else {
				if((random 6) > 3)then {
					_targets = allPlayers select {(_x distance player) < 50};
					[player,"fart3"] remoteExecCall ["DS_fnc_playSounds",_targets];
				} else {
					player say3D "fart3";
				};
			};
		};
	};
};

if((DS_infoArray select 13) > 43)then {
	DS_thirst = DS_thirst + (_foodValue/4);
	if(DS_thirst > 100)then {DS_thirst = 100};
};

DS_hunger = _foodValue;
[] call DS_fnc_updateHud;