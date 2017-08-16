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

scriptName "vehicleManagerEventCode";

private ["_eventCode", "_vehicleManager", "_lastPos", "_R3F_attachPoint"];

	

	_vehicle = _this select 0;
	if (!simulationEnabled _vehicle) then { _vehicle enableSimulation true };
	_vehicle setVariable ["fpsFix_simulationCooloff", diag_tickTime + 20];


