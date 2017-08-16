scriptName "fn_follow";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_follow.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_follow.sqf"

_myVeh = _this select 0;
_param = _this select 1;

// Determine if we are the leading vehicle or not
_leading = if (isNull _param) then {true} else {false};

// Make us move
if (_leading) then {
	while {(!isNull _myVeh) AND (!isNull (driver _myVeh))} do {
		// Check wether we reached the final marker
		if (_myVeh distance (getMarkerPos (mav_convoy_markersleft select ((count mav_convoy_markersleft) - 1))) < 100) then {
			[0] spawn mav_convoy_fnc_removal;
		};

		// Limit vehicle speed
		//_myVeh limitSpeed (if ((speed mav_convoy_mainVehicle) > 0) then {(speed mav_convoy_mainVehicle)} else {mav_convoy_maxSpeed});

		// Check if we have to move to the marker
		if (_myVeh distance mav_convoy_mainVehicle < mav_convoy_maxLeadingAndMainVehDistance) then {
			if (_myVeh distance (getMarkerPos (mav_convoy_markersleft select 0)) > 100) then {
				//
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
		sleep 3;
	};
} else {
	while {(!isNull _myVeh) AND (!isNull (driver _myVeh)) AND (!isNull _param) AND (!isNull (driver _param))} do {
		_dir = [_param, _myVeh] call BIS_fnc_relativeDirTo;

		// Check if this vehicle is still behind the one its supposed to follow, if not STOP instantly
		if !(_dir > 100 AND _dir < 260) then {
			doStop (driver _myVeh);
		} else {
			if (_myVeh distance _param > 50 AND (_myVeh distance (getMarkerPos (mav_convoy_markersleft select 0)) > _param distance (getMarkerPos (mav_convoy_markersleft select 0)))) then {
				// Make leader move to new pos
				//(driver _myVeh) doMove (getPos _param);
				(driver _myVeh) doMove (getMarkerPos (mav_convoy_markersleft select 0));
				_myVeh limitSpeed mav_convoy_maxSpeed;
			} else {
				//doStop (driver _myVeh);
				_myVeh limitSpeed (if ((speed _param) > 0) then {((speed _param) * 0.8)} else {0});
			};
		};
		sleep 3;
	};
};