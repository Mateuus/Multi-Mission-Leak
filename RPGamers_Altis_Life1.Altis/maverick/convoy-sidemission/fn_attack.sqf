scriptName "fn_attack";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_attack.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_attack.sqf"

// Delete all waypoints
//for "_i" from (count (waypoints group mav_convoy_mainVehicle) - 1) to 0 step -1 do
//{
//	deleteWaypoint ((waypoints (group mav_convoy_mainVehicle)) select _i);
//};

mav_convoy_inAttack = true;

// Reserved group var
_aliveUnitsGroup = grpNull;

// Stop all vehicles
_allUnits = [];
{
	_x limitSpeed 0.1;
	//doStop (driver _x);
	waitUntil {(speed _x) < 5};

	// Eject all units except gunners
	_v = _x;
	{
		_x setVariable ["mav_convoy_myvehicle",_v];

		if (_x != (gunner _v)) then {
			[_x] allowGetIn false;
			_x action ["GetOut", _v];
			unassignVehicle _x;
		} else {
			_x assignAsGunner _v;
		};
		_allUnits pushBack _x;

		if (alive _x) then {
			_aliveUnitsGroup = group _x;
		};
	} forEach (crew _x);
} forEach mav_convoy_vehicles;

// Change to combat
while {behaviour (leader _aliveUnitsGroup) != "COMBAT"} do {
	_aliveUnitsGroup setBehaviour "COMBAT";

	if (isNull _aliveUnitsGroup) exitWith {
		diag_log "Convoy: Group not found";
	};

	{
		_x setBehaviour "COMBAT";
	} forEach units _aliveUnitsGroup;

	//diag_log "Convoy: Setting combat behaviour";
};

// Reveal all enemy units
{
	_unit = _x;
	{
		if (_x isKindOf "Man") then {
			_x reveal _unit;
		};
	} forEach mav_convoy_allMissionObjects;
} forEach (nearestObjects [mav_convoy_mainVehicle, ["Man"], 500]);

// Wait until all enemies are gone
_check = true;
_convoyCannotContinue = false;
while {_check} do {
	// Recount vehicles
	_newArr = [];
	{
		if (!isNull _x AND alive _x AND canMove _x) then {
			_newArr pushBack _x;
		};
	} forEach mav_convoy_vehicles;
	mav_convoy_vehicles = _newArr;

	// Checks
	if (({alive _x} count _allUnits) < ({alive _x} count mav_convoy_vehicles)) exitWith {
		// There are less units than required drivers, this mission is over!
		_check = false;
		_convoyCannotContinue = true;
	};
	if !(mav_convoy_mainVehicle in mav_convoy_vehicles) exitWith {
		// Main vehicle unable to move, mission is over
		_check = false;
		_convoyCannotContinue = true;
	};
	if (({!isNull (_x findNearestEnemy (position _x))} count _allUnits) == 0) exitWith {
		// All enemy units dead, continue the tour
		_check = false;
	};

	sleep 5;
};

systemChat "All enemies gone";
mav_convoy_inAttack = false;

// Continue?
if (_convoyCannotContinue) exitWith {
	if (mav_convoy_currentsessiondone) exitWith {};
	[] spawn mav_convoy_fnc_dropLoot;

	// Display messages?
	if ((getNumber(missionConfigFile >> "Maverick_ConvoySidemission" >> "ConvoyConfigurationsPool" >> mav_convoy_class >> "Messages" >> "enabled")) == 1) then {
		_header = getText(missionConfigFile >> "Maverick_ConvoySidemission" >> "ConvoyConfigurationsPool" >> mav_convoy_class >> "Messages" >> "stoppedAnnouncementHeader");
		_text = getText(missionConfigFile >> "Maverick_ConvoySidemission" >> "ConvoyConfigurationsPool" >> mav_convoy_class >> "Messages" >> "stoppedAnnouncementDescription");
		(parseText format ["<t color='#ff0000' size='1.4' shadow='2' align='center'>%1</t><br/><br/>%2", _header, _text]) remoteExec ["hint"];
	};

	if ((getNumber(missionConfigFile >> "Maverick_ConvoySidemission" >> "ConvoyConfigurationsPool" >> mav_convoy_class >> "Vehicles" >> "removeVehiclesAfterSeconds")) != -1) then {
		[(getNumber(missionConfigFile >> "Maverick_ConvoySidemission" >> "ConvoyConfigurationsPool" >> mav_convoy_class >> "Vehicles" >> "removeVehiclesAfterSeconds"))] spawn mav_convoy_fnc_removal;
	} else {
		mav_convoy_currentsessiondone = true; // Tell main script to create new convoy
	};
};

systemChat "Continuing convoy";

// All alive units, replace them with new ones!
_unitsAvailable = [];
_unitsAssigned = [];
_unitsGroup = createGroup WEST;
_skillArray = getArray(missionConfigFile >> "Maverick_ConvoySidemission" >> "Config" >> "AIDifficulty");
{
	if (alive _x) then {
		deleteVehicle _x;

		_newUnit = _unitsGroup createUnit ["B_Competitor_F", position _x, [], 0, "FORM"];
		{
			_newUnit setSkill _x;
		} forEach _skillArray;

		// Handlers
		_newUnit addMPEventHandler ["MPHit",{[_this select 1] spawn mav_convoy_fnc_checkUnit;}];

		// Give unit loadout
		[_newUnit] call mav_convoy_fnc_giveUnitLoadout;
		mav_convoy_allMissionObjects pushBack _newUnit;
		_unitsAvailable pushBack _newUnit;
	};
} forEach _allUnits;
_allUnits = +_unitsAvailable;

// Make driver of first vehicle the leader
_firstVehicle = mav_convoy_vehicles select 0;
(group _firstVehicle) selectLeader (driver _firstVehicle);
//(group _firstVehicle) setFormation "FILE";
while {formation _unitsGroup != "FILE"} do {
	_unitsGroup setFormation "FILE";
};

// Disable damage for units while getting into cars
{
	_x allowDamage false;
} forEach mav_convoy_allMissionObjects;

// All units eject from their vehicles
/*{
	unassignVehicle _x;
	[_x] allowGetIn false;
	_x action ["GetOut", (vehicle _x)];
} forEach _unitsAvailable;
sleep 1;*/

// Get group
//_unitsGroup = group (_unitsAvailable select 0);

// Stop waypoint
/*_waitWaypoint = _unitsGroup addWayPoint [getPos mav_convoy_mainVehicle, 5];
_waitWaypoint setWaypointType "HOLD";
_waitWaypoint setWaypointSpeed "LIMITED";
_waitWaypoint setWaypointCompletionRadius 400;*/
/*sleep 1;*/

//_unitsGroup setBehaviour "SAFE";
_unitsAvailable allowGetIn true;

// Continue!
// Reassign units to vehicles
// Drivers
_firstVehicle = true;
{
	if (count _unitsAvailable > 0) then {
		if (_firstVehicle) then {
			_firstVehicle = false;
			_leaderGroup = leader _unitsGroup;
			_unit = _leaderGroup;
			_unit assignAsDriver _x;
			[_unit] orderGetIn true;
			_unit moveInDriver _x;
			_unitsAvailable = _unitsAvailable - [_unit];
			_unitsAssigned pushBack _unit;
			systemChat "Driver assigned (Leader)";
			sleep 1;
		} else {
			_unit = _unitsAvailable select 0;
			_unit assignAsDriver _x;
			[_unit] orderGetIn true;
			_unit moveInDriver _x;
			_unitsAvailable deleteAt 0;
			_unitsAssigned pushBack _unit;
			systemChat "Driver assigned";
		};
	};
} forEach mav_convoy_vehicles;
// Gunners (if slot for a gunner is available)
{
	if ((_x emptyPositions "Gunner") > 0) then {
		if (count _unitsAvailable > 0) then {
			_unit = _unitsAvailable select 0;
			_unit assignAsGunner _x;
			[_unit] orderGetIn true;
			_unit moveInGunner _x;
			_unitsAvailable deleteAt 0;
			_unitsAssigned pushBack _unit;
			systemChat "Gunner assigned";
		};
	};
} forEach mav_convoy_vehicles;
// Cargo
{
	for "_i" from 1 to (_x emptyPositions "Cargo") step 1 do
	{
		if (count _unitsAvailable > 0) then {
			_unit = _unitsAvailable select 0;
			_unit assignAsCargo _x;
			_unitsAssigned pushBack _unit;
			[_unit] orderGetIn true;
			_unit moveInCargo _x;
			_unitsAvailable deleteAt 0;
			systemChat "Cargo assigned";
		};
	};
} forEach mav_convoy_vehicles;

systemChat "Units assigned to vehicles";

// Order all units to get into their vehicles
//_allUnits orderGetIn true;
systemChat "Units forced to get into vehicles";
waitUntil {({(vehicle _x) == _x} count _unitsAssigned) == 0};
systemChat "All units in vehicles";

// Forcing behaviour
while {behaviour (leader _unitsGroup) != "CARELESS"} do {
	_unitsGroup setBehaviour "CARELESS";
};

// Make first vehicles driver the leader
//_unitsGroup selectLeader (driver (mav_convoy_vehicles select 0));

// Enable damage for units while getting into cars
{
	_x allowDamage true;
} forEach mav_convoy_allMissionObjects;

sleep 5;

// Restart convoy
[mav_convoy_vehicles select 0] spawn mav_convoy_fnc_followTrack;
mav_convoy_currentscriptthread = [mav_convoy_vehicles, mav_convoy_markersleft] spawn mav_convoy_fnc_move;

//_allUnits = [];

// Move all units out of their vehicles and create list of units (leave gunners in their vehicles)
/*_groups = [];
{
	_v = _x;
	_groups pushBack (group _v);
	{
		_x setVariable ["mav_convoy_myvehicle",_v];
		if (_x != (gunner _v)) then {
			_x action ["GetOut", _v];
			[_x] allowGetIn false;
		} else {
			_x assignAsGunner _v;
		};
		_allUnits pushBack _x;
	} forEach (crew _x);
	_v lockDriver true;
} forEach mav_convoy_vehicles;

_units = _allUnits;

// Reveal all enemy units
{
	_unit = _x;
	{
		if (_x isKindOf "Man") then {
			_x reveal _unit;
		};
	} forEach mav_convoy_allMissionObjects;
} forEach (nearestObjects [mav_convoy_mainVehicle, ["Man"], 500]);

// Wait until all enemies are gone
_check = true;
_convoyCannotContinue = false;
while {_check} do {
	// Recount vehicles
	_newArr = [];
	{
		if (!isNull _x AND alive _x AND canMove _x) then {
			_newArr pushBack _x;
		};
	} forEach mav_convoy_vehicles;
	mav_convoy_vehicles = _newArr;

	// Checks
	if (({alive _x} count _allUnits) < ({alive _x} count mav_convoy_vehicles)) exitWith {
		// There are less units than required drivers, this mission is over!
		_check = false;
		_convoyCannotContinue = true;
	};
	if !(mav_convoy_mainVehicle in mav_convoy_vehicles) exitWith {
		// Main vehicle unable to move, mission is over
		_check = false;
		_convoyCannotContinue = true;
	};
	if (({!isNull (_x findNearestEnemy (position _x))} count _allUnits) == 0) exitWith {
		// All enemy units dead, continue the tour
		_check = false;
	};

	sleep 5;
};

if (_convoyCannotContinue) exitWith {
	if (mav_convoy_currentsessiondone) exitWith {};
	[] spawn mav_convoy_fnc_dropLoot;

	// Display messages?
	if ((getNumber(missionConfigFile >> "Maverick_ConvoySidemission" >> "ConvoyConfigurationsPool" >> mav_convoy_class >> "Messages" >> "enabled")) == 1) then {
		_header = getText(missionConfigFile >> "Maverick_ConvoySidemission" >> "ConvoyConfigurationsPool" >> mav_convoy_class >> "Messages" >> "stoppedAnnouncementHeader");
		_text = getText(missionConfigFile >> "Maverick_ConvoySidemission" >> "ConvoyConfigurationsPool" >> mav_convoy_class >> "Messages" >> "stoppedAnnouncementDescription");
		(parseText format ["<t color='#ff0000' size='1.4' shadow='2' align='center'>%1</t><br/><br/>%2", _header, _text]) remoteExec ["hint"];
	};

	if ((getNumber(missionConfigFile >> "Maverick_ConvoySidemission" >> "ConvoyConfigurationsPool" >> mav_convoy_class >> "Vehicles" >> "removeVehiclesAfterSeconds")) != -1) then {
		[(getNumber(missionConfigFile >> "Maverick_ConvoySidemission" >> "ConvoyConfigurationsPool" >> mav_convoy_class >> "Vehicles" >> "removeVehiclesAfterSeconds"))] spawn mav_convoy_fnc_removal;
	} else {
		mav_convoy_currentsessiondone = true; // Tell main script to create new convoy
	};
};

// Assign members to vehicles
/*{_x setBehaviour "SAFE"} forEach _units;
{
	unAssignVehicle _x;
	[_x] allowGetIn false;
	doStop _x
} forEach _units;*/

// Check for groups without vehicle
/*{
	_groupToCheck = _x;
	if (isNull (((units _groupToCheck) select 0) getVariable "mav_convoy_myvehicle") OR !canMove (((units _groupToCheck) select 0) getVariable "mav_convoy_myvehicle")) then {
		{
			deleteVehicle _x;
		} forEach (units _x);
	};
} forEach _groups;*/

/*for [{_loop = 0},{_loop < (count _groups)},{_loop = _loop + 1}] do {
	_group = _groups select _loop;
	if (count units _group > 0) then {
		_units = units _group;
		{unAssignVehicle _x; [_x] allowGetIn false; doStop _x} forEach _units;
		sleep 1;
		_unit = (units _group) select 0;
		_veh = _unit getVariable "mav_convoy_myvehicle";
		if (canMove _veh) then {
			_veh lockDriver false;
			_vehPosMrkr = createMarkerLocal [format ["mrkr_%1",_veh],getPos _veh];
			_vehPosMrkr setMarkerTypeLocal "Empty";
			_vehPosMrkrPos = getMarkerPos _vehPosMrkr;
			_wp = _group addWayPoint [_vehPosMrkrPos,20];
			_wp setWaypointType "MOVE";
			_wp setWaypointSpeed "FULL";
			_wp1 = _group addWayPoint [_vehPosMrkrPos,20];
			_wp1 setWaypointType "GETIN NEAREST";
			_wp1 setWaypointSpeed "FULL";
			_wp2 = _group addWayPoint [_vehPosMrkrPos,20];
			_wp2 setWaypointType "HOLD";
			_wp2 setWaypointSpeed "LIMITED";
			_units allowGetIn true;
		};
	};
	sleep 0.1;
};

{
	_vehicle = ((units _x) select 0) getVariable ["mav_convoy_myvehicle", objNull];

	while {isNull (leader _x)} do {
		_x selectLeader (selectRandom (units _x));
		sleep 1;
	};

	[units _x] allowGetIn true;

	(leader _x) assignAsDriver _vehicle;
	[leader _x] orderGetIn true;
	(leader _x) moveInDriver _vehicle;

	_group = _x;
	_veh = _vehicle;
	_vehicle lockDriver false;
	_vehPosMrkr = createMarkerLocal [format ["mrkr_%1",_veh],getPos _veh];
	_vehPosMrkr setMarkerTypeLocal "Empty";
	_vehPosMrkrPos = getMarkerPos _vehPosMrkr;
	_wp = _group addWayPoint [_vehPosMrkrPos,20];
	_wp setWaypointType "MOVE";
	_wp setWaypointSpeed "FULL";
	_wp1 = _group addWayPoint [_vehPosMrkrPos,20];
	_wp1 setWaypointType "GETIN NEAREST";
	_wp1 setWaypointSpeed "FULL";
	_wp2 = _group addWayPoint [_vehPosMrkrPos,20];
	_wp2 setWaypointType "HOLD";
	_wp2 setWaypointSpeed "LIMITED";
	_units allowGetIn true;

	systemChat format["Getin ordered for %1 into %2", _x, _vehicle];
} forEach _groups;

// Experimental wait until all units are in their vehicles
_loop = true;
while {_loop} do {
	_wait = false;
	{
		{
			if (alive _x AND (vehicle _x == _x)) then {
				_wait = true;
			};
		} forEach (units _x);
	} forEach _groups;

	if (!_wait) then {
		_loop = false;
	};
	sleep 1;
};

sleep 3;

// Restart path finding
_vehicleBeforeMe = objNull;
for "_i" from 0 to ((count mav_convoy_vehicles) - 1) do {
	if (_i == 0) then {
		_thread = [(mav_convoy_vehicles select _i), objNull] spawn mav_convoy_fnc_follow;
		(mav_convoy_vehicles select _i) setVariable ["mav_convoy_vehiclethread",_thread];
		_vehicleBeforeMe = (mav_convoy_vehicles select _i);
	} else {
		_thread = [(mav_convoy_vehicles select _i), _vehicleBeforeMe] spawn mav_convoy_fnc_follow;
		(mav_convoy_vehicles select _i) setVariable ["mav_convoy_vehiclethread",_thread];
		_vehicleBeforeMe = (mav_convoy_vehicles select _i);
	};
};

// Restart main script
mav_convoy_currentscriptthread = [mav_convoy_vehicles, mav_convoy_markersleft] spawn mav_convoy_fnc_move;*/