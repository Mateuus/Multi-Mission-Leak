/*
	File: fn_copOpener.sqf
	
	Description:
	Allows cops to open gates with O without getting out of the vehicle

 police sender, open gates from inside the car (only for cops) 
 by Insane
 www.tdc-clan.eu
*/

{
	if (_x animationPhase "Door_1_rot" == 1) then {
		_x animate ["Door_1_rot", 0];
	} 
	else 
	{
		_x animate ["Door_1_rot", 1];
	};
	
} forEach (nearestObjects [player, ["Land_BarGate_F"], 10]);