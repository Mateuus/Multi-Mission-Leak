/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_number", "_return" ];
_number = [ _this, 0, 0, [0] ] call GTA_fnc_param;
_return = "";

{

	_return = _return + ( str _x );

} forEach ( _number call BIS_fnc_numberDigits );

_return
