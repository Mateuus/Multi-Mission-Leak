_affected = _this select 0;
_duration = _this select 1;
_empID = _this select 2;

_localAffected = [];
{
	_veh = _x;

	// an array for keeping track of how much damage each engine had before we hit it with EMP
	_curDamage = [0,0,0,0];

	// we only do any of this if the vehicle is local to the player (since only then can the setHit work)
	if(local _veh) then {

		// a vehicle can have up to four engines (helicopters), so let's find them
		_configEngine1Name = getText (configfile >> "CfgVehicles" >> typeOf _veh >> "HitPoints" >> "HitEngine" >> "name");
		_configEngine2Name = getText (configfile >> "CfgVehicles" >> typeOf _veh >> "HitPoints" >> "HitEngine1" >> "name");
		_configEngine3Name = getText (configfile >> "CfgVehicles" >> typeOf _veh >> "HitPoints" >> "HitEngine2" >> "name");
		_configEngine4Name = getText (configfile >> "CfgVehicles" >> typeOf _veh >> "HitPoints" >> "HitEngine3" >> "name");

		// get the current damage of the first engine
		_curDamage set [0, _veh getHit _configEngine1Name];
		// set the first engine as fully damaged
		_veh setHit [_configEngine1Name,1];

		// do the same for every other engine, if it exists
		if(!isNil _configEngine2Name) then {
			_curDamage set [1, _veh getHit _configEngine2Name];
			_veh setHit [_configEngine2Name,1];
		};

		if(!isNil _configEngine3Name) then {
			_curDamage set [2, _veh getHit _configEngine3Name];
			_veh setHit [_configEngine3Name,1];
		};

		if(!isNil _configEngine4Name) then {
			_curDamage set [3, _veh getHit _configEngine4Name];
			_veh setHit [_configEngine4Name,1];
		};

		// set the ID of this so we can handle multiple EMPs at once
		_veh setVariable ["empID", _empID, true];

		// has the vehicle already been EMP'd? If so, we want the damage values from the first one
		_preDamage = _veh getVariable ["engineDamage",[]];
		if(count _preDamage == 0) then {
			_veh setVariable ["engineDamage", _curDamage, true];
		};

		// create a new array that contains damage info for all the vehicles that are local
		_localAffected = _localAffected + [_veh];
	};
	if(player in (crew _veh)) then {
		titleText ["This vehicle has been disabled by an EMP", "PLAIN"];
	};
} foreach (_affected);

sleep _duration;

{
	_veh = _x;

	// if this vehicle has been EMP'd since this one, then don't do anything. The last EMP will reset the vehicle when it's done.
	if(_veh getVariable ["empID",0] == _empID) then {
		_curDamage = _veh getVariable ["engineDamage", [0,0,0,0]];

		// get those engine names again
		_configEngine1Name = getText (configfile >> "CfgVehicles" >> typeOf _veh >> "HitPoints" >> "HitEngine" >> "name");
		_configEngine2Name = getText (configfile >> "CfgVehicles" >> typeOf _veh >> "HitPoints" >> "HitEngine1" >> "name");
		_configEngine3Name = getText (configfile >> "CfgVehicles" >> typeOf _veh >> "HitPoints" >> "HitEngine2" >> "name");
		_configEngine4Name = getText (configfile >> "CfgVehicles" >> typeOf _veh >> "HitPoints" >> "HitEngine3" >> "name");

		// set each engine (if it exists) back to the damage it was at before
		_veh setHit [_configEngine1Name,_curDamage select 0];

		if(!isNil _configEngine2Name) then {
			_veh setHit [_configEngine1Name,_curDamage select 1];
		};

		if(!isNil _configEngine3Name) then {
			_veh setHit [_configEngine1Name,_curDamage select 2];
		};

		if(!isNil _configEngine4Name) then {
			_veh setHit [_configEngine1Name,_curDamage select 3];
		};
		_veh setVariable ["engineDamage", [], true];
	};
} foreach (_localAffected);