/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Spawns the player in at his selected location
*/

private ["_spawnLocs","_spawnPoint","_spawnPos","_tempValue","_rankStr","_randomFace"];

closeDialog 0;
cutText ["","BLACK IN"];

[] call DS_fnc_stamina;

if((playerSide isEqualTo civilian)&&((DS_infoArray select 34) == 1))then {
	if(!DS_realMode)then {
		[] spawn {
			DS_realMode = true;
			while{true}do {
				waitUntil {(cameraView isEqualTo "EXTERNAL")};
				if(!DS_realMode)exitWith{};
				(vehicle player) switchCamera "INTERNAL";
			};
		};
	};
};

if((DS_spawnPoint select 0) in ["medic_spawn1","medic_spawn2","medic_spawn3"])then {
	[] execVM "player\whitelistcivilian\setUpMedic.sqf";
};

if((DS_spawnPoint select 0) in ["mechanic_spawn_1","mechanic_spawn_2","mechanic_spawn_3","mechanic_spawn_4","mechanic_spawn_5"])then {
	[] execVM "player\whitelistcivilian\setUpMechanic.sqf";
};

if((DS_spawnPoint select 0) in ["secSpawn1","secSpawn2","secSpawn3"])then {
	[] execVM "player\whitelistcivilian\setUpSecurity.sqf";
};

if(DS_spawnPoint isEqualTo [])then {	
	_spawnLocs = [] call DS_fnc_getSpawnPoints;
	_spawnPoint = _spawnLocs select 0;

	if(playerSide isEqualTo civilian)then {
		if(isNil {(call compile format ["%1",_spawnPoint select 0])}) then {
			player setPos (getMarkerPos (_spawnPoint select 0));
		} else {
			_spawnPos = selectRandom (call compile format ["%1",_spawnPoint select 0]);
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	} else {
		player setPos (getMarkerPos (_spawnPoint select 0));
	};

	titleText [format ["You are spawning in %1",_spawnPoint select 1],"BLACK IN"];
} else {
	if(playerSide isEqualTo civilian)then {
		if(isNil {(call compile format ["%1",DS_spawnPoint select 0])})then {
			if((["property",DS_spawnPoint select 0] call BIS_fnc_inString))then {
				private ["_bPos","_house","_pos"];

				_house = nearestObjects [getMarkerPos (DS_spawnPoint select 0),["House_F"],10] select 0;
				if((_house distance getMarkerPos (DS_spawnPoint select 0)) > 5)then {
					_house = nearestObjects [(getMarkerPos (DS_spawnPoint select 0)),[],10] select 0;
				};

				_bPos = [_house] call DS_fnc_houseMarkers;
				if(_bPos isEqualTo []) exitWith {
					player setPos (getMarkerPos (DS_spawnPoint select 0));
				};

				_pos = selectRandom _bPos;
				player setPosATL _pos;
			} else {
				player setPos (getMarkerPos (DS_spawnPoint select 0));
			};
		} else {
			if((["clanBase",DS_spawnPoint select 0] call BIS_fnc_inString))then {
				player setPos (DS_spawnPoint select 0);
			} else {
				_spawnPos = selectRandom (call compile format ["%1",DS_spawnPoint select 0]);
				_spawnPos = _spawnPos buildingPos 0;
				player setPos _spawnPos;
			};
		};
	} else {
		player setPos (getMarkerPos (DS_spawnPoint select 0));
	};

	titleText [format ["You have spawned at %1",DS_spawnPoint select 1],"BLACK IN"];
};

if(DS_firstSpawn)then {
	DS_firstSpawn = false;
	[] spawn DS_fnc_serverIntro;
};

if(playerSide isEqualTo west)then {
	if((str(player) in ["cop_4","cop_1","cop_3","cop_5","cop_6","cop_7"]))then {
		DS_pubCop = true;
		player setVariable ["pubCop",true,true];
	} else {
		player setVariable ["cop",true,true];
	};

	[] call DS_cop_updateCopRank;
};

player enableFatigue false;
(vehicle player) switchCamera "EXTERNAL";
[] call DS_fnc_setupHud;
(findDisplay 666671) displayRemoveEventHandler ["KeyDown",DS_blockEsc];

0 enableChannel [false, false];
1 enableChannel [false, false];
2 enableChannel [false, false];

[] call DS_fnc_updateHud;

_timePlayed = ((DS_infoArray select 0)+(DS_infoArray select 1)+(DS_infoArray select 2));
_timePlayed = (floor(_timePlayed/60));
player setVariable ["timePlayed",_timePlayed,true];

if((DS_infoArray select 13) > 35)then{DS_bankInsurance = true};

[] spawn {
	sleep 10;
	if(miscInfoArray select 8)then {
		systemchat "Altis is currently under martial law - Read about what this means in the J menu";
		hint "Altis is currently under martial law - Read about what this means in the J menu";
	};
};

if(DS_donorLevel == 0)then {
	if((DS_realEstateArray select 27) == 0)then {
		_rand = round random 33;
		DS_realEstateArray set [27,_rand];
	};
	_randomFace = DS_faceArray select (DS_realEstateArray select 27);
	[player,_randomFace] remoteExec ["HUNT_fnc_setupBody",2];
};

[] spawn {
	sleep 300;
	DS_punishMe = true;
};

7 enableChannel [true,false];
8 enableChannel [true,false];
9 enableChannel [true,false];