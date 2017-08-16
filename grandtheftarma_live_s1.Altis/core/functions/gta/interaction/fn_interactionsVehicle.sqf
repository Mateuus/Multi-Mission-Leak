/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_object", "_interactions", "_hasKeys"];
_object = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
_interactions = [];
_hasKeys = _object in life_vehicles;

//--- Error checks
if !([player, _object, 2] call GTA_fnc_boundingCollision) exitWith {_interactions};

//--- Repair
_interactions pushBack ["Repair", GTA_fnc_repairVehicle, 10, "ToolKit" in items player || {"ToolKit" in itemCargo _object}, "Requires a toolkit"];

//--- Refuel - Need virtual item condition like toolkit, pls DnA
if ( life_inv_fuelF > 0 ) then {
  _interactions pushBack ["Refuel", life_fnc_jerryRefuel, 9, nil, "Requires a Full Fuel Can"];
};

if (alive _object) then {
	if (_hasKeys) then {
		//--- Unflip
		if ([_object, ["LandVehicle", "Air"]] call GTA_fnc_isKindOf) then {
			_interactions pushBack ["Unflip", GTA_fnc_unflipVehicle, 8];
		};

		if (playerSide == west && {["GTA_copRank", 0] call GTA_fnc_getConstant >= 3 || {[] call GTA_fnc_isMilitary}}) then {
			//--- Seize Cargo
			_interactions pushBack ["Seize Cargo", GTA_fnc_seizeVehicleCargo, 6];
		};

		//--- Tempest mine
		if (_object isKindOf "O_Truck_03_device_F" && {_object in life_vehicles} && {!(_object getVariable ["mining", false])}) then {
			_interactions pushBack ["Device Mine", life_fnc_deviceMine, 1];
		};

		//--- Push boat
		if (_object isKindOf "Ship_F" && {local _object}) then {
			_interactions pushBack ["Push Boat", life_fnc_pushObject, 0];
		};
	} else {
		//--- Lockpick
		if ( life_inv_lockpick > 0 || {life_inv_snapgun > 0}) then {
			_interactions pushBack ["Pick Lock", GTA_fnc_itemLockpick, 2];
		};
	};
};

//--- Pull out
if (count crew _object > 0 && {_hasKeys || {(playerSide == west || {license_civ_advrebel}) && {!canMove _object}}}) then {
	_interactions pushBack ["Pull Out", GTA_fnc_ejectVehicleCrew, 5];
};

if ( playerSide == west || { [] call GTA_fnc_isHATO } || { [ "GTA_adminLevel" ] call GTA_fnc_const >= 3 } ) then {
	//--- Registration
	_interactions pushBack ["Registration", life_fnc_searchVehAction, 7];

	if (count crew _object == 0) then {
		//--- Impound
		_interactions pushBack ["Impound", GTA_fnc_impoundVehicle, 4];

		if (playerSide == west && {_hasKeys || {!alive _object}} && {["GTA_copRank", 0] call GTA_fnc_getConstant >= 6 || {["GTA_milRank", 0] call GTA_fnc_getConstant >= 3}}) then {
			_interactions pushBack ["Crush", GTA_fnc_crushVehicle, 3];
		};
	};
};

_interactions
