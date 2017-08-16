/*
	File: fn_updateViewDistance.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the view distance dependant on whether the player is on foot, a car or an aircraft.
*/
switch (true) do
{
	case ((vehicle player) isKindOf "Man"): {setViewDistance ES_vdFoot};
	case ((vehicle player) isKindOf "LandVehicle"): {setViewDistance ES_vdCar};
	case ((vehicle player) isKindOf "Air"): {setViewDistance ES_vdAir};
};