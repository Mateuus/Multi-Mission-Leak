/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_vehicle", "_vehicleName", "_owners", "_ownerName", "_price" ];
_vehicle = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_vehicleName = getText ( configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName" );
_owners = _vehicle getVariable [ "vehicle_info_owners", [] ];
_ownerName = ( _owners select 0 ) select 1;

//--- Error checks
//if ( count _owners == 0 ) exitWith {};

//--- Broadcast impounding
[ [ 0, [ "STR_GTA_ACTIONS_IMPOUNDING", _ownerName, _vehicleName ] ], "GTA_fnc_broadcast" ] call GTA_fnc_remoteExec;

//--- Action
if ( [ 30 + random 5, "Impounding Vehicle", "", { !isNull _this && { { alive _x && isPlayer _x } count crew _this == 0 } && { [ player, _this, 2 ] call GTA_fnc_boundingCollision } }, _vehicle ] call GTA_fnc_action ) then {

	//--- Store the vehicle
	//[ [ _vehicle, true, player ], "TON_fnc_vehicleStore", false ] call GTA_fnc_remoteExec;
	deleteVehicle _vehicle;

	//--- Broadcast impounded
	[ [ 0, [ "STR_GTA_ACTIONS_IMPOUNDED", _ownerName, _vehicleName, profileName ] ], "GTA_fnc_broadcast" ] call GTA_fnc_remoteExec;

	//--- Pay
	_price = 4000;
	hint format [ localize "STR_GTA_ACTIONS_IMPOUNDPAY", [ _price ] call life_fnc_numberText, _vehicleName ];
	GTA_money_bank = GTA_money_bank + _price;

	//--- Add experience
	[ "impound", "Impounded Vehicle" ] call GTA_fnc_addExp;

} else {

	titleText [ "Impound interrupted", "PLAIN" ];

};
