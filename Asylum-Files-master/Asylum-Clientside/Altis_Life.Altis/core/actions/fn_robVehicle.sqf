/*
	File: fn_robVehicle.sqf
	Author: Skalicon
	
	Description:
	Allows the player to rob the vehicle for events.
*/
private["_vehicle","_funds"];
_vehicle = cursorTarget;
if (isNull _vehicle) exitWith{
	hint"Error: Vehicle not found.";
};
if (!(_vehicle getVariable ["canRob",false])) exitWith{
	hint"You cannot rob this vehicle.";
};
_funds = _vehicle getVariable ["funds",0];
if (_funds == 0) exitWith{
	hint"This vehicle has no funds.";
	_vehicle setVariable ["canRob",false,true];
};
_vehicle setVariable ["canRob",false,true];
_vehicle setVariable ["funds",0,true];
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 3;
["cash","add",_funds] call life_fnc_uC;
hint format["You have collected $%1 in funds from the vehicle.",_funds];

