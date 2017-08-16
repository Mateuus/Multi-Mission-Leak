/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params ["_unit", "_weapon"];

//--- Disable TI
if !(_weapon isKindOf "UAV_01_base_F") then {
	_weapon disableTIEquipment true;
};

//--- Delete weapon if not assembled by military
if (playerSide != west && {!license_civ_advrebel}) then {
	deleteVehicle _weapon;
};
