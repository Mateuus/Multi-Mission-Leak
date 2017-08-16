/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_value", "_t", "_h" ];
_value = [ _this, 0, 0, [0] ] call GTA_fnc_param;
_t = _value % 10;
_h = _value % 100;

str _value + ( switch true do {

	case ( _t == 1 && _h != 11 ): { "st" };
	case ( _t == 2 && _h != 12 ): { "nd" };
	case ( _t == 3 && _h != 13 ): { "rd" };
	default { "th" };

} )
