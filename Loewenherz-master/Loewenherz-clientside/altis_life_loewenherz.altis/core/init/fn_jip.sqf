/*
	File: jip.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	JIP functionality for JIP required things like vehicles.
*/

{
	_index = _x getVariable "lhm_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] call lhm_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Car");

{
	_index = _x getVariable "lhm_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] call lhm_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Air");

//{
//	_index = _x getVariable "lhm_MAN_color";
//	if(!isNil "_index") then
//	{
//		[_x,_index] call lhm_fnc_setUniformTexture;
//	};
//} foreach allPlayers;

JipDone = true;