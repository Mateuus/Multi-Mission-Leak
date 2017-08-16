scriptName "fn_followTrack";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_followTrack.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_followTrack.sqf"

_myVeh = param[0, objNull, [objNull]];
if (isNull _myVeh) exitWith {};

/*while {(!isNull _myVeh) AND (!isNull (driver _myVeh))} do {
	diag_log "followtrack1";
	// Check wether we reached the final marker
	if (_myVeh distance (getMarkerPos (mav_convoy_markersleft select ((count mav_convoy_markersleft) - 1))) < 100) then {
		[0] spawn mav_convoy_fnc_removal;
	};

	// Check if we have to move to the marker
	if (_myVeh distance mav_convoy_mainVehicle < mav_convoy_maxLeadingAndMainVehDistance) then {
		if (_myVeh distance (getMarkerPos (mav_convoy_markersleft select 0)) > 100) then {
			// Do nothing?
		} else {
			systemChat "WAYPOINT COMPLETED";

			// Update new marker
			mav_convoy_markersleft deleteAt 0;

			// Exit if there are not markers left
			if (isNil {mav_convoy_markersleft select 0}) exitWith {};

		};
		// Make leader move to new pos
		if (speed _myVeh < 5) then {
			(driver _myVeh) doMove (getMarkerPos (mav_convoy_markersleft select 0));
		};
		_myVeh limitSpeed mav_convoy_maxSpeed;
		systemChat format["FULL AT %1",mav_convoy_maxSpeed];
	} else {
		if (_myVeh distance mav_convoy_mainVehicle > (mav_convoy_maxLeadingAndMainVehDistance * 2)) then {
			doStop (driver _myVeh);
			systemChat "STOP";
		} else {
			_myVeh limitSpeed ((speed mav_convoy_mainVehicle) * 0.8);
			systemChat "LIMITING";
		};
	};
	sleep 1;
};*/

{
	_pos = getMarkerPos _x;

	_wp = (group _myVeh) addWaypoint [_pos, 0];
	_wp setWaypointFormation "COLUMN";
	_wp setWaypointType "MOVE";
} forEach mav_convoy_markersleft;

systemChat "Waypoints added";
systemChat "Syncing first and last vehicle";

while {(!isNull _myVeh) AND (alive (driver _myVeh))} do {
	sleep 1;
	if (isNil "mav_convoy_vehicles") exitWith {};
	if (count mav_convoy_vehicles == 0) exitWith {};
	_maxDistance = if (count mav_convoy_vehicles > 1) then {((count mav_convoy_vehicles) - 1) * 50} else {1};
	_lastVehicle = mav_convoy_vehicles select (count mav_convoy_vehicles - 1);
	if (_myVeh distance _lastVehicle > _maxDistance) then {
		if (_myVeh distance _lastVehicle > (_maxDistance + 500)) then {
			// Too far away, stop now
			_myVeh limitSpeed 0.1;
		} else {
			// Has to catch up, drive slowly
			_myVeh limitSpeed  10;

			// Tell all following vehicles they are allowed to drive faster to catch up
			for "_i" from 1 to (count mav_convoy_vehicles - 1) step 1 do
			{
				_vehicle = mav_convoy_vehicles select _i;
				_vehicle limitSpeed 200;
			};
		};
	} else {
		// Everything is fine, limit everyone to the max speed
		for "_i" from 0 to (count mav_convoy_vehicles - 1) step 1 do
		{
			(mav_convoy_vehicles select _i) limitSpeed mav_convoy_maxSpeed;
		};
	};
};