/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_class", "_logic", "_owner" ];
_class = [ _this, 0, "", [""] ] call GTA_fnc_param;
_logic = [ _class ] call GTA_fnc_getSectorLogic;

//--- Error checks
if ( _class == "" ) exitWith { false };
if ( isNull _logic ) exitWith { false };

//--- Get owner
_owner = _logic getVariable "sector_owner";
if ( isNil "_owner" ) exitWith { false };

switch ( typeName _owner ) do {

	//--- Group
	case ( typeName grpNull ): { _owner == group player };

	//--- Side
	case ( typeName sideUnknown ): { _owner == playerSide };

	//--- Player
	case ( typeName objNull ): { _owner == player };

	default { false };

};
