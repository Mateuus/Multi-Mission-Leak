scriptName "fn_attack";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_attack.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_attack.sqf"

_allUnits = [];

// Move all units out of their vehicles and create list of units (leave gunners in their vehicles)
_groups = [];
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
{_x setBehaviour "SAFE"} forEach _units;
{
	unAssignVehicle _x;
	[_x] allowGetIn false;
	doStop _x
} forEach _units;

// Check for groups without vehicle
{
	_groupToCheck = _x;
	if (isNull (((units _groupToCheck) select 0) getVariable "mav_convoy_myvehicle") OR !canMove (((units _groupToCheck) select 0) getVariable "mav_convoy_myvehicle")) then {
		{
			deleteVehicle _x;
		} forEach (units _x);
	};
} forEach _groups;

for [{_loop = 0},{_loop < (count _groups)},{_loop = _loop + 1}] do {
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
mav_convoy_currentscriptthread = [mav_convoy_vehicles, mav_convoy_markersleft] spawn mav_convoy_fnc_move;