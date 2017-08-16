/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_class", "_logic", "_ownerName", "_owner" ];
_class = [ _this, 0, "", [""] ] call GTA_fnc_param;
_logic = [ _class ] call GTA_fnc_getSectorLogic;
_ownerName = "Unknown";

//--- Error checks
if ( _class == "" ) exitWith { _ownerName };
if ( isNull _logic ) exitWith { _ownerName };

//--- Get owner
_owner = _logic getVariable "sector_owner";
if ( isNil "_owner" ) exitWith { _ownerName };

_ownerName = switch ( typeName _owner ) do {

	//--- Group
	case ( typeName grpNull ): {

		private "_gangName";
		_gangName = ( group player ) getVariable "gang_name";

		//--- Gang name or 'player's' group
		if ( isNil "_gangName" ) then { profileName } else { _gangName };

	};

	//--- Side
	case ( typeName sideUnknown ): {

		//--- Side name
		switch playerSide do {

			case west: { "Police" };
			case independent: { "Independent" };
			case civilian: { "The Rebels" };

		};

	};

	//--- Player
	case ( typeName objNull ): { profileName };

};

_ownerName
