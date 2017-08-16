/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens nearby bargates
*/

private ["_gate"];

_gate = (nearestObjects [player,["Land_BarGate_F"],50]) select 0;
if(isNil "_gate")exitWith{};

if((_gate animationPhase "Door_1_rot") isEqualTo 0)then {
	_gate animateSource ["Door_1_sound_source",1];
} else {
	_gate animateSource ["Door_1_sound_source",0];
};