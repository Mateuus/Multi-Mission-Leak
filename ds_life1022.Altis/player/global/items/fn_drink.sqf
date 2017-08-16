/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Drinking
*/

private ["_item","_chance","_targets"];

_item = _this select 0;
_chance = 0;

DS_thirst = 100;
[]call DS_fnc_updateHud;
_player = player;

if(((DS_infoArray select 13) == 45)&&(_item isEqualTo "water")&&(((getPos player) select 2) > 4999)) then { [0] call DS_fnc_questCompleted };
if((random 6) > 3)then {
	_targets = allPlayers select {(_x distance player) < 50};
	[player,"drink"] remoteExecCall ["DS_fnc_playSounds",_targets];
} else {
	player say3D "drink";
};
if(_item != "water")then {
	_chance = random 100;
};
[] call DS_fnc_stamina;

if(_chance > 50)then {
	[] spawn {
		sleep (random 600) + 60;
		_type = round random 4;
		_player = player;
		if(_type == 0)then {
			if((random 6) > 3)then {
				_targets = allPlayers select {(_x distance player) < 50};
				[player,"Burp1"] remoteExecCall ["DS_fnc_playSounds",_targets];
			} else {
				player say3D "Burp1";
			};
		} else {
			if(_type < 3)then {
				if((random 6) > 3)then {
					_targets = allPlayers select {(_x distance player) < 50};
					[player,"Burp2"] remoteExecCall ["DS_fnc_playSounds",_targets];
				} else {
					player say3D "Burp2";
				};
			} else {
				if((random 6) > 3)then {
					_targets = allPlayers select {(_x distance player) < 50};
					[player,"Burp3"] remoteExecCall ["DS_fnc_playSounds",_targets];
				} else {
					player say3D "Burp3";
				};
			};
		};
	};
};