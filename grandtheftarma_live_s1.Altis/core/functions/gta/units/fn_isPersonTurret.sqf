/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [["_unit", objNull, [objNull]]];
private "_crewData";

//--- Error checks
if ( vehicle _unit == _unit ) exitWith { false };

//--- Find crew data
_crewData = {

	if ( _x select 0 isEqualTo _unit ) exitWith { _x };

} forEach fullCrew vehicle _unit;

//--- Check if person turret
if ( !isNil "_crewData" ) then {

	_crewData select 4

} else { false };
