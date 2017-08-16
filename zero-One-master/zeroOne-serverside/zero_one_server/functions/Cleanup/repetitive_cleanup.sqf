/*

	AUTHOR: aeroson
	NAME: repetitive_cleanup.sqf
	VERSION: 1.7

	DESCRIPTION:
	Can delete everything that is not really needed
	dead bodies, dropped items, smokes, chemlights, explosives, empty groups
	Works even on Altis, it eats only items which are 100m from all units

	USAGE:
	in server's init
	[
		12*60, // seconds to delete dead bodies (0 means don't delete)
		0, // seconds to delete dead vehicles (0 means don't delete)
		2*60, // seconds to delete dropped weapons (0 means don't delete)
		0, // seconds to deleted planted explosives (0 means don't delete)
		0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
	] execVM 'repetitive_cleanup.sqf';

	will delete dead bodies after 60 seconds (1 minute)
	will delete dead vehicles after 5*60 seconds (5 minutes)
	will delete weapons after 2*60 seconds (2 minutes)
	will delete planted explosives after 10*60 seconds (10 minutes)
	will not delete any smokes/chemlights since its disabled (set to 0)

*/
if (!isServer) exitWith {};
private["_ttdBodies","_ttdVehicles","_ttdWeapons","_ttdPlanted","_ttdSmokes","_ttdCar","_objectsToDelete","_timeToDelete","_delete","_unit","_lastUpdate","_lastPos","_vehicle"];

_ttdBodies = param[0,0,[0]];
_ttdVehicles = param[1,0,[0]];
_ttdWeapons = param[2,0,[0]];
_ttdPlanted = param[3,0,[0]];
_ttdSmokes = param[4,0,[0]];
_ttdCar = param[5,0,[0]];

if (_ttdWeapons<=0 && _ttdPlanted<=0 && _ttdSmokes<=0 && _ttdBodies<=0 && _ttdVehicles<=0 && _ttdCar<=0) exitWith {};

_objectsToDelete=[];
_timeToDelete=[];
_lastUpdate = (time + _ttdCar);

_delete = {
	_object = _this select 0;
	_time = _this select 1;
	if(_objectsToDelete find _object == -1) then {
		_objectsToDelete pushBack _object;
		_timeToDelete pushBack (_time+time);
	};
};

while {true} do {

	sleep 10;

	if (_ttdBodies>0) then {
		{
			if(!isPlayer _x) then {
				[_x, _ttdBodies] call _delete;
			};
		} forEach allDeadMen;
	};

	if (_ttdVehicles>0) then {
		{
			if(!isPlayer _x) then {
				[_x, _ttdVehicles] call _delete;
			};
		} forEach (allDead - allDeadMen);
	};

	if (_ttdCar>0 && (time > _lastUpdate)) then {
		_lastUpdate = (time + _ttdCar);
		{
			_vehicle = _x;
			if (local _vehicle && {_vehicle isKindOf "Car" || _vehicle isKindOf "Air" || _vehicle isKindOf "Ship"} && {!(_vehicle in gyRSj)}) then {
				uiSleep 0.1;
				_lastPos = _vehicle getVariable ["lastPos",[0,0,0]];
				if (_lastPos isEqualTo [0,0,0]) then {
					_vehicle setVariable ["lastPos",getPos _vehicle];
				} else {
					if (_lastPos isEqualTo (getPos _vehicle) && {(crew _vehicle) isEqualTo []} && {({isPlayer _x && alive _x && (getPos _x) distance _vehicle < 100} count playableUnits < 1)}) then {
						removeAllContainers _vehicle;
						deleteVehicle _vehicle;
					} else {
						_vehicle setVariable ["lastPos",getPos _vehicle];
					};
				};
			};
		} foreach vehicles;
	};

	{
	    _unit = _x;

		if (_ttdWeapons>0) then {
			{
				{
					[_x, _ttdWeapons] call _delete;
				} forEach (getpos _unit nearObjects [_x, 100]);
			} forEach ["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated"];
		};

		if (_ttdPlanted>0) then {
			{
				{
					[_x, _ttdPlanted] call _delete;
				} forEach (getpos _unit nearObjects [_x, 100]);
			} forEach ["TimeBombCore"];
		};

		if (_ttdSmokes>0) then {
			{
				{
					[_x, _ttdSmokes] call _delete;
				} forEach (getpos _unit nearObjects [_x, 100]);
			} forEach ["SmokeShell"];
		};

	} forEach allUnits;

	{
		if ((count (units _x)) == 0) then {
			deleteGroup _x;
		};
	} forEach allGroups;

	{
		if(isNull(_x)) then {
			_objectsToDelete set[_forEachIndex, 0];
			_timeToDelete set[_forEachIndex, 0];
		} else {
			if(_timeToDelete select _forEachIndex < time) then {
				deleteVehicle _x;
				_objectsToDelete set[_forEachIndex, 0];
				_timeToDelete set[_forEachIndex, 0];
			};
		};
	} forEach _objectsToDelete;

	_objectsToDelete = _objectsToDelete - [0];
	_timeToDelete = _timeToDelete - [0];
};
