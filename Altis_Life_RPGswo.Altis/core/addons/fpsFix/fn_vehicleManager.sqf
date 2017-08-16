//	@file Version: 1.0
//	@file Name: vehicleManager.sqf
//	@file Author: AgentRev
//	@file Created: 14/09/2013 19:19

// This script will increase client FPS by 25-50% for missions with a lot of vehicles spread throughout the map.
// It must be spawned or execVM'd once on every client. For A3Wasteland, it is execVM'd at the end of "client\init.sqf"

// If you decide to use this in another mission, a little mention in the credits would be appreciated :) - AgentRev

if (isServer) exitWith {};

#define MAIN_LOOP_INTERVAL 5
#define START_LOOP_QTY_PER_FRAME 5
#define MAX_LOOP_QTY_PER_FRAME 10

#define MOVEMENT_DISTANCE_RESCAN 100
#define MAX_IDLE_TIME (5*60)
#define DISABLE_DISTANCE_R3F (MOVEMENT_DISTANCE_RESCAN + 100)
#define DISABLE_DISTANCE_MOBILE 2000
#define DISABLE_DISTANCE_IMMOBILE 1000
#define DISABLE_DISTANCE_THING 100

scriptName "vehicleManager";

	private ["_vehicle", "_isAnimal", "_isMotorVehicle", "_tryEnable", "_dist"];
	_vehicle = _this;

	if (!(_vehicle isKindOf "CAManBase") && !(_vehicle getVariable ["mapplaced",false])&&(isNil "R3F_LOG_PUBVAR_point_attache" || {_vehicle != R3F_LOG_PUBVAR_point_attache})) then
	{
		_isAnimal = _vehicle isKindOf "Animal";
		_isThing = _vehicle isKindOf "Thing";
		_tryEnable = true;

		if (!local _vehicle &&
		   {(count crew _vehicle == 0 || _isAnimal) &&
		   (_vehicle getVariable ["fpsFix_simulationCooloff", 0] < diag_tickTime) &&
		   ((getPos _vehicle) select 2 < 1 || {_vehicle isKindOf "Static"})}) then
		{
			_dist = _vehicle distance positionCameraToWorld [0,0,0];

			if (_dist > DISABLE_DISTANCE_MOBILE || {
					vectorMagnitude velocity _vehicle < 0.1 && (
						(_dist > DISABLE_DISTANCE_R3F || !(_vehicle getVariable ["R3F_LOG_init_done", false])) && {
							(_dist > DISABLE_DISTANCE_IMMOBILE && !_isAnimal) ||
							(_dist > DISABLE_DISTANCE_THING && _isThing && !(_vehicle getVariable ["inventoryIsOpen", false]))
						}
					)
				}) then
			{
				_vehicle enableSimulation false;
				_tryEnable = false;
			};
		};

		if (_tryEnable && !simulationEnabled _vehicle) then
		{
			_vehicle enableSimulation true;
		};

		if !(_vehicle getVariable ["fpsFix_eventHandlers", false]) then
		{
			if (_vehicle isKindOf "AllVehicles" && !_isAnimal) then
			{
				_vehicle addEventHandler ["GetIn", DW_fnc_vehicleManagerEventCode];
			};

			if (_isThing) then
			{
				_vehicle addEventHandler ["EpeContactStart", DW_fnc_vehicleManagerEventCode];
			};

			_vehicle addEventHandler ["Explosion", DW_fnc_vehicleManagerEventCode];
			_vehicle addEventHandler ["Killed", DW_fnc_vehicleManagerEventCode];

			_vehicle setVariable ["fpsFix_eventHandlers", true];
		};
	};