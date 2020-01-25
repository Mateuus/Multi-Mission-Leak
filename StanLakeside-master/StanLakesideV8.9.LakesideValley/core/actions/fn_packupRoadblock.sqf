/*
	File: fn_packupRoadcones.sqf
	Author: sc
	
	Description:
	Packs up the nearest Roadcone or Roadcone strip.
*/

private["_roadblock","_roadblockobjects"];
	_roadblock = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0;
if(isNil "_roadblock") then {
	_roadblock = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0;
};
if(isNil "_roadblock") then {
	_roadblock = nearestObjects[getPos player,["Land_MetalBarrel_empty_F"],3.5] select 0;
};
if(isNil "_roadblock") exitWith {};
if(!isnil {_roadblock getVariable "roadblock"}) then
{	
	switch(true) do
	{
	case ((typeOf _roadblock) == "RoadCone_L_F"): {
	_roadblockobjects = _roadblock getVariable "roadblock";
	if(([true,"RoadBlockConc",1] call life_fnc_handleInv)) then
	{
	["Podniosles wzmocniana blokade drogowa.", false] spawn domsg;
	{deleteVehicle _x} foreach _roadblockobjects;
	};
};
	case ((typeOf _roadblock) == "RoadCone_F") : {
	_roadblockobjects = _roadblock getVariable "roadblock";
	if(([true,"RoadBlockWood",1] call life_fnc_handleInv)) then
	{
	["Podniosles drewniana blokade drogowa.", false] spawn domsg;
	{deleteVehicle _x} foreach _roadblockobjects;
	};
};
	case ((typeOf _roadblock) == "Land_MetalBarrel_empty_F") : {
	_roadblockobjects = _roadblock getVariable "roadblock";
		if(([true,"RoadBlockRebel",1] call life_fnc_handleInv)) then
	{
	["Podniosles rebeliancka blokade drogowa.", false] spawn domsg;
	{deleteVehicle _x} foreach _roadblockobjects;
	};
};
	default {nil};
	};
};