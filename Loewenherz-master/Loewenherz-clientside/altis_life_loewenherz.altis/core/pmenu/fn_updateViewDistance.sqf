/*
	File: fn_updateViewDistance.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the view distance dependant on whether the player is on foot, a car or an aircraft.
	Add by Bldwyn: ships now use the same settings as cars.
*/

if(LHM_settings_AutoViewDistance) then {
	_fps = diag_fps;
	if(_fps < 32) then {
		if((player distance (getMarkerPos "safezone_kavala")) < 750) then { // Player is in safezone
			if((vehicle player) isKindOf "Man") then { LHM_settings_viewDistanceFoot = (LHM_settings_viewDistanceFoot - 100) max 350; };
			if((vehicle player) isKindOf "LandVehicle") then { LHM_settings_viewDistanceCar = (LHM_settings_viewDistanceCar - 100) max 400; };
		} else { // not in safezone
			if((vehicle player) isKindOf "Man") then { LHM_settings_viewDistanceFoot = (LHM_settings_viewDistanceFoot - 100) max 550; };
			if((vehicle player) isKindOf "LandVehicle") then { LHM_settings_viewDistanceCar = (LHM_settings_viewDistanceCar - 100) max 800; };
		};
		if((vehicle player) isKindOf "Air") then { LHM_settings_viewDistanceAir = (LHM_settings_viewDistanceAir - 100) max 1500; };
		if((vehicle player) isKindOf "Ship") then { LHM_settings_viewDistanceCar = (LHM_settings_viewDistanceCar - 100) max 900; };
	};
	if(_fps > 45) then {
		if((vehicle player) isKindOf "Man") then { LHM_settings_viewDistanceFoot = (LHM_settings_viewDistanceFoot + 50) min 1700; };
		if((vehicle player) isKindOf "LandVehicle") then { LHM_settings_viewDistanceCar = (LHM_settings_viewDistanceCar + 50) min 1800; };
		if((vehicle player) isKindOf "Ship") then { LHM_settings_viewDistanceCar = (LHM_settings_viewDistanceCar + 50) min 1700; };
		if((vehicle player) isKindOf "Air") then { LHM_settings_viewDistanceAir = (LHM_settings_viewDistanceAir + 50) min 2800; };
	};
};

switch (true) do
{
	case ((vehicle player) isKindOf "Man"): {setViewDistance LHM_settings_viewDistanceFoot};
	case ((vehicle player) isKindOf "LandVehicle"): {setViewDistance LHM_settings_viewDistanceCar};
	case ((vehicle player) isKindOf "Ship"): {setViewDistance LHM_settings_viewDistanceCar};
	case ((vehicle player) isKindOf "Air"): {setViewDistance LHM_settings_viewDistanceAir};
};
