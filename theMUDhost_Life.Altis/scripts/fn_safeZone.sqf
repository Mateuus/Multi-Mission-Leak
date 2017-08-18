/*
	GrenadeStop v0.8 for ArmA 3 Alpha by Bake (tweaked slightly by Rarek)
	
	Description:
	Stops players from throwing grenades in safety zones.
	
	Configuration:
	Edit the #defines below.
*/
#define SAFETY_ZONES   [["RebelOp_01",150],["RebelOp_02",150],["RebelOp_03",150],["RebelOp_04",150]]  // Syntax: [["marker1",radius1,["marker2",radius2]]
#define MESSAGE "You are not allowed to shoot or throw grenades here."

if(isDedicated) exitWith {};
waitUntil {!isNull player};

switch (playerSide) do
{
	case west:
	{
	};
	
	case civilian:
	{
		player addEventHandler ["Fired", {
			if({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
			{
				deleteVehicle (_this select 6);
				titleText [MESSAGE, "PLAIN", 3];
			};
		}];
	};
};