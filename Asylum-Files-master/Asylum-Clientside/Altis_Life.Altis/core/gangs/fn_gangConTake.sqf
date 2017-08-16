/*
	File: fn_gangConTake.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Takes as much from the container as possible
*/

private ["_container","_near","_tooNear","_short","_captureId","_amount"];
_container = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_captureId = [_this,3,0,[0]] call BIS_fnc_param;

if (_captureId == 0) exitWith {};
_tooNear = false;
_near = getPos player nearEntities [["Man"],7];
{
	if (_x != player) exitWith { _tooNear == true; };
} forEach _near;
if (_tooNear) exitWith { hint "Another player is too close to this container for you to access it." };
if (player distance _container > 5) exitWith { hint "You're too far from the container to reach inside!" };
if (vehicle player != player) exitWith { hint "You can't access this container from inside a vehicle." };

_contents = _container getVariable ["gangContainer", []];
if (count _contents < 1) exitWith { hint "Contents of this container are not valid." };

_amount = _contents select 1;
if (_amount < 1) exitWith { hint "There's nothing inside this container!" };

_short = [_contents select 0,1] call life_fnc_varHandle;

_amount = [_short,_amount,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_amount < 1) exitWith { hint "You can't carry any more of this!" };
[true, _short, _amount] call life_fnc_handleInv;

titleText[format["You've taken %1 %2.", [_amount] call life_fnc_numberText, [_contents select 0] call life_fnc_varToStr],"PLAIN"];
_contents set [1, (_contents select 1) - _amount];
_container setVariable ["gangContainer", _contents, true];

life_capture_changed = +life_capture_list;
publicVariableServer "life_capture_changed";