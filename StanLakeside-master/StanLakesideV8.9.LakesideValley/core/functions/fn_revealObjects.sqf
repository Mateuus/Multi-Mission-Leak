/*
	
	 Reveal Objects
	 revealobjects
*/
private["_objects"];
_objects = nearestObjects[visiblePositionASL player, ["Land_CargoBox_V1_F","Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Money_F","Land_Suitcase_F","Man","Land_Sleeping_bag_blue_folded_F","Land_Screwdriver_V1_F","cg_money_stack_1","Land_Pillow_grey_F","plp_bo_BottleBitters","plp_bo_BottleBitters","Land_SatellitePhone_F"], 15];
{
	player reveal _x;
	(group player) reveal _x;
} foreach _objects;