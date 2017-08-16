/*
	File: fn_setAggressive.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Sets all online members of a gang or group as aggressive
*/

private["_unit","_lastTime"];
_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_recursive = [_this,1,false,[false]] call BIS_fnc_param;

if (group _unit == group player || (life_gang != "0" && life_gang == _unit getVariable ["gang","0"])) exitWith {};

_lastTime = _unit getVariable ["aggressive", 0];
_unit setVariable ["aggressive", time]; // We're setting it twice but that's ok, because this must be fast as a thread lock

// If this is the initial call, notify all of your friends
if (!_recursive && _lastTime < (time - 10)) then
{
	{
		if (player distance _x < 2000) then
		{
			[[_unit,true],"life_fnc_setAggressive",_x,false] spawn life_fnc_MP;
		};
	} forEach (units player - [player]);
};

// Mark those bad guys!
{
	if (_unit distance _x < 2000) then
	{
		_x setVariable ["aggressive", time];
	};
} forEach units _unit;