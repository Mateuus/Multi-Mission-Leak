/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if ( typeName _this != typeName [] ) then { _this = [ _this ] };

private "_name";
_name = [ _this, 0, "", [""] ] call GTA_fnc_param;

switch ( count _this ) do {

	//--- Get constant
	case 1: {

		call ( missionNamespace getVariable _name );

	};

	//--- Set constant
	case 2: {

		_value = _this select 1;

		//--- Convert value to string
		_value = str _value;

		//--- Check if value type is STRING
		missionNamespace setVariable [ _name, compileFinal _value ];

	};

	default { [ "Invalid number of parameters - %1", _this ] call BIS_fnc_error; };

};
