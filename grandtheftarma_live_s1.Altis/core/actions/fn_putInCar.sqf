private ["_unit", "_vehicle"];
_unit = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
if (isNull _unit || {!isPlayer _unit}) exitWith {};

_vehicle = nearestObjects [ASLtoAGL getPosASL player, ["Car", "Tank", "Air", "Ship", "Submarine"], 8] select 0;
if (isNil "_vehicle") exitWith {hint localize "STR_NOTF_VehicleNear"};

//--- Detach unit and move into cargo
detach _unit;
[[_unit, _vehicle], "moveInCargo", _unit] call GTA_fnc_remoteExec;
_unit setVariable ["escorting", false, true];
_unit setVariable ["transporting", true, true];
