/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_search", "_string", "_caseSensetive" ];
_search = [ _this, 0, "", [""] ] call GTA_fnc_param;
_string = [ _this, 1, "", [""] ] call GTA_fnc_param;
_caseSensetive = [ _this, 2, false, [true] ] call GTA_fnc_param;

if ( !_caseSensetive ) then {

	_search = toLower _search;
	_string = toLower _string;

};

( _string find _search >= 0 )
