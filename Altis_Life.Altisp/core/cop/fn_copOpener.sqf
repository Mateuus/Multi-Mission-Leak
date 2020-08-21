/*
 police sender, open gates from inside the car (only for cops)
 by Insane
 www.tdc-clan.eu
*/
// bargate
{
 if (_x animationPhase "Door_1_rot" == 1) then {
  _x animate ["Door_1_rot", 0];
 }
 else
 {
  _x animate ["Door_1_rot", 1];
 };
 } forEach (nearestObjects [player, ["Land_BarGate_F"], 10]);
 
// another gate
{
 if (_x animationPhase "Door_1_move" isEqualTo 1) then {
 _x animate ["Door_1_move", 0];
 } else {
 _x animate ["Door_1_move", 1];
 };
} forEach (nearestObjects [player, ["Land_ConcreteWall_01_m_gate_F","Land_ConcreteWall_01_l_gate_F"], 30]);