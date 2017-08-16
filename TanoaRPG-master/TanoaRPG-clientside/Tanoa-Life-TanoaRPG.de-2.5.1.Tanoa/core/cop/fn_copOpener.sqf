/*
	File: fn_copOpener.sqf
	Author: CooliMC
	
	Description:
	Opens the normal Arma3 Gates and the new Tanoa Sling Gates
*/

{
	if (_x animationPhase "Door_1_rot" == 1) then
	{
		_x animate ["Door_1_rot", 0];
	} 
	else 
	{
		_x animate ["Door_1_rot", 1];
	};
} forEach (nearestObjects [player, ["Land_BarGate_F"], 25]);

{
	if (_x animationPhase "Door_1_move" == 1) then
	{
		_x animate ['Door_1_move', 0];
	} 
	else 
	{
		_x animate ['Door_1_move', 1];
	};
} forEach (nearestObjects [player, ["Land_ConcreteWall_01_m_gate_F","Land_ConcreteWall_01_l_gate_F"], 25]);