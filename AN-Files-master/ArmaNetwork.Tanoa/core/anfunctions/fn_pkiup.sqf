#include <macro.h>
/* Checks for spikes near player */

private ["_objs","_return"];
_objs = nearestObjects [player, [], 5];
_return = false;
{
	if(["razorwire_f",str(_x)] call BIS_fnc_inString) exitWith {_return = true;};
} foreach _objs;

_return;
