/*
	File: fn_gateOpener.sqf

	Description:
	Open gates from inside the car.
*/
{
	if (_x animationPhase "Door_1_rot" == 1) then {
		_x animate ["Door_1_rot", 0];
	}
	else
	{
		_x animate ["Door_1_rot", 1];
	};

} forEach (nearestObjects [player, ["Land_Net_Fence_Gate_F"], 15]);