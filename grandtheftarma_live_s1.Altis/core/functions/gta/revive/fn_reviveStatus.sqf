/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_unit";
_unit = [_this, 0, objNull, [objNull]] call GTA_fnc_param;

//--- Error checks
if (isNull _unit) exitWith {};

switch true do {
	//--- Incapacitated
	case (_unit getVariable ["incapacitated", false]): {"INCAPACITATED"};

	//--- Dead
	case (!alive _unit): {"KILLED"};

	//--- Alive
	default {"ALIVE"};
};
