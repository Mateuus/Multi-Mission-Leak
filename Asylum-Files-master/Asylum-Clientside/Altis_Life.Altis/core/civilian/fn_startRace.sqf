/*
	File: fn_startRace.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	A race which the player is driving for has begun
*/

_raceId = [_this,0,0,[0]] call BIS_fnc_param;
if (_raceId < 1) exitWith {};
life_race = _raceId;

_startPos = getMarkerPos format["race_%1_start", _raceId];
if (vehicle player == player) exitWith {};
if (driver (vehicle player) != player) exitWith {};

if ((vehicle player) distance _startPos > 15) exitWith
{
	hint "You were too far from the starting position and cannot win this race.";
	if (count life_active_event > 0 && !isNil life_event_startpos) then
	{
		life_active_event = [];
	};
};

[] spawn
{
	while {sleep 0.5; life_race > 0} do
	{
		if (vehicle player != player) then
		{
			if (cameraView == "EXTERNAL") then { vehicle player switchCamera "INTERNAL"; };
		};
	};
};

[_raceId,vehicle player] spawn {
	private ["_raceId","_vehicle"];
	_raceId = _this select 0;
	_vehicle = _this select 1;
		_wayPoints = (life_race_waypoints select (_raceId - 1));
	_wayPoint = 1;
	_arrow = objNull;
	_raceStart = diag_tickTime;
	while {life_race > 0} do
	{
		_wayPointPos = getMarkerPos (_wayPoints select _wayPoint);
		if ( _wayPoint == ((count _wayPoints) - 1)) then { _arrow = "Sign_Arrow_Large_F" createVehicleLocal _wayPointPos; }
		else { _arrow = (if (surfaceIsWater _wayPointPos) then { "Sign_Circle_F" } else { "Sign_Arrow_Direction_Green_F" }) createVehicleLocal _wayPointPos; };
		_arrow setPos [(_wayPointPos select 0), (_wayPointPos select 1), 3];
		_arrow setVectorDirAndUp [[sin (markerDir (_wayPoints select _wayPoint)), cos (markerDir (_wayPoints select _wayPoint)),0],[1,1,0]];
		waitUntil {(((player distance _wayPointPos) < 15) && ((vehicle player == _vehicle))) || !alive player || (life_race == 0) || (vehicle player != player && (((vehicle player) getHitPointDamage "HitEngine") > 0.7 || ((vehicle player) getHitPointDamage "HitLFWheel") > 0.98 || ((vehicle player) getHitPointDamage "HitLF2Wheel") > 0.98 || ((vehicle player) getHitPointDamage "HitRFWheel") > 0.98 || ((vehicle player) getHitPointDamage "HitRF2Wheel") > 0.98))};
		deleteVehicle _arrow;
		if (life_race == 0) exitWith {};
		if (!alive player) exitWith {hint "You've forfeited the race because, well, you're dead."};
		if (((player distance _wayPointPos) < 15) && ((vehicle player == _vehicle))) then
		{
			if (_wayPoint == ((count _wayPoints) - 1)) then
			{
				life_race = 0;
				titleText[format["You've won the race!"],"PLAIN"];
				[[_raceId,_vehicle,(diag_tickTime - _raceStart)],"ASY_fnc_finishRace",false,false] spawn life_fnc_MP;
				if (!(16 in life_achievements)) then { [16] call life_fnc_achievementGrant };
				if (!isNil "life_event_startpos") then
				{
					["atm","add",3000] call life_fnc_uC;
					systemChat "$3,000 has been deposited in your bank account for winning the race!";
				};
			}
			else
			{
				playSound "bombarm";
				_wayPoint = _wayPoint + 1;
			};
		}
		else
		{
			hint "Your vehicle was badly damaged. Continuing from last checkpoint in 5 seconds!";
			sleep 5;
			_veh = vehicle player;
			_marker = _wayPoints select (_wayPoint - 1);
			_veh setDamage 0;
			{ _x setDamage 0; } forEach crew _veh;
			_veh setDir (markerDir _marker);
			_veh setPos (getMarkerPos _marker);
			
		};
	};
};