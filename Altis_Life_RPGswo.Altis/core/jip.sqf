/*
	File: jip.sqf
	Author: Bryan "Tonic" Boardwine
	
	Modyfied by MarkusSR1984
	
	Description:
	JIP functionality for JIP required things like vehicles.
*/

{
	_index = _x getVariable "DWEV_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn DWEV_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Car");

{
	_index = _x getVariable "DWEV_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn DWEV_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Air");

{
	_index = _x getVariable "DWEV_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn DWEV_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Ship");

/*
{
	_index = (uniformContainer _x) getVariable "DWEV_Clothes_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn DWEV_fnc_colorClothes;
	};
	
	_index = (unitBackpack _x) getVariable "DWEV_Clothes_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn DWEV_fnc_colorBackpack;
	};


} foreach (allMissionObjects "Man");
*/