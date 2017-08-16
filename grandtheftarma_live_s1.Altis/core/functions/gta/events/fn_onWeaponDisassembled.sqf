/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params ["_unit", "_primaryBag", "_secondarybag"];

//--- Delete bags if not disassembled by military
if ( playerSide != west ) then {
	deleteVehicle _primaryBag;
	deleteVehicle _secondarybag;
};
