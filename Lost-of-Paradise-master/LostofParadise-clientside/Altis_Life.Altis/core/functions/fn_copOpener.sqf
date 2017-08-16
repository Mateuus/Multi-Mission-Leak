/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
{
if (_x animationPhase "Door_1_rot" == 1) then {
_x animate ["Door_1_rot", 0];
}
else
{
_x animate ["Door_1_rot", 1];
};
} forEach (nearestObjects [player, ["Land_BarGate_F"], 25]); //25 bedeutet ab einer nähe von 25 Metern zur Schranke, kann belibig geändert werden