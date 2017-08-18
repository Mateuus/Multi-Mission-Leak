/*
		File: nitro.sqf
		Author: John "Paratus" VanderZwet
		
		Description: Attaches nitrous injector to a car
*/

_unit = cursorTarget;

if (!(_unit isKindOf "Car")) exitWith { hint "You can only attach a nitrous injector to a car!";};
if (vehicle player != player) exitWith { hint "You cannot add a nitrous injector to this vehicle!";};
if (!([false,"nitro",1] call life_fnc_handleInv)) exitWith { hint "You do not have any nitrous injectors?";};

life_action_inUse = true;

_upp = "Attaching nitrous injector...";
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_success = false;
while{true} do
{
	sleep 0.09;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {_success = true;};
	if(player distance _unit > 10) exitWith {};
	if(!alive player) exitWith {};
	if (!life_action_inUse) exitWith {};
};
5 cutText ["","PLAIN"];
life_action_inUse = false;

if (_success) then
{
	_unit setVariable["nitro",5,true];
	hint "Nitrous oxide injector added to vehicle (5 injections). Use custom action 4 to activate";
};