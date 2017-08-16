/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- Conditions
if ( GTA_actionLock ) exitWith {};
if ( player getVariable [ "incapacitated", false ] ) exitWith {};
if ( dialog ) exitWith {};
if ( player != vehicle player ) exitWith {};
if ( !alive player ) exitWith {};
if ( player getVariable [ "restrained", false ] ) exitWith {};
if ( [ "GTA_RscDisplayInteract" ] call GTA_fnc_hasDisplay ) exitWith {};

private [ "_attached", "_cursor", "_object", "_interactions" ];
_attached = attachedObjects player;
_cursor = [] call GTA_fnc_cursorTarget;
_object = objNull;

//--- Check interaction
{

	//--- Get object interactions
	_interactions = [ _x ] call GTA_fnc_getInteractions;

	//--- Check interaction count
	if ( count _interactions > 0 ) exitWith {

		_object = _x;

	};

} forEach _attached + [ _cursor ];

//--- Gather or interact
if ( isNull _object ) then {

	//--- Gathering
	switch true do {

		//--- Animals
		case ( [ _cursor, [ "Salema_F", "Ornate_random_F", "Mackerel_F", "Tuna_F", "Mullet_F", "CatShark_F", "Turtle_F" ] ] call GTA_fnc_isKindOf ): {

			if ( playerSide != civilian ) exitWith {};

			//--- Turtles
			if ( typeOf _cursor == "Turtle_F" && !alive _cursor ) then {

				[ _cursor ] call life_fnc_catchTurtle;

			} else {

				[ _cursor ] call life_fnc_catchFish;

			};

		};

		//--- Misc items
		case ( [ _cursor, [ "Land_BottlePlastic_V1_F", "Land_TacticalBacon_F", "Land_Can_V3_F", "Land_CanisterFuel_F", "Land_Suitcase_F" ] ] call GTA_fnc_isKindOf ): {

			[ _cursor ] spawn life_fnc_pickupItem;

		};

		//--- Money
		case ( typeOf _cursor == "Land_Money_F" ): {

			[ _cursor ] spawn life_fnc_pickupMoney;

		};

		//--- Gather
		default {

			[] spawn GTA_fnc_gather;

		};

	};

} else {

	//--- Set interaction display object
	GTA_RscDisplayInteract_object = _object;

	//--- Set interactions for display
	GTA_RscDisplayInteract_interactions = _interactions;

	//--- Create interaction display
	createDialog "GTA_RscDisplayInteract";

};
