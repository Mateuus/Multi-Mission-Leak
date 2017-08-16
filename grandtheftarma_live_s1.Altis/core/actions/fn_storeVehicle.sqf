params [
  "_target",
  "",
  "",
  ["_types", ["Car", "Air", "Ship", "Tank", "Slingload_01_Base_F"], []]
];

private _nearVehicles = nearestObjects [ASLtoAGL getPosASL _target, _types, 30];
private _vehicle = nil;
{
  private _owners = _x getVariable "vehicle_info_owners";
  if (alive _x && {!isNil "_owners"} && {_owners select 0 select 0 == getPlayerUID player}) exitWith {
    _vehicle = _x;
  };
  nil
} count _nearVehicles;

if (isNil "_vehicle") exitWith {hint localize "STR_Garage_NoNPC"};
if (isNull _vehicle) exitWith {};
if (!alive _vehicle) exitWith {};

if (playerSide in [west, independent]) exitWith {deleteVehicle _vehicle};

//--- Action
if ([20, "Storing Vehicle", "", {alive _this && {!isNull _this}}, _vehicle] call GTA_fnc_action) then {
  [_vehicle, false, player] remoteExec ["TON_fnc_vehicleStore", 2];
  hint localize "STR_Garage_Store_Server";
  life_garage_store = true;
};
