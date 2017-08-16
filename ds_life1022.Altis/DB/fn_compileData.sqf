/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Gathers the players information and sends it to the server to be saved
*/

private ["_packet","_time","_newTime","_licenses","_counter"];

params [
	["_force",false,[false]],
	["_startSync",false,[false]]
];

if(_startSync)then {_licenses = _this select 2;};
if((player distance spawnIsland < 1000)&&(!_force))exitWith{};
if(player distance (getMarkerPos "spawnIsland2") < 1000)exitWith{};

DS_dataSynced = true;

_packet = [getPlayerUID player,(profileName),playerSide,DS_coin,DS_atmCoin,DS_moral];
_time = time - DS_playTime;
_time = (round(_time/60));

switch(playerSide)do {
	case west: {
		_newTime = ((_time) + (DS_infoArray select 0));
		DS_infoArray set [0,_newTime];

		if(!_startSync)then {
			_licenses = [];
			{
				_licenses pushBack [_x,(missionNamespace getVariable _x)];
			} forEach DS_licenseArray;
		};

		_packet pushBack _licenses;
	};
	case independent: {
		_newTime = ((_time) + (DS_infoArray select 2));
		DS_infoArray set [2,_newTime];

		if(!_startSync)then {
			_licenses = [];
			{
				_licenses pushBack [_x,(missionNamespace getVariable _x)];
			} forEach DS_licenseArray;
		};

		_packet pushBack _licenses;
	};
	case civilian: {
		_newTime = ((_time) + (DS_infoArray select 1));
		DS_infoArray set [1,_newTime];

		if(!_startSync)then {
			_licenses = [];
			{
				_licenses pushBack [_x,(missionNamespace getVariable _x)];
			} forEach DS_licenseArray;
		};

		_packet pushBack _licenses;
	};
};

DS_playTime = time;
switch(playerSide)do {
	case west: {
		if(!_startSync)then {
			[] call DS_fnc_saveGear;
		};
		_packet pushBack DS_gear;
		_packet pushBack DS_infoArray;
		_packet pushBack DS_locker;
		_packet pushBack DS_realEstateArray;
	};
	case civilian: {
		if(!_startSync)then {
			if(!alive player)then {
				DS_gear = [];
				_licenses = [];
				{
					_licenses pushBack [_x,false];
				} forEach DS_licenseArray;
			} else {
				[] call DS_fnc_saveGear;
			};
		};
		_packet pushBack DS_gear;
		_packet pushBack DS_infoArray;
		if(DS_jailed)then {
			_packet pushBack 1;
		} else {
			_packet pushBack 0;
		};
		_packet pushBack DS_wanted_stats;
		_packet pushBack DS_realEstateArray;
	};
	case independent: {
		_packet pushBack DS_infoArray;
		if(DS_jailed)then {
			_packet pushBack 1;
		} else {
			_packet pushBack 0;
		};
		_packet pushBack DS_wanted_stats;
		_packet pushBack DS_realEstateArray;
	};
};

//_packet = [(_packet select 6),'"',"'"] call KRON_Replace;
//_packet = [(_packet select 7),'"',"'"] call KRON_Replace;

DS_debug101 = _packet;
_packet remoteExec ["DB_fnc_updateRequest",2];

[] spawn {
	sleep 10;
	DS_dataSynced = false;
};