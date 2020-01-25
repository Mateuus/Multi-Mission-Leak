/*
	File: fn_packupCone.sqf
	
	
	Description:
	Packs up a deployed road cone.
*/
private["_cone"];
_cone = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0;
if(isNil "_cone") exitWith {};

if(([true,"roadcone",1] call life_fnc_handleInv)) then
{
	["ZA PACHOLEK!?", false] spawn domsg;
	player removeAction life_action_roadConePickup;
	life_action_roadConePickup = nil;
	deleteVehicle _cone;
};