/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_unit", "_drag" ];
_unit = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_drag = [ _this, 1, true, [true] ] call GTA_fnc_param;

//--- Error checks
if ( isNull _unit ) exitWith {};
if ( vehicle player != player ) exitWith {};

if ( _drag ) then {

	//--- Already dragging
	if ( _unit getVariable [ "GTA_revive_drag", false ] ) exitWith {};

	//--- Store variables
	_unit setVariable [ "GTA_revive_drag", true, true ];

	//--- Drag animation
	player playAction "grabDrag";

	//--- Attach the incapacitated unit
	_unit attachTo [ player, [ 0, 1, 0 ] ];

	//--- Terminate previous loop
	if ( !isNil "GTA_fnc_reviveDrag_loop" && { !isNull GTA_fnc_reviveDrag_loop } ) then {

		terminate GTA_fnc_reviveDrag_loop;
		waitUntil { scriptDone GTA_fnc_reviveDrag_loop };

	};

	//--- Condition loop
	GTA_fnc_reviveDrag_loop = [ _unit ] spawn {

		private "_unit";
		_unit = _this select 0;

		while { _unit getVariable [ "GTA_revive_drag", false ] } do {

			//--- Player is in vehicle
			if ( vehicle player != player ) exitWith {};

			//--- Player is dead
			if ( !alive player ) exitWith {};

			//--- Suspend
			sleep 0.1;

		};

		//--- Stop drag
		[ _unit, false ] call GTA_fnc_reviveDrag;

	};

} else {

	//--- Destroy variables
	_unit setVariable [ "GTA_revive_drag", nil, true ];

	//--- Detach the unit
	detach _unit;

};
