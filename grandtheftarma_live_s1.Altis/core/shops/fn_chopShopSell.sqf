disableSerialization;
private ["_control", "_price", "_vehicle", "_vehicleStats", "_nearVehicles", "_className", "_vehicleName", "_owners", "_ownerUID", "_ownerName", "_actionTime"];
_control = (findDisplay 39400 displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_vehicleStats = _control lbData (lbCurSel _control);
_vehicleStats = call compile format ["%1", _vehicleStats];

//--- Retrive the nearest vehicle
_nearVehicles = nearestObjects [getMarkerPos life_chopShop, ["Car", "Truck", "Air", "Slingload_01_Base_F"], 25];
if (count _nearVehicles <= 0) exitWith {};
_vehicle = _nearVehicles select (_vehicleStats select 0);

//--- Error checks
if (isNull _vehicle) exitWith {};
if !(_vehicle in life_vehicles) exitWith {hint "You do not own keys to this vehicle"};

//--- Get the vehicle name
_className = typeOf _vehicle;
_vehicleName = getText (configFile >> "CfgVehicles" >> _className >> "displayName");

//--- Close the dialog
closeDialog 0;

//--- Owner info
_owners = _vehicle getVariable ["vehicle_info_owners", []];
_ownerUID = (_owners select 0) select 0;
_ownerName = (_owners select 0) select 1;

//--- Broadcast message
[[0, ["STR_GTA_ACTIONS_CHOPSHOP", _ownerName, _vehicleName]], "GTA_fnc_broadcast", [_ownerUID] call GTA_fnc_unitByUID] call GTA_fnc_remoteExec;

//--- Time
_actionTime = if (_vehicle isKindOf "Air") then {300} else {120};

//--- Action
if ([_actionTime + random 10, format ["Chopping %1", _vehicleName], "", {!isNull _this && {count crew _this <= 0} && {_this distance getMarkerPos life_chopShop <= 25}}, _vehicle] call GTA_fnc_action) then {
	//--- Check after action
	if(isNull _vehicle) exitWith {};

	//--- Exit if nearest vehicle does not match
	if (!(_vehicleName == (_vehicleStats select 1))) exitWith {};

	//--- Delete the vehicle
	[[_vehicle, true], "GTA_fnc_deleteVehicleFromObject", false] call GTA_fnc_remoteExec;

	//--- Message
	[[1, 2], ["STR_NOTF_ChopSoldCar", _vehicleName, [_price] call life_fnc_numberText]] call GTA_fnc_broadcast;

	//--- Update cash
	GTA_money_cash = GTA_money_cash + _price;
};
