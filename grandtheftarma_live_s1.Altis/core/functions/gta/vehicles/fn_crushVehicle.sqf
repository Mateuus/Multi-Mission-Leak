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

//--- Broadcast crushing
[ [ 0, [ "STR_GTA_ACTIONS_CRUSHING", _ownerName, _vehicleName ] ], "GTA_fnc_broadcast" ] call GTA_fnc_remoteExec;

//--- Action
if ( [ 60 + random 5, "Crushing Vehicle", "", { !isNull _this && { { alive _x && isPlayer _x } count crew _this == 0 } && { [ player, _this, 2 ] call GTA_fnc_boundingCollision } }, _vehicle ] call GTA_fnc_action ) then {

	//--- Delete the vehicle
	[ [ _vehicle, true ], "GTA_fnc_deleteVehicleFromObject", false ] call GTA_fnc_remoteExec;

	//--- Broadcast crushed
	[ [ 0, [ "STR_GTA_ACTIONS_CRUSHED", _ownerName, _vehicleName, profileName ] ], "GTA_fnc_broadcast" ] call GTA_fnc_remoteExec;

	//--- Pay
	_price = 20000;
	hint format [ localize "STR_GTA_ACTIONS_CRUSHPAY", [ _price ] call life_fnc_numberText, _vehicleName ];
	GTA_money_bank = GTA_money_bank + _price;

	//--- Add experience
	[ "crush", "Crushed Vehicle" ] call GTA_fnc_addExp;

} else {

	titleText [ "Crushing interrupted", "PLAIN" ];

};
