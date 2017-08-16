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

scriptName "vehicleManagerInit";

private ["_eventCode", "_vehicleManager", "_lastPos", "_R3F_attachPoint"];


_loopQty = START_LOOP_QTY_PER_FRAME;
_oldCount = 0;
_totalTime = 0;
_lastPos = [0,0,0];

_initTime = diag_tickTime;

while {true} do
{
	_startTime = diag_tickTime;
	_camPos = positionCameraToWorld [0,0,0];

	if (_lastPos distance _camPos > MOVEMENT_DISTANCE_RESCAN || diag_tickTime - _initTime >= MAX_IDLE_TIME) then
	{
		_lastPos = _camPos;
		_entities = entities "All";

		_loopQty = [DW_fnc_vehicleManager, _entities, MAIN_LOOP_INTERVAL, _oldCount, _totalTime, _loopQty, false, MAX_LOOP_QTY_PER_FRAME] call DW_fnc_loopSpread;

		_oldCount = count _entities;
		_totalTime = diag_tickTime - _startTime;
		uiSleep (MAIN_LOOP_INTERVAL - _totalTime);
	}
	else
	{
		uiSleep MAIN_LOOP_INTERVAL;
	};
};
